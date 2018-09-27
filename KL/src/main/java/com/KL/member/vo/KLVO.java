package com.KL.member.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class KLVO {
	private String Rtype;
	private int Rid;
	private String Rname;
	private String Rtitle;
	private String Rcontent;
	private Date Rdate;
	private int Rhit;
	private MultipartFile Rfile;
	
	private String Rfilename = null;
	
	public KLVO() {
		
	}

	public String getRtype() {
		return Rtype;
	}

	public void setRtype(String rtype) {
		Rtype = rtype;
	}

	public int getRid() {
		return Rid;
	}

	public void setRid(int rid) {
		Rid = rid;
	}

	public String getRname() {
		return Rname;
	}

	public void setRname(String rname) {
		Rname = rname;
	}

	public String getRtitle() {
		return Rtitle;
	}

	public void setRtitle(String rtitle) {
		Rtitle = rtitle;
	}

	public String getRcontent() {
		return Rcontent;
	}

	public void setRcontent(String rcontent) {
		Rcontent = rcontent;
	}

	public Date getRdate() {
		return Rdate;
	}

	public void setRdate(Date rdate) {
		Rdate = rdate;
	}

	public int getRhit() {
		return Rhit;
	}

	public void setRhit(int rhit) {
		Rhit = rhit;
	}

	public MultipartFile getRfile() {
		return Rfile;
	}

	public void setRfile(MultipartFile rfile) {
		Rfile = rfile;
	}

	public String getRfilename() {
		return Rfilename;
	}

	public void setRfilename(String rfilename) {
		Rfilename = rfilename;
	}
	
}
