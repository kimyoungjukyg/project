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
import com.KL.member.vo.CardVO;
import com.KL.member.vo.CommentVO;
import com.KL.member.vo.KLVO;
import com.KL.member.vo.MemberVO;
import com.KL.member.vo.PtVO;







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
	private GesipanService gs;
	
	@Autowired
	private CardService ca;
	
	@Autowired
	private BCryptPasswordEncoder passEncoder;
	@Autowired
	private HttpSession session;

	
	
	
	
	
	// 프로젝트시작시에 뜨는페이지 지정
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "redirect:/textList";
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
	public String memberJoin(@ModelAttribute MemberVO memberVO,RedirectAttributes rttr, HttpServletResponse response) throws Exception {
		String encPassword = passEncoder.encode(memberVO.getPassword());
		memberVO.setPassword(encPassword);
		
		rttr.addFlashAttribute("result", ms.memberJoin(memberVO, response));

		
		return "redirect:/textList";
	}
	// 회원 인증
		@RequestMapping(value = "/approval_member.do", method = RequestMethod.POST)
		public void approval_member(@ModelAttribute MemberVO memberVO, HttpServletResponse response) throws Exception{
			ms.approval_member(memberVO, response);
		}
		// 아이디 중복 검사(AJAX)
		@RequestMapping(value = "/check_id.do", method = RequestMethod.POST)
		public void check_id(@RequestParam("id") String id, HttpServletResponse response) throws Exception{
			ms.check_id(id, response);
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

	//트레이너만가능 pt생성단계로
	@RequestMapping(value="/ptView",method=RequestMethod.GET)
	public ModelAndView ptView(@RequestParam("id") String id) {
		
		pt.increasHit(id);
		
		mav=new ModelAndView();
		
	mav=pt.ptView(id);
	
	return mav;
		
	}
	
	//트레이너가 강의 설정및 생성
	@RequestMapping(value="/ptmake",method=RequestMethod.POST)
	public ModelAndView ptmake(@ModelAttribute PtVO ptVo) throws IOException {
	
	mav=new ModelAndView();
		
	mav=pt.ptmake(ptVo);
	return mav;
		
	}
	//PT신청 페이지로
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
	//카드결제진행
	@RequestMapping(value = "/ptpay", method = RequestMethod.POST)
	public ModelAndView ptpay(@ModelAttribute CardVO cardVO, HttpServletResponse response)
			throws IOException {
		mav = new ModelAndView();
		mav = ca.ptpay(cardVO, response);
		
		return mav;
	}
	//글쓰기 화면 호출
			@RequestMapping(value="Rgesipanwriteform", method = RequestMethod.GET)
			public String gesipanwriteform() {
				return "write_view";
			}
			//글 상세보기
			@RequestMapping(value="/gesipanview" , method=RequestMethod.GET)
			public ModelAndView gesipanview(@RequestParam("Rid") int Rid) {
				System.out.println(Rid);
				gs.increaseHit(Rid);
				
				mav = new ModelAndView();
				mav = gs.gesipanview(Rid);	
				
				return mav;
				
				
			}
				
			//글 쓰기
			@RequestMapping(value="/Rgesipanwrite", method=RequestMethod.POST)
			public ModelAndView gesipanwrite(@ModelAttribute KLVO klvo) throws IOException {
				mav = new ModelAndView();
				MultipartFile rfile = klvo.getRfile();
				if(!rfile.isEmpty()) {
					String fileName = rfile.getOriginalFilename();
					rfile.transferTo(new File("D:\\Spring\\Re\\src\\main\\webapp\\WEB-INF\\uploadFile\\"+fileName));
				}
				klvo.setRfilename(rfile.getOriginalFilename());
				
				mav = gs.gesipanwrite(klvo);
				
				return mav;
				
			
				}
			
			//글 수정 창 불러오기
				@RequestMapping(value="/gesipanmodify", method=RequestMethod.GET)
				public ModelAndView gesipanmodify(@RequestParam("Rid") int Rid) {
					
				mav = new ModelAndView();
				mav = gs.gesipanview(Rid);
				mav.setViewName("Gesipanmodify");
				
				return mav;
					
				}
				
			//글 수정 업데이트
				@RequestMapping(value = "/gesipanmodifyer", method = RequestMethod.POST)
				public String gesipanmodifyer(@ModelAttribute KLVO klvo) throws IllegalStateException , IOException{
					
					MultipartFile rfile = klvo.getRfile();
					if(!rfile.isEmpty()) {
						String fileName = rfile.getOriginalFilename();
						rfile.transferTo(new File("C:\\Users\\user\\git\\project\\KL\\src\\main\\webapp\\WEB-INF\\uploadFile\\"+fileName));
					}
					klvo.setRfilename(rfile.getOriginalFilename());
					gs.gesipanmodifyer(klvo);
					return "redirect:/RgesipanList";
				
				}
				
				
				//게시글 삭제
				@RequestMapping(value ="/gesipandelete", method = RequestMethod.GET)
				public String gesipandelete(@RequestParam("Rid") int Rid) {
					gs.gesipandelete(Rid);
					return "redirect:/RgesipanList";
					
				}
				
				//댓글 달앚주세요오오
				@RequestMapping(value = "/Gesipanreply" , method= RequestMethod.POST)
				public ModelAndView gesipanreply(@ModelAttribute CommentVO comvo, @RequestParam("Rid") int Rid) throws IOException {
					mav = new ModelAndView();
					comvo.setRid(Rid);
					gs.gesipanreply(comvo);
					mav = gs.gesipanview(Rid);
					
					
					return mav;
					
				}
				
				
	
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
