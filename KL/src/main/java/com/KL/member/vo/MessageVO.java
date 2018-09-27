package com.KL.member.vo;

import java.sql.Date;

public class MessageVO {
	private int message_num;
	private String content;
	private String writer;
	private String reader;
	private int checkMessage;
	private int nucheckMessage;
	private Date message_date; 
	
	public MessageVO(){
		
	}
	
	public MessageVO(int message_num, String content, String writer, String reader, int checkMessage, int nucheckMessage, Date message_date) {
		this.message_num = message_num;
		this.content=content;
		this.writer=writer;
		this.reader=reader;
		this.checkMessage=checkMessage;
		this.nucheckMessage=nucheckMessage;
		this.message_date = message_date;
	}
	
	

	@Override
	public String toString() {
		return "MessageVO [message_num=" + message_num + ", content=" + content + ", writer=" + writer + ", reader="
				+ reader + ", checkMessage=" + checkMessage + ", nucheckMessage=" + nucheckMessage + ", message_date="
				+ message_date + "]";
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getReader() {
		return reader;
	}

	public void setReader(String reader) {
		this.reader = reader;
	}

	public int getMessage_num() {
		return message_num;
	}

	public void setMessage_num(int message_num) {
		this.message_num = message_num;
	}

	public int getCheckMessage() {
		return checkMessage;
	}

	public void setCheckMessage(int checkMessage) {
		this.checkMessage = checkMessage;
	}

	public int getNucheckMessage() {
		return nucheckMessage;
	}

	public void setNucheckMessage(int nucheckMessage) {
		this.nucheckMessage = nucheckMessage;
	}

	public Date getMessage_date() {
		return message_date;
	}

	public void setMessage_date(Date message_date) {
		this.message_date = message_date;
	}
	
	
}
