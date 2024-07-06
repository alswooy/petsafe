package com.pet.doc.service;

import java.util.List;

import com.pet.doc.model.CalendarVO;

public interface CalendarService {
	
	List<CalendarVO> getCalendarList(String userId); 
	List<CalendarVO> getTodayCalendarList(CalendarVO calendar);
	
	CalendarVO getArticle(int cno); //글조회
	int writeArticle(CalendarVO calendar); // 글 쓰기
	int updateCalendar(CalendarVO calendar);//글 수정
	int deleteCalendar(int cno); // 글 삭제



}
