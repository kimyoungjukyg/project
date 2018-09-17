package com.KL.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.KL.member.dao.CalenderDAO;
import com.KL.member.vo.CalendarVO;





@Service
public class CalendarService {
	
	private ModelAndView mav;
	
	@Autowired
	private CalenderDAO calendarDao;
	private CalendarVO calendarVO;
	
	public int addSchedule(CalendarVO calendarVO) {
	int result = calendarDao.addSchedule(calendarVO);
		
		return result;
	}
	
	public List<CalendarVO> getSchedule(CalendarVO calendarVO){
		
		return calendarDao.getSchedule(calendarVO);
	}	
	
	
	
}
