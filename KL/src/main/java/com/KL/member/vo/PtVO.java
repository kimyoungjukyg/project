package com.KL.member.vo;

import java.sql.Date;

import oracle.sql.DATE;

public class PtVO {
private String id;
private String title;
private Date starttime;
private Date endtime;
private String allDay;
private String className;
private int price;
private int count;
private int log;
public String getId() {
	return id;
}
public PtVO() {
	
}


public int getLog() {
	return log;
}
public void setLog(int log) {
	this.log = log;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
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

public Date getStarttime() {
	return starttime;
}
public void setStarttime(Date starttime) {
	this.starttime = starttime;
}
public Date getEndtime() {
	return endtime;
}
public void setEndtime(Date endtime) {
	this.endtime = endtime;
}
public String getAllDay() {
	return allDay;
}
public void setAllDay(String allDay) {
	this.allDay = allDay;
}
public String getClassName() {
	return className;
}
public void setClassName(String className) {
	this.className = className;
}

}
