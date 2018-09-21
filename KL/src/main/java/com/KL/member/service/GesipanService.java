package com.KL.member.service;

import java.util.List;

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
		mav.setViewName("Gesipanview");
		return mav;
	}

	


		//글쓰기
	public ModelAndView gesipanwrite(KLVO klvo) {
		mav = new ModelAndView();
		int result = gdao.gesipanwrite(klvo);
		if(result==0) {
			
			mav.setViewName("write_view");
		}else {
			mav.setViewName("redirect:/textList");
		}	
		return mav;
	}

	
		//글 수정하기
	public ModelAndView gesipanmodifyer(KLVO klvo) {
		mav = new ModelAndView();
		int result = gdao.gesipanmodifyer(klvo);
		if(result==0) {
			
			mav.setViewName("write_view");
		}else {
			mav.setViewName("redirect:/textList");
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
			
			mav.setViewName("write_view");
		}else {
			mav.setViewName("redirect:/Gesipanview");
		}
		return mav;
	}
	
	
}
