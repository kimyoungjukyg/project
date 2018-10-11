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

import com.KL.member.dao.MemberDAO;
import com.KL.member.dao.PtDAO;
import com.KL.member.vo.MemberVO;
import com.KL.member.vo.PtVO;

@Service
public class CardService {
	
	private ModelAndView mav;
	@Autowired
	private PtService pt;


	@Autowired
	private BCryptPasswordEncoder passEncoder;

	@Autowired
	private HttpSession session;

	@Autowired
	private PtDAO ptDAO;
	

	





	public ModelAndView ptpay(PtVO ptVO,HttpServletResponse response,String id) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		mav = new ModelAndView();
		
		PtVO cardtest2=ptDAO.cardtest(ptVO);
	
			try {
			if(ptVO.getId().equals(cardtest2.getId()) ) {
				out.println("<script>");
				out.println("alert('신청시간에 이미 수강하는 강의가 있습니다.');");
				out.println("location.href='pton'");// 이전 페이지로 이동!
				out.println("</script>");
				out.close();
			}else {
			if(ptVO.getId().equals(cardtest2.getId()) && ptVO.getTitle().equals(cardtest2.getTitle())){
	out.println("<script>");
	out.println("alert('동일한강의는 신청이 불가능 합니다.');");
	out.println("location.href='pton'");// 이전 페이지로 이동!
	out.println("</script>");
	out.close();
}
			else {
	int result = ptDAO.addpt(ptVO);
			if (result == 0) {
				// 등록 실패하면 
				mav.setViewName("Pt/ptr");
			} else {
				// 등록 성공하면 
			
				out.println("<script>");
				out.println("alert('결제가완료되었습니다..');");
				out.println("location.href='pton'");
				out.println("</script>");
				out.close();
				/*mav.addObject("cardtest", cardtest);
				mav.setViewName("redirect:/textList");	*/
			}

}	}
			}catch(NullPointerException ne){
	int result = ptDAO.addpt(ptVO);
	if (result == 0) {
		// 등록 실패하면 
		mav.setViewName("ptr");
	} else {
		// 등록 성공하면 
	
		out.println("<script>");
		out.println("alert('결제가완료되었습니다..');");
		out.println("location.href='pton'");
		out.println("</script>");
		out.close();
		
	}
}

		
		return mav;

	}
	
}
