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

import com.KL.member.dao.MessageDAO;
import com.KL.member.service.*;
import com.KL.member.vo.CardVO;
import com.KL.member.vo.CommentVO;
import com.KL.member.vo.KLVO;
import com.KL.member.vo.MemberVO;
import com.KL.member.vo.MessageVO;
import com.KL.member.vo.PtVO;
import com.KL.member.vo.VideoVO;







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
	@Autowired
	private MessageDAO mDAO;
	
	private ModelAndView mav;
	@Autowired
	private PtService pt;
	@Autowired
	private MessageService messages;
	@Autowired
	private GesipanService gs;
	
	@Autowired
	private CardService ca;
	@Autowired
	private VideoService vs;
	@Autowired
	private BCryptPasswordEncoder passEncoder;
	@Autowired
	private HttpSession session;

	
	
	
	
	
	// 프로젝트시작시에 뜨는페이지 지정
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "testtama";
		}
	//홈화면으로이동
	@RequestMapping(value = "/testtama", method = RequestMethod.GET)
	public String testtama() {
		return "testtama";
		}
	//로그인페이지로이동
	@RequestMapping(value = "/login_join", method = RequestMethod.GET)
	public String login_join() {
		return "log/login_join";
		}
	
	//관리자페이지
		@RequestMapping(value = "/adminpage", method = RequestMethod.GET)
		public String adminpage() {
			return "log/adminpage";
			}
		//마이페이지
				@RequestMapping(value = "/mypage", method = RequestMethod.GET)
				public String mypage() {
					return "log/mypage";
					}
				//마이페이지
				@RequestMapping(value = "/board", method = RequestMethod.GET)
				public ModelAndView board() {
					mav=new ModelAndView();
					mav=ms.board();
					return mav;
					}
		//강의보러가기
				@RequestMapping(value = "/pton", method = RequestMethod.GET)
				public ModelAndView pton() {
					mav=new ModelAndView();
					mav=ms.textList();
					return mav;
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
		return "log/joinForm";
	}

	// 회원가입 처리
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String memberJoin(@ModelAttribute MemberVO memberVO,RedirectAttributes rttr, HttpServletResponse response) throws Exception {
		String encPassword = passEncoder.encode(memberVO.getPassword());
		memberVO.setPassword(encPassword);
		
		rttr.addFlashAttribute("result", ms.memberJoin(memberVO, response));

		
		return "testtama";
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
		return "testtama";
	}
	// 영상 보러가기
		@RequestMapping(value = "/video", method = RequestMethod.GET)
		public String video() {
			return "video/video";
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
	public ModelAndView ptpay(@ModelAttribute CardVO cardVO,@ModelAttribute PtVO ptVO, HttpServletResponse response)
			throws IOException {
		mav = new ModelAndView();
		String title=(String) session.getAttribute("title");
		pt.increase(title);
		mav = ca.ptpay(cardVO, ptVO, response);
		
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
				mav.setViewName("board/Gesipanmodify");
				
				return mav;
					
				}
				
			//글 수정 업데이트
				@RequestMapping(value = "/gesipanmodifyer", method = RequestMethod.POST)
				public String gesipanmodifyer(@ModelAttribute KLVO klvo,HttpServletResponse response) throws IllegalStateException , IOException{
					
					MultipartFile rfile = klvo.getRfile();
					if(!rfile.isEmpty()) {
						String fileName = rfile.getOriginalFilename();
						rfile.transferTo(new File("C:\\Users\\user\\git\\project\\KL\\src\\main\\webapp\\WEB-INF\\uploadFile\\"+fileName));
					}
					klvo.setRfilename(rfile.getOriginalFilename());
					gs.gesipanmodifyer(klvo,response);
					return "redirect:/board";
				
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
				
				//쪽지 목록 보기
				 @RequestMapping(value ="/messageForm")
				    public ModelAndView viewmessageList() {
					 String id = (String) session.getAttribute("session_id");
					 mav = new ModelAndView();
					 mav = messages.messageList(id);
					 System.out.println("쪽지목록에서 찍은 아이디"+id);
					 session.setAttribute("nuMessage", mDAO.count(id));
					 return mav;
				    }
				 
				 //쪽지 작성 화면 호출
				 @RequestMapping(value = "/messageWriteForm", method = RequestMethod.GET)
					public String messageWriteForm(@RequestParam("id") String id) {
					 session.setAttribute("session_id", id);
						return "messageWriteForm";
					}
				 
				 //쪽지 작성
				 @RequestMapping(value = "/toMessage", method = RequestMethod.POST)
				 public ModelAndView messageWrite(@ModelAttribute MessageVO mVO,@RequestParam("id") String id) throws IOException {
					System.out.println("쪽지 작성 컨트롤러에서 받은 아이디 : "+id);
					mav = new ModelAndView();
					mav=messages.messageWrite(mVO,id);
					return mav;
				 }

				 //받은 쪽지함
				 @RequestMapping(value = "/mymessage")
				 public ModelAndView myMessage() throws IOException {
					 String id = (String) session.getAttribute("session_id");
					 mav = new ModelAndView();
					 mav = messages.myMessage(id);
					return mav;
				 }
				 
				 //쪽지 삭제
				 @RequestMapping(value = "/messagedelete")
				 public String messageDelete(@RequestParam ("mnum") int num) throws IOException {
					 System.out.println("쪽지 삭제 번호"+num);
					 messages.deleteMessage(num);
					return "redirect:/mymessage";
				 }
			
				 //신규 쪽지 확인?
				 @RequestMapping(value = "/contentCheck")
				 public String contentCheck(@RequestParam ("mnum") int num) {
					 messages.contentCheck(num);
					 return "redirect:/mymessage";
				 }
				 
				 //안읽은 쪽지 확인
				 @RequestMapping(value = "/nuMessage")
				 public String count(@RequestParam ("id") String id) {
					 int nu = messages.count(id);
					 MessageVO mVO = null;
					 mVO.setNucheckMessage(nu);
					 System.out.println("안읽은 쪽지함 확인의 안읽은 쪽지"+nu);
					 return "nuMessage";
				 }			
	
				// 맞춤 비디오 리스트
					@RequestMapping(value = "/orderVideo", method = RequestMethod.GET)
					public ModelAndView orderVideo(HttpServletResponse response, @RequestParam("exe_Category") String muscle)
							throws IOException {
						mav = new ModelAndView();
						System.out.println("controller muscle print !!! ; " + muscle);
						mav = vs.orderVideo(muscle, response);
						return mav;
					}

					// 게시글 등록
					@RequestMapping(value = "/exeWrite", method = RequestMethod.POST)
					public ModelAndView exeWrite(@ModelAttribute VideoVO videoVO, HttpServletResponse response) throws IOException {
						mav = new ModelAndView();
						mav = vs.exeWrite(videoVO, response);
						return mav;
					}

					// 글 상세보기
					@RequestMapping(value = "/videoView", method = RequestMethod.GET)
					public ModelAndView vidoView(@RequestParam("exe_Num") int exe_Num) {
						System.out.println("글 상세보기 EXE_NUM?" + exe_Num);
						// vs.increaseHit(EXE_NUM); 조회 수 증가
						mav = new ModelAndView();
						mav = vs.videoView(exe_Num);
						return mav;
					}

					// 게시글 삭제
					@RequestMapping(value = "/videoDelete", method = RequestMethod.GET)
					public void videoDelete(@RequestParam("exe_Num") int exe_Num, HttpServletResponse response) throws IOException {
						vs.videoDelete(exe_Num, response);
					}
					
					// 게시글 좋아요
					@RequestMapping(value= "/videoLike" , method= RequestMethod.GET)
					public void videoLike(@RequestParam("exe_Num") int exe_Num, HttpServletResponse response)throws IOException{
						vs.videoLike(exe_Num, response);
					}

}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
