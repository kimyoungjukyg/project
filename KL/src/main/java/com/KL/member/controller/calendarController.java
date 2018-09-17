package com.KL.member.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KL.member.dto.JSONResult;
import com.KL.member.service.CalendarService;
import com.KL.member.vo.CalendarVO;


@Controller
@RequestMapping("/calendar")
public class calendarController {
	@Autowired
	private CalendarService cll;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String write() {
		return "index";
	}


	@ResponseBody
	@RequestMapping( value="/addSchedule", method=RequestMethod.POST )
	public JSONResult addSchedule(@ModelAttribute CalendarVO calendarVO) {
		
		int count = cll.addSchedule(calendarVO);
		return JSONResult.success(count);
	}

	@ResponseBody
	@RequestMapping( value="/getSchedule", method=RequestMethod.POST )
	public JSONResult getSchedule(@ModelAttribute CalendarVO calendarVO) {
		
		List<CalendarVO> list = cll.getSchedule(calendarVO);
		return JSONResult.success(list);
	}
	
	
}




