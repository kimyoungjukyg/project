package com.KL.member.vo;

import java.util.Date;

public class CommentVO {
	private int Cid;
	private int Rid;
	private String Ccontent;
	private String Cwriter;
	private int Tolike;
	private Date Cdate;
public CommentVO() {
		
	}

public int getTolike() {
	return Tolike;
}

public void setTolike(int tolike) {
	Tolike = tolike;
}

public int getCid() {
	return Cid;
}
public void setCid(int cid) {
	Cid = cid;
}
public int getRid() {
	return Rid;
}
public void setRid(int rid) {
	Rid = rid;
}
public String getCcontent() {
	return Ccontent;
}
public void setCcontent(String ccontent) {
	Ccontent = ccontent;
}
public String getCwriter() {
	return Cwriter;
}
public void setCwriter(String cwriter) {
	Cwriter = cwriter;
}
public Date getCdate() {
	return Cdate;
}
public void setCdate(Date cdate) {
	Cdate = cdate;
}
	
	
}
