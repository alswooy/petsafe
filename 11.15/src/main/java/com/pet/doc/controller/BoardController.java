package com.pet.doc.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pet.doc.model.AttFileVO;
import com.pet.doc.model.BoardLikeVO;
import com.pet.doc.model.BoardVO;
import com.pet.doc.model.ReplyLikeVO;
import com.pet.doc.model.ReplyVO;
import com.pet.doc.model.SearchVO;
import com.pet.doc.model.UserVO;
import com.pet.doc.service.BoardService;

@Controller
//@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;

	
	@RequestMapping(value="/maincommunite", method=RequestMethod.GET)
	public String getmaincommunite(@ModelAttribute("searchVO") SearchVO searchVO, Model model, HttpSession session) throws Exception {
		
		List<BoardVO> newlist = boardService.getBoardList(searchVO); 
		model.addAttribute("newboardList", newlist);
		
		List<BoardVO> bestlist = boardService.getweekBestBoardList(searchVO); 
		model.addAttribute("bestboardList", bestlist);
		
		model.addAttribute("searchVO", searchVO);
		
		return "/communite/maincommunite";
	}
	
	
	@RequestMapping(value = "/generalForum", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("searchVO") SearchVO searchVO, Model model, HttpSession session) throws Exception {
		
		List<BoardVO> newlist = boardService.getBoardList(searchVO); 
		model.addAttribute("newboardList", newlist);
		
		StringBuffer pageUrl = boardService.getPageUrl(searchVO);
		model.addAttribute("pageHttp", pageUrl);
		
		model.addAttribute("searchVO", searchVO);
		return "/communite/generalForum";
	}
	
	
	@RequestMapping(value = "/generalForumBest", method = RequestMethod.GET)
	public String bestlistPage(@ModelAttribute("searchVO") SearchVO searchVO, Model model, HttpSession session) throws Exception {
		
		List<BoardVO> bestlist = boardService.getBestBoardList(searchVO); 
		model.addAttribute("bestboardList", bestlist);
		
		StringBuffer pageUrl = boardService.getPageUrl2(searchVO);
		model.addAttribute("pageHttp", pageUrl);
		
		model.addAttribute("searchVO", searchVO);
		return "/communite/generalForumBest";
	}

	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String boardWrite(){
	return "/communite/write";
	}
	 
	String uploadPath = "C:\\upload\\"; // file upload path 

	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String boardWriteProc(@ModelAttribute("BoardVO") BoardVO boardVO, 
	        MultipartHttpServletRequest mrequest){
		String  content = boardVO.getContent().replaceAll("<","&lt;");
		content = content.replaceAll(">","&gt;");
		content = content.replaceAll("&","&amp;"); 
		content = content.replaceAll("\"","&quot;"); 
		content = content.replaceAll("\r\n", "<br/>");

		boardVO.setContent(content);
		boardService.writeArticle(boardVO);
		
		int bno = boardVO.getBno(); 
			
		AttFileVO file = new AttFileVO();
		List<MultipartFile> fileList = mrequest.getFiles("file"); 
	
		for (MultipartFile mf : fileList) {
			if (!mf.isEmpty()) {
				String originFileName = mf.getOriginalFilename(); // 원문 파일 명
				long fileSize = mf.getSize(); // 파일 사이즈
				
				file.setBno(bno);
				file.setOfilename(originFileName);
				file.setSfilename(originFileName); //디스크에 파일 저장시 동일 파일명 발생 댑;: 현재 처리 안함  
				file.setFilesize(fileSize); 
				     
				boardService.insertFile(file);//테이블에 파일 정보 저장
				   
	        	String safeFile = uploadPath +  originFileName; // 디스크에 파일 저장  
						
				try {
				    mf.transferTo(new File(safeFile)); // 디스크에 파일 저장
		        }catch (IllegalStateException e) {
		            e.printStackTrace();
		        }catch (IOException e) {
		            e.printStackTrace();
		        }	
			}
		}
		
		return "redirect:generalForum";     
	
	}
	
	
	@RequestMapping("/view")
	public String boardView(@RequestParam(value = "bno", required = false, defaultValue="0") int bno, HttpSession session, Model model) throws Exception {

	  String userId = (String) session.getAttribute("userId"); 

	  BoardVO boardVO = boardService.getArticle(bno); //get selected article model

	  List<ReplyVO> reply = boardService.getReplyList(bno);
	  List<AttFileVO> fileList = boardService.getFileList(bno); //첨부파일 목록 읽어 오기-list

	  model.addAttribute("board", boardVO);
	  model.addAttribute("replyList", reply);
	  model.addAttribute("fileList", fileList);

	  return "/communite/view";
	}
	
	@RequestMapping("/writeReply")
	public String replyWriteProc(@ModelAttribute("replyVO") ReplyVO replyVO,
			HttpServletRequest request, HttpSession session, RedirectAttributes rea){
		
		String userId = session.getAttribute("userId").toString();
		
		if (replyVO.getContent().isEmpty()) {
			rea.addAttribute("errCode", "1");
		}else if(userId == null){ 
			rea.addAttribute("errCode", "5");
			rea.addAttribute("bno", replyVO.getBno());
			System.out.println("userId : "+userId);
			return "redirect:view";
		}else if(replyVO.getUserId() == null){
			rea.addAttribute("errCode", "5");
			System.out.println("replay : "+replyVO.getUserId());
		}else {
			String  content = replyVO.getContent().replaceAll("<","&lt;");
			content = replyVO.getContent().replaceAll(">","&gt;");
			content = replyVO.getContent().replaceAll("&","&amp;"); 
			content = replyVO.getContent().replaceAll("\"","&quot;"); 
			content = replyVO.getContent().replaceAll("\r\n", "<br />");
		
			replyVO.setContent(content);
		
			boardService.writeReply(replyVO);
		}

	rea.addAttribute("bno", replyVO.getBno());

	return "redirect:view";
	}
	
	  @RequestMapping("/recommend")
	   public String updateRecommendCnt(HttpServletRequest request, HttpSession session, RedirectAttributes rea){

	   int bno = Integer.parseInt(request.getParameter("bno")); 
	   String userId = (String) session.getAttribute("userId"); 

	   if( userId==null){ //비회원이면 추전 불가
		   rea.addAttribute("bno", bno);
		   rea.addAttribute("errCode", "4");
		   return "redirect:view";
	   }

	   BoardLikeVO boardLike = new BoardLikeVO();
	   boardLike.setBno(bno);
	   boardLike.setUserId(userId);

	   BoardVO board = boardService.getArticle(bno);

	   if( board.getUserId().equals(userId)){
	   	rea.addAttribute("errCode", "3");                //본인 글은 추천 불가
	   } else {
	   if (boardService.getBoardLike(boardLike) == 0 ) {  //이미 추천한 기록이 없으면
		   boardService.incrementGoodCnt(bno);
		   boardService.addBoardLike(boardLike);         //추천 기록 등록
	   }else {
	        rea.addAttribute("errCode", "2");           //이미 추천했던 글이면 추천 불가 
	        }
	   }
	   rea.addAttribute("bno", bno);
	   return "redirect:view";
	   }
	  
	  @RequestMapping("/recommendCheck")
	   public String RecommendCheck(HttpServletRequest request, HttpSession session, RedirectAttributes rea){
		   int bno = Integer.parseInt(request.getParameter("bno")); 
		   String userId = (String) session.getAttribute("userId"); 
		   BoardVO board = boardService.getArticle(bno);
		   
		   System.out.println("test : " + userId);
		   if(userId != null) {
			   System.out.println("Nickname : " + userId);
			   BoardLikeVO boardLike = new BoardLikeVO();
			   boardLike.setBno(bno);
			   boardLike.setUserId(userId);
			   
			   if(boardService.getBoardLike(boardLike) == 0) {
				   rea.addAttribute("errCode", "6");
			   }else{
				   rea.addAttribute("errCode", "7");
			   }
		   }else {
			   System.out.println("Nickname : " + userId + "()");
			   rea.addAttribute("errCode", "6");
		   }
		   
		   rea.addAttribute("bno", bno);
		   return "redirect:view";
		  
	  }
	  
	  //댓글 삭제
	   @RequestMapping("/deleteReply")
	   public String commentDelete(HttpServletRequest request, HttpSession session, RedirectAttributes rea){

	   int rno = Integer.parseInt(request.getParameter("rno"));
	   int bno = Integer.parseInt(request.getParameter("bno"));

	   String userId = (String) session.getAttribute("userId");
	   ReplyVO reply = boardService.getReply(rno);

	   if(!userId.equals(reply.getUserId())){
		   rea.addAttribute("errCode", "1");
	   } else {
	   		boardService.deleteReply(rno);
	   		boardService.decreaseReplyCnt(bno);
	   }

	   rea.addAttribute("bno", bno); // move back to the article

	   return "redirect:view";
	   }
	   
	   @RequestMapping(value = "/recommandReply")
	   public String updateRecommendReply(HttpServletRequest request, HttpSession session, RedirectAttributes rea){

	      int bno = Integer.parseInt(request.getParameter("bno")); 
	      int rno = Integer.parseInt(request.getParameter("rno")); 
	      String userId = (String) session.getAttribute("userId"); 
	   
	      if( userId==null){
	         rea.addAttribute("bno", bno);
	         rea.addAttribute("errCode", "4");;
	         return "redirect:view";
	      }
	   
	      ReplyLikeVO replyLike = new ReplyLikeVO();
	      replyLike.setRno(rno);
	      replyLike.setUserId(userId);
	   
	      ReplyVO reply = boardService.getReply(rno);
	   
	      if(reply.getUserId().equals(userId)){
	         rea.addAttribute("errCode", "3");
	      } else {
	         if (boardService.getReplyLike(replyLike) == 0 ) {
	        	 
	            boardService.incReplyGoodCnt(rno);
	            boardService.addReplyLike(replyLike);
	            
	         } else {
	                  rea.addAttribute("errCode", "2");
	             }
	      }
	      rea.addAttribute("bno", bno);
	      return "redirect:view";
	   }
	   
	   
	   
	   @RequestMapping(value = "/filedown")
	   @ResponseBody
	   public byte[] downProcess(HttpServletResponse response, @RequestParam String fileName ) throws IOException {
	   
	      File file = new File("c:/upload/" + fileName);
	      byte[] bytes = FileCopyUtils.copyToByteArray(file); //SPRING 5.0 이상 
	   
	      String fn = new String(file.getName().getBytes(), "iso_8859_1");
	   
	      response.setHeader("Content-Disposition", "attachment;filename=\"" + fn + "\"");
	      response.setContentLength(bytes.length);
	   
	      return bytes;
	   }

	   
	   @RequestMapping(value = "/modify", method=RequestMethod.GET )
	   public String boardModify(HttpServletRequest request, HttpSession session, Model model){

	      String userId = (String) session.getAttribute("userId");
	      int bno = Integer.parseInt(request.getParameter("bno"));
	   
	      BoardVO board = boardService.getArticle(bno);
	   
	      String content = board.getContent().replaceAll("<br>", "&nbsp");
	      board.setContent(content); 
	   
	      if(!userId.equals(board.getUserId())){
	         model.addAttribute("errCode", "5"); //작성자만  글수정 가능
	         model.addAttribute("bno", bno);
	         return "redirect:view";
	      } else {//회원 글수정
	         // 첨부파일 읽어 오기 - list
	         List<AttFileVO> fileList = boardService.getFileList(bno);
	      
	         model.addAttribute("board", board);
	         model.addAttribute("fileList", fileList);
	         return "/communite/modify";
	      }
	   }
	   
	   //게시판 글 수정
	   @RequestMapping(value = "/modify", method=RequestMethod.POST)  
	   public String  boardModifyProc(@ModelAttribute("Board") BoardVO board, MultipartHttpServletRequest request, RedirectAttributes rea ){
	   
	      String content =  board.getContent().replaceAll("&nbsp", "<br>"); //java 새줄 코드 HTML줄바꾸기로
	      board.setContent(content);
	   
	      boardService.updateArticle(board);
	   
	      int bno = board.getBno(); 
	   
	   
	      //체크된 파일을 테이블과 디스크에서 삭제한다.
	      String[] fileno = request.getParameterValues("fileno");
	   
	      if (fileno != null) {
	   
	         for (String fn : fileno) {
	      
	             int fno = Integer.parseInt(fn);
	             
	             String oFileName = boardService.getFileName(fno);
	            
	             String safeFile = uploadPath +  oFileName;
	             
	             File removeFile = new File(safeFile);// remove disk uploaded file 
	             removeFile.delete();
	                 
	             boardService.deleteFile(fno); //remove table uploaded file 
	             
	             
	         }
	      }
	        AttFileVO file = new AttFileVO ();

	        //새첨부 파일  목록 일어오기
	        List<MultipartFile> fileList = request.getFiles("file");
	       
	        for (MultipartFile mf : fileList) {
	           if (!mf.isEmpty()) {
	               String originFileName = mf.getOriginalFilename(); // 새첨부파일 원본 파일 명
	              long fileSize = mf.getSize(); // 파일 사이즈
	               
	               file.setBno(bno);
	               file.setFilesize(fileSize); 
	               file.setOfilename(originFileName);
	               file.setSfilename(originFileName);
	                    
	               boardService.insertFile(file); // 테이블에 파일 저장 
	      
	               String safeFile = uploadPath +  originFileName; 
	   
	               try {
	                   mf.transferTo(new File(safeFile)); // 디스크에 파일 저장 
	               } catch (IllegalStateException e) {
	                   e.printStackTrace();
	               } catch (IOException e) {
	                   e.printStackTrace();
	               }
	           }
	      }
	      rea.addAttribute("bno", board.getBno());
	      return "redirect:view";
	   }
	   
	   

	   @RequestMapping(value = "/delete")
	   public String boardDelete(HttpServletRequest request, HttpSession session, RedirectAttributes rea){
	      String userId = (String) session.getAttribute("userId");
	      int bno = Integer.parseInt(request.getParameter("bno"));
	   
	      BoardVO board = boardService.getArticle(bno);
	   
	    
	      if(userId.equals(board.getUserId())){
	         //답글 삭제 
	         List<ReplyVO> reply = boardService.getReplyList(bno); 
	         if(reply.size() > 0){
	            boardService.deleteReplyBybno(bno);
	         }
	         
	         //첨부 파일명 삭제, 실제 파일 삭제 
	         List<AttFileVO> files  = boardService.getFileList(bno); 
	         
	         if(files.size() > 0){
	              //저장된  실제 파일 삭제
	            for (AttFileVO filedel : files) {
	               String f_stor_all = filedel.getOfilename();
	               File f = new File(session.getServletContext().getRealPath("/") + f_stor_all); 
	               f.delete();
	            }
	            boardService.deleteFileBybno(bno); //테이블에서 해당 번호 글 첨부 file 전체 삭제
	         }
	         //board 삭제
	         boardService.deleteArticle(bno);
	         return "redirect:generalForum";
	      } else {
	         rea.addAttribute("errCode", "1");
	         rea.addAttribute("bno", bno);
	         return "redirect:view";
	      }
	      
	   }







	



}
