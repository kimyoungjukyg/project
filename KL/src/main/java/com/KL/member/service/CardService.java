package com.KL.member.service;

import java.io.IOException;
import java.util.List;

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
			// 등록 실패하면 다시 joinForm으로 이동
			mav.setViewName("ptr");
		} else {
			
			// 등록 성공하면 loginForm으로 이동
			mav.setViewName("redirect:ptr");
		}

		return mav;
	}


	public ModelAndView cardread() {
mav=new ModelAndView();
List<CardVO> cardread=cardDAO.cardread();
mav.addObject("cardread",cardread);
mav.setViewName("ptr");
	
		return mav;
	}
	
}
