package com.KL.member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.KL.member.dao.GesipanDAO;
import com.KL.member.vo.CommentVO;
import com.KL.member.vo.KLVO;

@Service
public class GesipanService {
	@Autowired
	private GesipanDAO gdao;
	private ModelAndView mav;
	@Autowired
	private HttpSession session;
	public void increaseHit(int Rid) {
		gdao.increaseHit(Rid);
		
	}


	//댓글 리스트 불러오기
	public ModelAndView gesipanview(int Rid) {
		mav = new ModelAndView();
		
		KLVO gesipanview = gdao.gesipanView(Rid);
		mav.addObject("gesipanview", gesipanview);
		List<CommentVO> replyView = gdao.replyView(Rid);
		mav.addObject("replyView",replyView);
		mav.setViewName("board/Gesipanview");
		return mav;
	}

	


		//글쓰기
	public ModelAndView gesipanwrite(KLVO klvo) {
		mav = new ModelAndView();
		int result = gdao.gesipanwrite(klvo);
		if(result==0) {
			
			mav.setViewName("board/write_view");
		}else {
			mav.setViewName("testtama");
		}	
		return mav;
	}

	
		//글 수정하기
	public ModelAndView gesipanmodifyer(KLVO klvo,HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		mav = new ModelAndView();
		if(session.getAttribute("session_id").equals(klvo.getRname())) {
			int result = gdao.gesipanmodifyer(klvo);
			if(result==0) {
				
				mav.setViewName("board/write_view");
			}else {
				mav.setViewName("testtama");
			}
		}else {
		
		out.println("<script>");
		out.println("alert('수정은 자신의 것만 가능합니다..');");
		out.println("history.go(-1)");// 이전 페이지로 이동!
		out.println("</script>");
		out.close();
		}
		return mav;
		
	

	}
		//글 삭제
	public void gesipandelete(int Rid) {
		gdao.gesipandelete(Rid);
		
	}


		//댓글 DB저장시퀴기
	public ModelAndView gesipanreply(CommentVO comvo) {
		mav = new ModelAndView();
		int result = gdao.gesipanrelpy(comvo);
		if(result==0) {
			
			mav.setViewName("board/write_view");
		}else {
			mav.setViewName("redirect:/Gesipanview");
		}
		return mav;
	}
	
	
}
