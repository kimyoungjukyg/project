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
import com.KL.member.vo.Pagingvo;
import com.KL.member.vo.reVO;

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
	public ModelAndView gesipanwrite(KLVO klvo,HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		mav = new ModelAndView();
		if(session.getAttribute("session_id")==null) {
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("history.go(-1)");// 이전 페이지로 이동!
			out.println("</script>");
			out.close();
		}
		else {
		int result = gdao.gesipanwrite(klvo);
		if(result==0) {
			
			mav.setViewName("board/write_view");
		}else {
		
			mav.setViewName("testtama");
		}	}
		return mav;
	}

	
		//글 수정하기
	public ModelAndView gesipanmodifyer(KLVO klvo,HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		mav = new ModelAndView();
		if(session.getAttribute("session_id")==null) {
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("history.go(-1)");// 이전 페이지로 이동!
			out.println("</script>");
			out.close();
		}
		else {
			if(klvo.getRfilename()==""||klvo.getRfilename()==null) {
				int result = gdao.gesipanmodifyer2(klvo);
				if(result==0) {
					
					mav.setViewName("write_view");
				}else {
					mav.setViewName("redirect:/RgesipanList");
				}
				
			}else{
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
			}
		
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


	public List<KLVO> getRead(Pagingvo pagevo) {
		System.out.println("서비스 pageMaker"+pagevo.toString());
	      return gdao.getRead(pagevo);

	}


	public int count(int count) {
		// TODO Auto-generated method stub
		return gdao.GesipanCount(count);
	}

	//오홍홍 조와용 DB저장 시키기
			public ModelAndView ReplyLike(CommentVO Comvo) {
				mav = new ModelAndView();
				
				int result = gdao.ReplyLike(Comvo);
				if(result==0) {
					
					mav.setViewName("write_view");
				}else {
					mav.setViewName("redirect:/Gesipanview");
					
				}
				
				return mav;
				
			}


			public ModelAndView relist(String tranl) {
				mav=new ModelAndView(); 
				List<reVO> relist=gdao.relist(tranl);
				mav.addObject("relist",relist);
				mav.setViewName("board/board3");
				return mav;
			}


			public ModelAndView Reviewwrite(reVO revo, HttpServletResponse response) throws IOException {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				
				mav = new ModelAndView();
				
				if(session.getAttribute("session_id")==null) {
					out.println("<script>");
					out.println("alert('로그인이 필요합니다.');");
					out.println("history.go(-1)");// 이전 페이지로 이동!
					out.println("</script>");
					out.close();
				}
				else {
				int result = gdao.Reviewwrite(revo);
				if(result==0) {
					
					mav.setViewName("board/write_review");
				}else {
				
					mav.setViewName("testtama");
				}	}
				
				return mav;
			}


			//검색
			public ModelAndView searchList(String keyword) {
				mav = new ModelAndView();
				System.out.println("서비스에서 찍어본 keyword값 : "+keyword);
				List<KLVO> searchList = gdao.searchList(keyword);
				mav.addObject("searchList", searchList);// View에서 사용할 parameter 이름
				mav.setViewName("board/searchList");
				return mav;
			}
			//신고
			public ModelAndView gesipanDeclaration(int Rid) {
				mav = new ModelAndView();
			
			int result = gdao.gesipanDeclaration(Rid);
			if(result==0) {
				
				mav.setViewName("redirect:/Gesipanview");
			}else {
				mav.setViewName("redirect:/Gesipanview");
				
			}
			return mav;	
			
		}


			
}
