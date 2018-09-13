package com.KL.member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.KL.member.dao.*;
import com.KL.member.vo.CardVO;
import com.KL.member.vo.MemberVO;
import com.KL.member.vo.PtVO;

@Service
public class PtService {
	@Autowired
	private MemberDAO memberDAO;
	private ModelAndView mav;
	private MemberVO memberVO;
	@Autowired
	private PtDAO ptDAO;
	private PtVO ptVO;
	private CardVO cardVO;
	@Autowired
	private CardDAO cardDAO;
	
	@Autowired
	private HttpSession session;
	@Autowired
	HttpServletResponse response;

	public ModelAndView ptView(String id) {
mav=new ModelAndView();
MemberVO ptView=ptDAO.ptView(id);
mav.addObject("ptView",ptView);
mav.setViewName("ptView");

		return mav;
	}


	public ModelAndView callender(String id) {
		mav=new ModelAndView();
		List<PtVO> callender=ptDAO.callender(id);
		mav.addObject("callender",callender);
		mav.setViewName("ptgo"+"#PT");
		return mav;
	}
	
	
	public ModelAndView ptmake(PtVO ptVo) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		mav=new ModelAndView();
		int result = ptDAO.ptmake(ptVo);
session.setAttribute("ptid", ptVo);
		if (result == 0) {
			// 등록 실패하면 다시 joinForm으로 이동
			mav.setViewName("ptView");
		} else {
			
			// 등록 성공하면 loginForm으로 이동
			mav.setViewName("redirect:/textList#PT");
		}

		return mav;
	}


	public void increasHit(String id) {
		
		ptDAO.increaseHit(id);		
	}

 
	
	public ModelAndView ptr(PtVO ptVO,String id) {
		mav=new ModelAndView();
		PtVO ptr=ptDAO.ptr(ptVO);
		session.setAttribute("log", ptr.getLog());
		session.setAttribute("title", ptr.getTitle());
		session.setAttribute("id", ptr.getId());
		session.setAttribute("start", ptr.getStarttime());
		session.setAttribute("end", ptr.getEndtime());
		session.setAttribute("price", ptr.getPrice());
		List<CardVO> cardread=cardDAO.cardread(id);
		
		mav.addObject("cardread",cardread);
		mav.addObject("ptr", ptr);
		mav.setViewName("ptr");
		return mav;
	}




	



	
}
