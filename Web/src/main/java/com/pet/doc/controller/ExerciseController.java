package com.pet.doc.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pet.doc.model.ExerciseVO;
import com.pet.doc.model.UserVO;
import com.pet.doc.service.ExerciseService;
import com.pet.doc.service.LoginService;

@Controller
public class ExerciseController {
	@Autowired
	private ExerciseService exerciseService;
	@Autowired
	private LoginService loginService;

	
	@RequestMapping(value="/exercise",method=RequestMethod.GET)
	public String getExercisePage(@ModelAttribute("exerciseVO")ExerciseVO exerciseVO,
								  @ModelAttribute("UserVO") UserVO userVO,
								  HttpServletRequest request,HttpServletResponse response,HttpSession session, Model model) throws Exception {
		
		if(session.getAttribute("userId")!=null) {
			String userId =request.getSession().getAttribute("userId").toString();
			
			UserVO user = this.loginService.getwalkobj(userId);
			ExerciseVO exercise = this.exerciseService.getTodayExercise(userId);;
			
			List<ExerciseVO> exerciselist = this.exerciseService.getSevenData(userId);
			List<ExerciseVO> MonthExerciselist = this.exerciseService.getMonthData(userId);
			
			
//			if(this.exerciseService.getTodayExercise(userId) == null) {
//				exerciseService.writeExercise(userId);
//				exercise = this.exerciseService.getTodayExercise(userId);
//			}else {
//				exercise = this.exerciseService.getTodayExercise(userId);
//			}
			
			for(int i=0;i<exerciselist.size();i++) {
				if(exerciselist.get(i).getExdate()!=null) {
					model.addAttribute("exerciselist",exerciselist);
					model.addAttribute("monthlist",MonthExerciselist);
				}else {
					
					model.addAttribute("exerciselist",0);
					model.addAttribute("monthlist",0);
					model.addAttribute("walkobj",0);
					}
			}
			model.addAttribute("exercise", exercise);
			model.addAttribute("user", user);
			
		}else {
		
			model.addAttribute("exerciseVO", exerciseVO);
			model.addAttribute("userVO", userVO);
			
			return "/exercise/exercise";
		}
		return "/exercise/exercise";
	}


	
	@RequestMapping(value="/updateexercise", method=RequestMethod.GET)
	   public String getUpdateExercise(@ModelAttribute("exerciseVO")ExerciseVO exerciseVO,
			   						   @ModelAttribute("UserVO") UserVO userVO,
			   						   HttpSession session, Model model)throws Exception {
		String userId = session.getAttribute("userId").toString();
		
		if(userId == null) {
			model.addAttribute("exerciseVO", exerciseVO);
			model.addAttribute("UserVO", userVO);
			return "/exercise/updateexercise";
		}else {
			ExerciseVO exercise = this.exerciseService.getTodayExercise(userId); 
			UserVO user = this.loginService.getwalkobj(userId); 
			model.addAttribute("exercise", exercise);
			model.addAttribute("user", user);
		
			return "/exercise/updateexercise";
		}
	   }
	
	@RequestMapping(value="/updateexercise", method=RequestMethod.POST)
	   public String UpdateExercise(@ModelAttribute("exerciseVO")ExerciseVO exerciseVO,
			   						@ModelAttribute("UserVO") UserVO userVO,
			   						HttpSession session, Model model)throws Exception {
		String userId=session.getAttribute("userId").toString();
		exerciseVO.setUserId(userId);
		userVO.setUserId(userId);
		
		System.out.println("아이디 : " + exerciseVO.getUserId());
		System.out.println("목표 : " + userVO.getWalkobj());
		
		int update=this.loginService.objupdate(userVO);
		
		
		
		if(update==0) {
			model.addAttribute("msgCode","수정 실패하였습니다.");
			return "redirect:exercise";
		}else {
			model.addAttribute("userVO",userVO);
			model.addAttribute("exerciseVO",exerciseVO);
			
			return "redirect:updateexercise";
		}
	}

}
