package com.KL.member.controller;


import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.KL.member.service.*;


import com.KL.member.vo.*;




@Controller
public class MemberController {

	/*
	 * @로시작하는건 어노테이션이라고함
	 * 
	 * 별도의 객체를 생성하지 않고도 자동으로 객체를 주입하여 사용할수 있도록 하는 이노테이션. 스프링의 특징중 하나인 의존성 주입
	 * (Dependency Injection)을 구현하는 개념.
	 * 
	 * @Autowired를 붙이면 스프링 컨테이너가 자동으로 관리를 함.
	 */
	@Autowired
	private MemberService ms;
	private ModelAndView mav;
	@Autowired
	private PtService pt;
	
	
	@Autowired
	private CardService ca;
	
	@Autowired
	private BCryptPasswordEncoder passEncoder;
	@Autowired
	private HttpSession session;

	// 프로젝트시작시에 뜨는페이지 지정
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "redirect:textList";
		}
	
	
	
	
	//pt트레이너 리스트 소환
	@RequestMapping(value="/textList",method=RequestMethod.GET)
	public ModelAndView textList() {
		mav=new ModelAndView();
		mav=ms.textList();
		return mav;
	}
	
	// 회원가입 페이지로 이동 요청 처리
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "joinForm";
	}

	// 회원가입 처리
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String memberJoin(@ModelAttribute MemberVO memberVO,RedirectAttributes rttr, HttpServletResponse response,@RequestParam("uploadFile") MultipartFile file) throws Exception {
		String encPassword = passEncoder.encode(memberVO.getPassword());
		memberVO.setPassword(encPassword);
		 File f = new File("C:\\Users\\user\\git\\project\\KL\\src\\main\\webapp\\resources\\test\\img\\"+file.getOriginalFilename());
	     file.transferTo(f);
	     memberVO.setProfile_IMG(file.getName());
		rttr.addFlashAttribute("result", ms.memberJoin(memberVO, response));

		
		return "redirect:/textList";
	}
	// 회원 인증
		@RequestMapping(value = "/approval_member.do", method = RequestMethod.POST)
		public void approval_member(@ModelAttribute MemberVO memberVO, HttpServletResponse response) throws Exception{
			ms.approval_member(memberVO, response);
		}
	

	// 로그인 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView memberLogin(@ModelAttribute MemberVO memberVO, HttpServletResponse response)
			throws IOException {
		mav = new ModelAndView();
		mav = ms.memberLogin(memberVO, response);
		return mav;
	}

	// 로그아웃 처리
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String memberLogout() {
		session.invalidate();
		return "redirect:/textList#login";
	}

	// 회원 목록
	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	public ModelAndView memberList(HttpSession session) {
		mav = new ModelAndView();
		String loginMember = (String) session.getAttribute("session_id");
		if (loginMember == null || !loginMember.equals("admin")) {
			mav.setViewName("loginForm");
		} else {
			mav = ms.memberList();
		}
		return mav;
	}

	// 회원 상세정보
	@RequestMapping(value = "/memberView", method = RequestMethod.GET)
	public ModelAndView memberView(@RequestParam("id") String id) {
		mav = new ModelAndView();
		mav = ms.memberView(id);
		return mav;
	}
	
	//회원 삭제 하기
	@RequestMapping(value = "/memberDelete", method = RequestMethod.GET)
	public String memberDelete(@RequestParam("id") String id) {
		ms.memberDelete(id);
		
		return "redirect:/memberList";
	}

	//pt일정 /신청장소로넘어가기
	
	@RequestMapping(value="/ptView",method=RequestMethod.GET)
	public ModelAndView ptView(@RequestParam("id") String id) {
		
		pt.increasHit(id);
		
		mav=new ModelAndView();
		
	mav=pt.ptView(id);
	
	return mav;
		
	}
	
	//트레이너가 강의 설정
	@RequestMapping(value="/ptmake",method=RequestMethod.POST)
	public ModelAndView ptmake(@ModelAttribute PtVO ptVo) throws IOException {
	
	mav=new ModelAndView();
		
	mav=pt.ptmake(ptVo);
	return mav;
		
	}
	@RequestMapping(value="/ptr",method=RequestMethod.GET)
	public ModelAndView ptr(@ModelAttribute PtVO ptVO,@RequestParam("id") String id) {
	/*pt.increasHit(id);*/
	
	
	mav=new ModelAndView();
		
	mav=pt.ptr(ptVO,id);
	return mav;
		
	}
	
//일반회원이 개설강의 리스트보기
	@RequestMapping(value = "/callender", method = RequestMethod.GET)
	public ModelAndView callender(@RequestParam("id") String id) {
	 mav=new ModelAndView();

		mav=pt.callender(id);
		return mav;
	}
	//카드등록
	@RequestMapping(value="/cardlist",method=RequestMethod.POST)
	public ModelAndView cardlist(@ModelAttribute CardVO cardVO) throws IOException {			
		mav=new ModelAndView();
	mav=ca.cardlist(cardVO);
	return mav;
		
	}
	
	//카드등록페이지
	@RequestMapping(value = "/cardwrite", method = RequestMethod.GET)
	public String cardwrite(@RequestParam("id") String id) {
		ca.increase(id);
		return "cardwrite";
	}
	//카드등록후 리스트
	@RequestMapping(value="/cardread",method=RequestMethod.GET)
	public ModelAndView cardread(){	
		String id=(String) session.getAttribute("session_id");
	mav=new ModelAndView();

	mav=ca.cardread(id);
	return mav;
		
	}
	@RequestMapping(value = "/ptpay", method = RequestMethod.POST)
	public ModelAndView ptpay(@ModelAttribute CardVO cardVO, HttpServletResponse response)
			throws IOException {
		mav = new ModelAndView();
		mav = ca.ptpay(cardVO, response);
		return mav;
	}
	

}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
