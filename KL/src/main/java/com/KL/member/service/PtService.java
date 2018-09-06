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
		mav.setViewName("ptgo");
		return mav;
	}
	
	
	public ModelAndView ptmake(PtVO ptVo) throws IOException {
response.setContentType("text/html;charset=utf-8");
PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("<alert('강의 등록이 완료되었습니다.')>");
		out.println("</script>");
		mav=new ModelAndView();
		
		int result = ptDAO.ptmake(ptVo);

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


	
	public ModelAndView ptr(int log) {
		mav=new ModelAndView();
		PtVO ptr=ptDAO.ptr(log);
		
		mav.addObject("ptr", ptr);
		mav.setViewName("ptr");
		return mav;
	}




	
}
