package com.KL.member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.KL.member.dao.CardDAO;
import com.KL.member.dao.MemberDAO;
import com.KL.member.vo.CardVO;
import com.KL.member.vo.MemberVO;

@Service
public class CardService {
	
	private ModelAndView mav;
	

	@Autowired
	private BCryptPasswordEncoder passEncoder;

	@Autowired
	private HttpSession session;

	@Autowired
	private CardDAO cardDAO;
	private CardVO cardVO;
	

	public ModelAndView cardlist(CardVO cardVO) throws IOException{
		
		mav=new ModelAndView();
		
		int result = cardDAO.cardlist(cardVO);

		if (result == 0) {
			// 등록 실패하면 
			mav.setViewName("ptr");
		} else {
			
			// 등록 성공하면 
			mav.setViewName("redirect:cardread");
		}

		return mav;
	}


	public ModelAndView cardread(String id) {
mav=new ModelAndView();
List<CardVO> cardread=cardDAO.cardread(id);
mav.addObject("cardread",cardread);
mav.setViewName("ptr");
	
		return mav;
	}


	public void increase(String id) {
		
		cardDAO.increase(id);
		
	}


	public ModelAndView ptpay(CardVO cardVO, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		mav = new ModelAndView();
		CardVO cardtest =cardDAO.cardtest(cardVO);
		System.out.println("사용자 입력 비번 : " + cardVO.getPassword());
		System.out.println("DB의 암호화된 비번 : " +cardtest.getPassword());


		if(cardVO.getPassword().equals(cardtest.getPassword())){
			mav.addObject("cardtest", cardtest);
				
		} else {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.');");
			out.println("history.go(-1)");// 이전 페이지로 이동!
			out.println("</script>");
			out.close();
		}

		return mav;

	}
	
}
