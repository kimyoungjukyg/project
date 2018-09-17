package com.KL.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.KL.member.vo.CalendarVO;



@Repository
public class CalenderDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public int addSchedule(CalendarVO calendarVO ) {
		return sqlSession.insert("Calendar.addSchedule", calendarVO);
	}
	
	public List<CalendarVO> getSchedule(CalendarVO calendarVO ) {
		return sqlSession.selectList("Calendar.getSchedule", calendarVO);
	}
}
