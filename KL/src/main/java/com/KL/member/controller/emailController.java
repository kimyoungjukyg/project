package com.KL.member.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.KL.member.service.MemberService;

@Controller
@RequestMapping("/email")
public class emailController {
	private ModelAndView mav;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberService ms;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView email() {
		mav=new ModelAndView();
		mav=ms.emaillist();
		return mav;
	}

	
	// mailSending 코드
	  @RequestMapping(value = "/mailSending")
	  public String mailSending(HttpServletRequest request) {
	   
	    String setfrom = "kyg7414@gmail.com";         
	    String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
	    String title   = request.getParameter("title");      // 제목
	    String content = request.getParameter("content");    // 내용
	   
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(tomail);     // 받는사람 이메일
	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	      messageHelper.setText(content);  // 메일 내용
	     
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println("전송오류"+e);
	    }
	   
	    return "redirect:/textList";
	  }
}
