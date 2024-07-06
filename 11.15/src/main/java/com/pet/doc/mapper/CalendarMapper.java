package com.pet.doc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.doc.model.CalendarVO;


@Mapper
public interface CalendarMapper {
	
	List<CalendarVO> getCalendarList(String userId);
	List<CalendarVO> getTodayCalendarList(CalendarVO calendar);
	
	CalendarVO getArticle(int cno); //글조회
	
	int writeArticle(CalendarVO calendar); // 글 쓰기
	int updateCalendar(CalendarVO calendar);//글 수정
	int deleteCalendar(int cno); // 글 삭제
	

}
