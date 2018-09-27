package com.KL.member;

import java.io.InputStream; 
import javax.mail.internet.MimeMessage;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;


public interface JavaMailSender extends MailSender { 
	
	MimeMessage createMimeMessage();
	MimeMessage createMimeMessage(InputStream contentStream) throws MailException;
	public void send(MimeMessage mimeMessage) throws MailException;
	public void send(MimeMessage[] mimeMessages) throws MailException;
	public void send(MimeMessagePreparator mimeMessagePreparator) throws MailException;
	public void send(MimeMessagePreparator[] mimeMessagePreparators) throws MailException; 
}

