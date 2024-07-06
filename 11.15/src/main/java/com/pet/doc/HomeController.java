package com.pet.doc;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pet.doc.model.BoardVO;
import com.pet.doc.model.CalendarVO;
import com.pet.doc.model.ExerciseVO;
import com.pet.doc.model.SearchVO;
import com.pet.doc.model.UserVO;
import com.pet.doc.service.BoardService;
import com.pet.doc.service.CalendarService;
import com.pet.doc.service.ExerciseService;
import com.pet.doc.service.LoginService;

@Controller
	public class HomeController {


	@Autowired
	private CalendarService calendarService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private ExerciseService exerciseService;

	@Autowired
	private LoginService loginService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(@ModelAttribute("SearchVO") SearchVO searchVO,
		   @ModelAttribute("CalendarVO") CalendarVO calendarVO,
		   @ModelAttribute("exerciseVO")ExerciseVO exerciseVO,
		   @ModelAttribute("UserVO") UserVO userVO,
		   HttpSession session, Model model) throws Exception {
		if(session.getAttribute("userId") != null) {

			//게시판
		    List<BoardVO> newlist = boardService.getBoardList(searchVO);
			model.addAttribute("newboardList", newlist);

			List<BoardVO> bestlist = boardService.getweekBestBoardList(searchVO);
			model.addAttribute("bestboardList", bestlist);
			model.addAttribute("searchVO", searchVO);

			//캘린더
			String userId = session.getAttribute("userId").toString();
			System.out.println("/calendar get 테스트");
			System.out.println("userid : " + userId);

			List<CalendarVO> clist = this.calendarService.getCalendarList(userId);
			System.out.println("리스트 : " + clist);

			model.addAttribute("calendarList", clist);
			model.addAttribute("calendarVO", calendarVO);

			//운동
			ExerciseVO exercise = this.exerciseService.getTodayExercise(userId);
			List<ExerciseVO> exercise2=this.exerciseService.getSevenData(userId);
			UserVO user = this.loginService.getwalkobj(userId);

			model.addAttribute("exercise", exercise);
			model.addAttribute("exdate",exercise2);
			model.addAttribute("user", user);
			model.addAttribute("loginResult", 1);
			return "/mainpage";
		}else {
			//게시판
		    List<BoardVO> newlist = boardService.getBoardList(searchVO);
			model.addAttribute("newboardList", newlist);

			List<BoardVO> bestlist = boardService.getweekBestBoardList(searchVO);
			model.addAttribute("bestboardList", bestlist);
			model.addAttribute("searchVO", searchVO);

			model.addAttribute("calendarVO", calendarVO);
			model.addAttribute("exerciseVO", exerciseVO);
			model.addAttribute("loginResult", 0);
			model.addAttribute("userVO", userVO);
			return "/mainpage";
		}
	}

	@RequestMapping(value="/mainpage", method=RequestMethod.GET)
	public String getmainpage(@ModelAttribute("SearchVO") SearchVO searchVO,
			   @ModelAttribute("CalendarVO") CalendarVO calendarVO,
			   @ModelAttribute("exerciseVO")ExerciseVO exerciseVO,
			   @ModelAttribute("UserVO") UserVO userVO,HttpSession session, Model model) throws Exception {


		if(session.getAttribute("userId") != null) {

			//게시판
		    List<BoardVO> newlist = boardService.getBoardList(searchVO);
			model.addAttribute("newboardList", newlist);

			List<BoardVO> bestlist = boardService.getweekBestBoardList(searchVO);
			model.addAttribute("bestboardList", bestlist);
			model.addAttribute("searchVO", searchVO);

			//캘린더
			String userId = session.getAttribute("userId").toString();
			System.out.println("/calendar get 테스트");
			System.out.println("userid : " + userId);

			List<CalendarVO> clist = this.calendarService.getCalendarList(userId);
			System.out.println("리스트 : " + clist);

			model.addAttribute("calendarList", clist);
			model.addAttribute("calendarVO", calendarVO);

			//운동
			ExerciseVO exercise = this.exerciseService.getTodayExercise(userId);
			List<ExerciseVO> exercise2=this.exerciseService.getSevenData(userId);
			UserVO user = this.loginService.getwalkobj(userId);

			model.addAttribute("exercise", exercise);
			model.addAttribute("exdate",exercise2);
			model.addAttribute("user", user);
			model.addAttribute("loginResult", 1);
			return "/mainpage";
		}else {
			//게시판
		    List<BoardVO> newlist = boardService.getBoardList(searchVO);
			model.addAttribute("newboardList", newlist);

			List<BoardVO> bestlist = boardService.getweekBestBoardList(searchVO);
			model.addAttribute("bestboardList", bestlist);
			model.addAttribute("searchVO", searchVO);

			model.addAttribute("calendarVO", calendarVO);
			model.addAttribute("exerciseVO", exerciseVO);
			model.addAttribute("userVO", userVO);
			model.addAttribute("loginResult", 0);
			return "/mainpage";
		}

	}


}



