package com.pet.doc.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pet.doc.model.PetVO;
import com.pet.doc.model.UserVO;
import com.pet.doc.service.LoginService;
import com.pet.doc.service.PetService;
import com.pet.doc.util.AES256Util;


@Controller 
//@RequestMapping("/user")
public class LoginController {
	
	@Autowired
	private LoginService loginService;	
	
	@Autowired
	private PetService petService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
		public String getLogin(Model model) {
			model.addAttribute("userVO", new UserVO());
			return "/user/login";
		}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String onSubmit(HttpSession session, @Valid UserVO userVO, BindingResult result, Model model, RedirectAttributes rea)  throws Exception {
		
		if (result.hasFieldErrors("userId")||result.hasFieldErrors("passwd"))  {
			model.addAllAttributes(result.getModel());
			return "redirect:/mainpage";
		}
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		UserVO loginUser = this.loginService.getUser(userVO.getUserId());
		
		System.out.println(loginUser);
			
		if(loginUser != null && passwordEncoder.matches(userVO.getPasswd(), loginUser.getPasswd())) {
			session.setAttribute("userId", loginUser.getUserId()); //세션에 변수등록
			session.setAttribute("nickname", loginUser.getNickname()); //세션에 변수등록
			session.setAttribute("userName", loginUser.getName()); 
			session.setAttribute("phone", loginUser.getPhone());
			rea.addAttribute("loginResult", 1);
			return "redirect:/mainpage";
		}else {
			model.addAttribute("userId","");
			model.addAttribute("passwd","");
			
			model.addAttribute("errMsg", "아이디나 패스워드가 일치하지 않습니다");
			model.addAllAttributes(result.getModel());
			return "/user/login";
		}
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session,SessionStatus status, RedirectAttributes rea) {
		session.invalidate();
		status.setComplete();
		rea.addAttribute("loginResult", 0);
		return "/mainpage";
	}
	
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET) //ID중복체크
	@ResponseBody 
	public String idCheck( HttpServletRequest request){

		String userId = request.getParameter("userId");
		  
		JSONObject  obj = new JSONObject();
	
		UserVO loginUser = this.loginService.getUser(userId);
	
		if(loginUser != null){
				obj.put("msg", "false");
				return obj.toString();
			}
			else {
				obj.put("msg", "true");
				return obj.toString();
			}
	}
	
	// 닉네임 중복체크
	@RequestMapping(value = "/nicknameCheck", method = RequestMethod.GET) 
	@ResponseBody 
	public String nicknameCheck( HttpServletRequest request){

		String nickname = request.getParameter("nickname");
		  
		JSONObject  obj = new JSONObject();
	
		UserVO loginUser = this.loginService.getUser(nickname);
	
		if(loginUser != null){
				obj.put("msg1", "false");
				return obj.toString();
			}
			else {
				obj.put("msg1", "true");
				return obj.toString();
			}
	}
	
	@RequestMapping(value = "/join",method = RequestMethod.GET)
	public String toUserEntryView(Model model) {
		model.addAttribute("userVO", new UserVO());
		return"/user/join";
	}
	
	
	@RequestMapping(value="/join", method = RequestMethod.POST)//�엯�젰�뤌 �궡�슜 ���옣
	public String onSubmit2(@Valid UserVO userVO, BindingResult result,  Model model) throws Exception {

		if (result.hasErrors()) {
			model.addAllAttributes(result.getModel());
			return "/user/join";
		}
	
	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	String hashPass = passwordEncoder.encode( userVO.getPasswd());
	userVO.setPasswd(hashPass);
	
	Path filePath = Paths.get("D:/jj/key3.txt");
	String key = Files.readString(filePath);
	
	AES256Util aes256 = new AES256Util(key);
	
	//String hashBirthday = aes256.aesEncode(userVO.getBirthday());
	//userVO.setBirthday(hashBirthday);
	
	    
	    if(this.loginService.insertUser(userVO) != 0)   {
	    	userVO.setPasswd(""); //패스워드 자동 출력되지 않게
	    	model.addAttribute("userVO", userVO);
	    	model.addAttribute("msgCode","등록되었습니다. 로그인하여 주십시오.");// �벑濡앹꽦怨�
	    	return "/user/login";
	    }
	    else {
	    	model.addAttribute("msgCode", "등록실패하였습니다. 다시 시도하여 주십시오.");// �벑濡앹떎�뙣
	    	return "/user/join";    
	    }

	}
	@RequestMapping(value="/findid",method=RequestMethod.GET)
	public String toFindIdForm(Model model) {
		model.addAttribute("userVO",new UserVO());
		return "/user/findid";
	}
	
	@RequestMapping(value="/findid",method=RequestMethod.POST)
	public String findIdSubmit(@Valid UserVO userVO, BindingResult result, Model model) throws Exception {
		
		if(result.hasFieldErrors("name")||result.hasFieldErrors("phone")) {
			model.addAllAttributes(result.getModel());
			return "/user/findid";
		}
		
		UserVO findId=this.loginService.findId(userVO); 
		
		System.out.println(findId);//null값이 넘어옴 
		if(findId == null) {
			model.addAttribute("msgCode", "<font style='color:red;font-weight:bold;'>회원님의 정보와 일치하는 아이디가 없습니다</font>");
			return "/user/findid";
		}else {
			String name = findId.getName();
			String id = findId.getUserId();
			model.addAttribute("msgCode", "<b>"+name+"</b>님의 아이디는 <b>"+id+"</b>입니다");
			return "/user/findid";
			
		}
	}
	@RequestMapping(value="/findpasswd",method=RequestMethod.GET)
	public String toFindPassForm(Model model) {
		model.addAttribute("userVO",new UserVO());
		return "/user/findpasswd";
	}
	
	@RequestMapping(value="/findpasswd",method=RequestMethod.POST)
	public String findPassSubmit(@Valid UserVO userVO,BindingResult result,Model model) throws Exception{
		if(result.hasFieldErrors("userId")||result.hasFieldErrors("phone")) {
			model.addAllAttributes(result.getModel());
			return "/user/findpasswd";
		}
		UserVO findUser=this.loginService.findPass(userVO);
		
		if(findUser!=null) {
			model.addAttribute("userVO",findUser);
			return "/user/updatePass";
			
		}else {
			model.addAttribute("errMsg","아이디나 휴대폰 번호 정보가 일치하지 않습니다");
			System.out.println(findUser);
			return "/user/findpasswd";
		}
	}
	@RequestMapping(value="/updatePass",method=RequestMethod.GET)
	public String toupdatePassForm(Model model) {
		model.addAttribute("userVO",new UserVO());
		return "/user/updatePass";
	}
	@RequestMapping(value="/updatePass",method=RequestMethod.POST)
	public String updatePass(@Valid UserVO userVO,BindingResult result,Model model) throws Exception{
	
		
		if(result.hasFieldErrors("userId")||result.hasFieldErrors("passwd")) {
			model.addAllAttributes(result.getModel());
			System.out.println("1");
			return "/user/updatePass";
		}
		
		//패스워드암호화
		BCryptPasswordEncoder passwordEncoder= new BCryptPasswordEncoder();
		String hashPass = passwordEncoder.encode(userVO.getPasswd());
		userVO.setPasswd(hashPass);//암호화된 passwd로 변경
				
		
		if(this.loginService.updatePass(userVO)==1) {
			userVO.setPasswd("");
			model.addAttribute("userId", userVO.getUserId());
			model.addAttribute("msgCode", "패스워드가 변경되었습니다.");
			System.out.println(3);
			return "/user/login";
		}
		else {
			model.addAttribute("errMsg","패스워드 변경에 실패하였습니다");
			System.out.println("4");
			return "/user/updatePass";
		}
	
	}
	
	//마이페이지
	@RequestMapping(value="/mypage", method = RequestMethod.GET)
	public String toUserEditView(@ModelAttribute("petVO") PetVO petVO,HttpSession session, Model model)throws Exception{
		
		String userId=session.getAttribute("userId").toString();
		UserVO loginUser=this.loginService.getUser(userId);
		
		if(loginUser==null) {
			model.addAttribute("userVO",userId);
			model.addAttribute("msgCode","등록되지않은 아이디입니다.");
			return "/user/login";
		}
		else {
			//암호화된 password 삭제
			loginUser.setPasswd("");
			
			//생년월일 복호화 aes256
			Path filePath = Paths.get("D:/jj/key3.txt");
			String key = Files.readString(filePath);
			AES256Util aes256 = new AES256Util(key);
			
			List<PetVO> plist = this.petService.getPetList(userId);
			
			model.addAttribute("petList", plist);
			model.addAttribute("petVO", petVO);
			
			model.addAttribute("userVO",loginUser);
			return "/user/mypage";
		}
		
	}
	
	//프로필 수정
	@RequestMapping(value="/mypage",method=RequestMethod.POST)
	public String onEditSave(@ModelAttribute("petVO") PetVO petVO, HttpSession session,@Valid UserVO userVO,BindingResult result, Model model) throws Exception{
		//session.setAttribute("userId",userVO.getUserId());
		
		if(result.hasFieldErrors("userId")||result.hasFieldErrors("passwd") ||result.hasFieldErrors("phone")||result.hasFieldErrors("nickname")) {
			model.addAttribute(result.getModel());
			System.out.println("오류00");
			return "/user/mypage";
		}
		
		
		String userId=session.getAttribute("userId").toString();
		userVO.setUserId(userId);
		
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		
		UserVO loginUser = this.loginService.getUser(userId); 
		
		
		
		if(passwordEncoder.matches(userVO.getPasswd(), loginUser.getPasswd())){
			int Userupdate=this.loginService.updateUser(userVO);
			
			if(Userupdate == 0) {
				model.addAttribute("msgCode","프로필 수정 실패하였습니다.");
				return "/user/mypage";
			}
			else {
				model.addAttribute("msgCode","프로필 수정 되었습니다");
				model.addAttribute("userVO",userVO);
				return "/user/mypage";
			}
		}else {
				model.addAttribute("errMsg", "<font style='color:red;font-weight:bold;'>비밀번호가 일치하지 않습니다</font>");
				return "/user/mypage";
		}	
		
		
	
		
	}
	
	//반려동물추가하기버튼 클릭
	   @RequestMapping(value="/addpetForm", method=RequestMethod.GET)
	   public String addpetForm() {
	      return "/user/addpetForm";
	   }
	   
	   
	   //반려동물 추가하기
		@RequestMapping(value="/addpetForm", method=RequestMethod.POST)
		public String addpetForm(@ModelAttribute("petVO") PetVO petVO, 
				HttpSession session, Model model) throws Exception {
			
			String userId = session.getAttribute("userId").toString();

			petService.writeArticle(petVO);
			
			int pno = petVO.getPno(); 

			return "/user/mypage";    
		}

	
	//반려동물 정보 삭제
	
	  @RequestMapping(value = "/deleteArticle")
	   public String petDelete(HttpServletRequest request, HttpSession session, RedirectAttributes rea){
		  String userId = session.getAttribute("userId").toString();
		  
	      int pno = Integer.parseInt(request.getParameter("pno"));
	   
	       petService.deleteArticle(pno);
	         return "redirect:mypage";
	      }
	  
	  
	  //반려동물 정보 수정 GET
	   @RequestMapping(value="/updatepetForm", method=RequestMethod.GET)
	   public String updatepet(@RequestParam(value = "pno", required = false, defaultValue="0")
	   int pno, HttpSession session, Model model) throws Exception {

		  String userId = session.getAttribute("userId").toString();
		   
		  PetVO petVO = petService.getArticle(pno);
		  
		  
		  model.addAttribute("pet", petVO);
		  
	      return "/user/updatepetForm";
	   }
	   
	   
	   
	   //반려동물 정보 수정 POST
	   @RequestMapping(value = "/updatepetForm", method=RequestMethod.POST)  
	   public String  calendarModifyProc(@ModelAttribute("PetVO") PetVO petVO,HttpSession session, MultipartHttpServletRequest request,  Model model){

		   String userId = session.getAttribute("userId").toString();
	   
		   petVO.setUserId(userId);
	      
	      if(this.petService.updateArticle(petVO) !=0) {
	    	   model.addAttribute("petVO", petVO); //수정 성공
				return "redirect:updatepetForm";
				
			}else {
			model.addAttribute("msgCode", "수정실패"); //수정 실패

	      return "redirect:updatepetForm";
	      
	      
	      
			}
	   }
	   
	      
	   


	  //유저 탈퇴
	
	@RequestMapping(value="/deluser",method=RequestMethod.GET)
	public String toDelUserdForm(HttpSession session,Model model) {
		String userId = session.getAttribute("userId").toString();
		UserVO loginUser = this.loginService.getUser(userId);
		
		if(loginUser == null) {
			model.addAttribute("userVO",loginUser);
			model.addAttribute("msgCode","등록되지않은 아이디입니다.");
			System.out.println("로그인유저"+loginUser);
			return "/user/deluser";
		}else {
			model.addAttribute("userVO",userId);
			return "/user/deluser";
		}
		
		
	}
	@RequestMapping(value="/deluser",method=RequestMethod.POST)
	public String DelUserSubmit(HttpSession session,@Valid UserVO userVO, BindingResult result, Model model) throws Exception {

		if(result.hasFieldErrors("userId")||result.hasFieldErrors("passwd") ||result.hasFieldErrors("phone")) {
			model.addAttribute(result.getModel());
			return "/user/deluser";
		}
		
		String userId = session.getAttribute("userId").toString();
		UserVO loginUser = this.loginService.getUser(userId);
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		
		if(passwordEncoder.matches(userVO.getPasswd(), loginUser.getPasswd()) && userVO.getPhone().equals(loginUser.getPhone())) {
			int delUser = this.loginService.deluser(loginUser);
			
			if(delUser != 0) {
				model.addAttribute("msgCode", "회원 탈퇴 되었습니다");
				userVO.setUserId("");
				userVO.setPasswd("");
				session.invalidate();
				return "/user/login";	
			}else {
				model.addAttribute("errMsg", "<font style='color:red;font-weight:bold;'>회원 탈퇴에 실패했습니다</font>");
				return "/user/deluser";
			}
		}else {
			model.addAttribute("errMsg", "<font style='color:red;font-weight:bold;'>비밀번호나 전화번호가 일치하지 않습니다</font>");
			return "/user/deluser";
		}
		


	}
	
	
	
}