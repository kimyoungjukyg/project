package com.KL.member.vo;

public class CardVO {
private String id;
private String cardnum;
private String password;
private int num;
public int getNum() {
	return num;
}

public void setNum(int num) {
	this.num = num;
}

public CardVO() {
	
}

public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getCardnum() {
	return cardnum;
}
public void setCardnum(String cardnum) {
	this.cardnum = cardnum;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}


}
