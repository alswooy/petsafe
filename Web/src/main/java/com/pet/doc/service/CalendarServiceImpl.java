package com.pet.doc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.doc.mapper.CalendarMapper;
import com.pet.doc.model.CalendarVO;

@Service(value = "calendarService")
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	CalendarMapper calendarMapper;

	@Override
	public List<CalendarVO> getCalendarList(String userId) {
		// TODO Auto-generated method stub
		return this.calendarMapper.getCalendarList(userId);
	}
	

	@Override
	public List<CalendarVO> getTodayCalendarList(CalendarVO calendar) {
		// TODO Auto-generated method stub
		return this.calendarMapper.getTodayCalendarList(calendar);
	}



	@Override
	public CalendarVO getArticle(int cno) {
		// TODO Auto-generated method stub
		return this.calendarMapper.getArticle(cno);
	}

	@Override
	public int writeArticle(CalendarVO calendar) {
		// TODO Auto-generated method stub
		return this.calendarMapper.writeArticle(calendar);
	}

	@Override
	public int updateCalendar(CalendarVO calendar) {
		// TODO Auto-generated method stub
		return this.calendarMapper.updateCalendar(calendar);
	}

	@Override
	public int deleteCalendar(int cno) {
		// TODO Auto-generated method stub
		return this.calendarMapper.deleteCalendar(cno);
	}

}
