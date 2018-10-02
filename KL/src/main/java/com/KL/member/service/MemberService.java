package com.KL.member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.KL.member.dao.GesipanDAO;
import com.KL.member.dao.MemberDAO;
import com.KL.member.dao.MessageDAO;
import com.KL.member.dao.PtDAO;
import com.KL.member.vo.CommentVO;
import com.KL.member.vo.KLVO;
import com.KL.member.vo.MemberVO;
import com.KL.member.vo.PtVO;

@Service
public class MemberService {
	// @는 밑에 한줄만 적용
	@Autowired
	private MemberDAO memberDAO;
	private ModelAndView mav;
	@Autowired
	private PtDAO ptDAO;
	@Autowired
	private BCryptPasswordEncoder passEncoder;
	@Autowired
	private GesipanDAO gdao;
	@Autowired
	private MessageDAO mDAO;

	@Autowired
	private HttpSession session;

	// 회원가입 메소드
	
	public int memberJoin(MemberVO memberVO,HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (memberDAO.check_id(memberVO.getId()) == 1) {
			out.println("<script>");
			out.println("alert('동일한 아이디가 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		}  else {

			memberVO.setApproval_key(create_key());
			memberDAO.memberJoin(memberVO);
			send_mail(memberVO);
			return 1;}
		
	}
	//인증키

	public String create_key() throws Exception {
		String key = "";
		Random rd = new Random();

		for (int i = 0; i < 8; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}
//이메일전송
	public void send_mail(MemberVO memberVO) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "kyg7414@gmail.com";
		String hostSMTPpwd = "gvsggvdgdvermjjg";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "kyg7414@gmail.com";
		String fromName = "Spring Homepage";
		String subject = "";
		String msg = "";

		// 회원가입 메일 내용
		subject = "KL 회원가입 인증 메일입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += memberVO.getId() + "님 회원가입을 환영합니다.</h3>";
		msg += "<div style='font-size: 130%'>";
		msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
		msg += "<form method='post' action='http://192.168.0.169:8090/member/approval_member.do'>";
		msg += "<input type='hidden' name='email' value='" + memberVO.getEmail() + "'>";
		msg += "<input type='hidden' name='approval_key' value='" + memberVO.getApproval_key() + "'>";
		msg += "<input type='submit' value='인증'></form><br/></div>";

		// 받는 사람 E-Mail 주소
		String mail = memberVO.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			
			System.out.println(memberVO.getEmail());
		
			System.out.println("메일발송 실패 : " + e);
		}
	}
	//회원인증
	
	public void approval_member(MemberVO memberVO, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (memberDAO.approval_member(memberVO) == 0) { // 이메일 인증에 실패하였을 경우
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else { // 이메일 인증을 성공하였을 경우
			out.println("<script>");
			out.println("alert('인증이 완료되었습니다. 로그인 후 이용하세요.');");
			out.println("location.href='login_join'");
			out.println("</script>");
			out.close();
		}
	}
	// 로그인 메소드
	public ModelAndView memberLogin(MemberVO memberVO, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");

		mav = new ModelAndView();
		MemberVO loginMember = memberDAO.memberLogin(memberVO);
		PrintWriter out = response.getWriter();

		
		try {
		if(!loginMember.getApproval_status().equals("true")){
			out.println("<script>");
			out.println("alert('이메일 인증 후 로그인 하세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			
		}else {
		// spring-security를 활용한 비밀번호 확인
		// memberVO.getPassword() 사용자가 입력한 패스워드, loginMember.getPassword() DB 패스워드
		if (passEncoder.matches(memberVO.getPassword(), loginMember.getPassword())) {
			session.setAttribute("session_id", memberVO.getId());
			session.setAttribute("classify", loginMember.getClassify());
			String id=(String) session.getAttribute("session_id");
			 session.setAttribute("nuMessage", mDAO.count(id));
			mav.addObject("loginMember", loginMember);
			if(memberVO.getId().equals("admin")) {
				mav.setViewName("testtama");
			}else {
			
			mav.setViewName("testtama");}
		} 
		else{
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.');");
			out.println("history.go(-1)");// 이전 페이지로 이동!
			out.println("</script>");
			out.close();
		}
		}
		}catch(NullPointerException ne){
			out.println("<script>");
			out.println("alert('회원이 아닙니다.');");
			out.println("history.go(-1)");// 이전 페이지로 이동!
			out.println("</script>");
			out.close();
		}
		return mav;

	}
//아이디중복검사
	
	public void check_id(String id, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(memberDAO.check_id(id));
		out.close();
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


mav.setViewName("Pt/pt");
		
		
		return mav;
	}

	public ModelAndView board() {
		mav=new ModelAndView();
		List<KLVO> gesipanlist = gdao.gesipanlist();
		mav.addObject("gesipanlist", gesipanlist);
		List<CommentVO> replyList = gdao.replyList();
		mav.addObject("replyList",replyList);

		mav.setViewName("board/board");
				
				
				return mav;
	}



	
	

}