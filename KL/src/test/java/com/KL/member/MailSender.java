package com.KL.member;

import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;

public interface MailSender {
	public void send(SimpleMailMessage simpleMessage) throws MailException;
	public void send(SimpleMailMessage[] simpleMessages) throws MailException;

}
