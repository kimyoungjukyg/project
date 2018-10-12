package com.KL.member.vo;

import java.util.Date;

public class reVO {
private String id;
private String title;
private Date redate;
private String content;
private String tranl;
private int star;

public reVO() {
	
}

public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public Date getRedate() {
	return redate;
}
public void setRedate(Date redate) {
	this.redate = redate;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getTranl() {
	return tranl;
}
public void setTranl(String tranl) {
	this.tranl = tranl;
}
public int getStar() {
	return star;
}
public void setStar(int star) {
	this.star = star;
}
}
