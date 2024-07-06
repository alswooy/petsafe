package com.pet.doc.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pet.doc.model.CalendarVO;
import com.pet.doc.service.CalendarService;

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarService calendarService;
	
		@RequestMapping(value="/calendar", method=RequestMethod.GET)
		   public String gatCalenderPage(@ModelAttribute("calendarVO") CalendarVO calendarVO,HttpSession session, Model model) throws Exception {
			
			LocalDate now = LocalDate.now();
			
			if(session.getAttribute("userId") != null) {
				String userId = session.getAttribute("userId").toString();
	
				List<CalendarVO> clist = this.calendarService.getCalendarList(userId); 
				
				model.addAttribute("calendarList", clist);
				model.addAttribute("calendarVO", calendarVO);
				model.addAttribute("dayCheck", now);
				return "/calendar/calendar";
			}else {
				System.out.println("userid가 null");
				model.addAttribute("calendarVO", calendarVO);
				return "/calendar/calendar";
			}
	   }
		
		@RequestMapping(value="/calendarList", method=RequestMethod.GET)
		public String gatCalenderList(@ModelAttribute("calendarVO") CalendarVO calendarVO, HttpSession session, Model model) throws Exception {
			
			
			if(session.getAttribute("userId") != null) {
				String userId = session.getAttribute("userId").toString();
				calendarVO.setUserId(userId);
	
				List<CalendarVO> clist = this.calendarService.getTodayCalendarList(calendarVO); 
				System.out.println("리스트 : " + clist);
				
				model.addAttribute("calendarList", clist);
				model.addAttribute("calendarVO", calendarVO);
				model.addAttribute("dayCheck", calendarVO.getRegDate());
				return "/calendar/calendar";
			}else {
				System.out.println("userid가 null");
				model.addAttribute("calendarVO", calendarVO);
				return "/calendar/calendar";
			}
	   }
	
	
		//일정추가하기버튼 클릭
	   @RequestMapping(value="/scheduleAdd", method=RequestMethod.GET)
	   public String scheduleAdd() { 
	      return "/calendar/scheduleForm";
	   }
	   
	   
	  
	    //일정 추가하기
		@RequestMapping(value="/scheduleAdd", method=RequestMethod.POST)
		public String boardWriteProc(@ModelAttribute("CalendarVO") CalendarVO calendarVO, 
				HttpSession session, Model model) throws Exception {
			
			String userId = session.getAttribute("userId").toString();

			calendarService.writeArticle(calendarVO);
			
			int cno = calendarVO.getCno(); 

			return "/calendar/calendar";    
		
		}
		
		 //추가한 일정 보기, 글수정
		   @RequestMapping(value= "/updateSchedule",  method=RequestMethod.GET)
			public String scheduleView(@RequestParam(value = "cno", required = false, defaultValue="0") int cno, HttpSession session, Model model) throws Exception {

			  String userId = (String) session.getAttribute("userId"); 

			  CalendarVO calendarVO = calendarService.getArticle(cno); //get selected article model
			  
		
			 

			  model.addAttribute("calendar", calendarVO);
			 

			  return "/calendar/scheduleView";
			}
		   
		
		
		   
		   //캘린더 글 수정
		   @RequestMapping(value = "/updateSchedule", method=RequestMethod.POST)  
		   public String  calendarModifyProc(@ModelAttribute("CalendarVO") CalendarVO calendarVO,HttpSession session, MultipartHttpServletRequest request,  Model model){

			   String userId = session.getAttribute("userId").toString();
		   
			   calendarVO.setUserId(userId);
		      
		      if(this.calendarService.updateCalendar(calendarVO) !=0) {
		    	   model.addAttribute("calendarVO", calendarVO);

					return "redirect:updateSchedule";
					
				}else {
				model.addAttribute("msgCode", "수정실패"); //수정 실패

		      return "redirect:scheduleView";
		      
		      
		      
				}
		   }
		   
		   
		   
		   
		   //캘린더 삭제
		   @RequestMapping("deleteCalendar")
		   public String delete(HttpServletRequest request, HttpSession session, RedirectAttributes rea) {
		   String userId = session.getAttribute("userId").toString();
		   
		   int cno = Integer.parseInt(request.getParameter("cno"));
			   
		   
		   	calendarService.deleteCalendar(cno);
		   	
		   	return "redirect:calendar";
		   }
		   
}
		   
	

	


			
		

