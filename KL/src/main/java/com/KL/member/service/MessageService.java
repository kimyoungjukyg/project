package com.KL.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.KL.member.dao.MessageDAO;
import com.KL.member.vo.MessageVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Service
public class MessageService {
	
	@Autowired
	private MessageDAO mDAO;
	
	private ModelAndView mav;
	
	@Autowired
	private HttpSession session;
	
	//리스트 보기
	public ModelAndView messageList(String id) {
		mav = new ModelAndView();
		List<MessageVO> mlist = mDAO.toMessage(id);
		mav.addObject("message", mlist);
		mav.setViewName("message/messageForm");
		return mav;
	}

	//쪽지작성
	public ModelAndView messageWrite(MessageVO mVO, String id) throws IOException {
		mav = new ModelAndView();
		Map map = new HashMap();
		map.put("parameter1", mVO);
		map.put("parameter2", id);
		int result = mDAO.messageWrite(map);
		System.out.println("쪽지번호"+mVO.getMessage_num());
		if(result==0) {
			mav.setViewName("testtama");
		} else {
			session.setAttribute("session_id", id);
			mav.setViewName("redirect:/messageForm");
		}
		return mav;
	}

	//받은 쪽지함
	public ModelAndView myMessage(String id) {
		mav = new ModelAndView();
		List<MessageVO> mylist = mDAO.myMessage(id);
		mav.addObject("mymessage", mylist);
		mav.setViewName("message/toMessageForm");
		return mav;
	}

	//쪽지 삭제
	public void deleteMessage(int num) {
		mDAO.deleteMessage(num);
	}

	//쪽지 내용 확인
	public void contentCheck(int num) {
		mDAO.contentCheck(num);
	}

	//안읽은 쪽지 갯수 확인
	public int count(String id) {
		int result = mDAO.count(id);
		return result;
	}
	
}
