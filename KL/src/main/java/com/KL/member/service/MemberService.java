package com.KL.member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.KL.member.dao.MemberDAO;
import com.KL.member.vo.MemberVO;

@Service
public class MemberService {
	// @는 밑에 한줄만 적용
	@Autowired
	private MemberDAO memberDAO;
	private ModelAndView mav;
	private MemberVO memberVO;

	@Autowired
	private BCryptPasswordEncoder passEncoder;

	@Autowired
	private HttpSession session;

	// 회원가입 메소드
	public ModelAndView memberJoin(MemberVO memberVO) {
		mav = new ModelAndView();

		int result = memberDAO.memberJoin(memberVO);

		if (result == 0) {
			// 회원가입 실패하면 다시 joinForm으로 이동
			mav.setViewName("joinForm");
		} else {
			// 회원가입 성공하면 loginForm으로 이동
			mav.setViewName("redirect:/textList#mypage");
		}

		return mav;
	}

	// 아이디 중복확인 메소드
	public void idOverlap(String id, HttpServletResponse response) throws IOException {
		memberVO = new MemberVO();
		memberVO = memberDAO.idOverlap(id);
		if (memberVO == null) {
			response.getWriter().print("1");
		} else {
			response.getWriter().print("0");
		}
	}

	// 로그인 메소드
	public ModelAndView memberLogin(MemberVO memberVO, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");

		mav = new ModelAndView();
		MemberVO loginMember = memberDAO.memberLogin(memberVO);
		PrintWriter out = response.getWriter();

		System.out.println("사용자 입력 비번 : " + memberVO.getPassword());
		System.out.println("DB의 암호화된 비번 : " + loginMember.getPassword());

		// spring-security를 활용한 비밀번호 확인
		// memberVO.getPassword() 사용자가 입력한 패스워드, loginMember.getPassword() DB 패스워드
		if (passEncoder.matches(memberVO.getPassword(), loginMember.getPassword())) {
			session.setAttribute("session_id", memberVO.getId());
			session.setAttribute("classify", loginMember.getClassify());
			mav.addObject("loginMember", loginMember);
			mav.setViewName("redirect:/textList#mypage");
		} else {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.');");
			out.println("history.go(-1)");// 이전 페이지로 이동!
			out.println("</script>");
			out.close();
		}

		return mav;

	}

	public ModelAndView memberList() {
		mav = new ModelAndView();
		List<MemberVO> memberList = memberDAO.memberList();

		mav.addObject("memberList", memberList);// View에서 사용할 parameter 이름
		mav.setViewName("memberList");// 목적지를 사용할 메소드 "memberList.jsp"
		return mav;
	}

	public ModelAndView memberView(String id) {
		mav = new ModelAndView();
		MemberVO viewMember = memberDAO.memberView(id);
		mav.addObject("viewMember", viewMember);
		mav.setViewName("memberView");
		return mav;
	}

	public void memberDelete(String id) {
		memberDAO.memberDelete(id);
	}

	public ModelAndView textList() {
mav=new ModelAndView();
List<MemberVO> textList =memberDAO.textList();
mav.addObject("textList",textList);
mav.setViewName("text1");
		
		
		return mav;
	}



	
	

}