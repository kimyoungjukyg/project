package com.KL.member.vo;

import java.sql.Date;

public class VideoVO {
	private String id;
	private int exe_Num;
	private String exe_Name;
	private String exe_Video;
	private String exe_Category;
	private int exe_Ehits; // 조회수
	private int exe_Likecount;
	private Date exe_Date; // 게시글(댓글) 작성시간
	private int watched_Num; // 수강하면 부여되는 번호
	private Date watched_Date; // 시청 완료 시간
	private String youtube_id;//썸네일 이미지

	public VideoVO() {

	}

	public VideoVO(String id, int exe_Num, String exe_Name, String exe_Video, String exe_Category, int exe_Ehits,
			int exe_Likecount, Date exe_Date, int watched_Num, Date watched_Date, String youtube_id) {
		super();
		this.id = id;
		this.exe_Num = exe_Num;
		this.exe_Name = exe_Name;
		this.exe_Video = exe_Video;
		this.exe_Category = exe_Category;
		this.exe_Ehits = exe_Ehits;
		this.exe_Likecount = exe_Likecount;
		this.exe_Date = exe_Date;
		this.watched_Num = watched_Num;
		this.watched_Date = watched_Date;
		this.youtube_id = youtube_id;
	}

	@Override
	public String toString() {
		return "VideoVO [id=" + id + ", exe_Num=" + exe_Num + ", exe_Name=" + exe_Name + ", exe_Video=" + exe_Video
				+ ", exe_Category=" + exe_Category + ", exe_Ehits=" + exe_Ehits + ", exe_Likecount=" + exe_Likecount
				+ ", exe_Date=" + exe_Date + ", watched_Num=" + watched_Num + ", watched_Date=" + watched_Date
				+ ", youtbe_id=" + youtube_id + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getExe_Num() {
		return exe_Num;
	}

	public void setExe_Num(int exe_Num) {
		this.exe_Num = exe_Num;
	}

	public String getExe_Name() {
		return exe_Name;
	}

	public void setExe_Name(String exe_Name) {
		this.exe_Name = exe_Name;
	}

	public String getExe_Video() {
		return exe_Video;
	}

	public void setExe_Video(String exe_Video) {
		this.exe_Video = exe_Video;
	}

	public String getExe_Category() {
		return exe_Category;
	}

	public void setExe_Category(String exe_Category) {
		this.exe_Category = exe_Category;
	}

	public int getExe_Ehits() {
		return exe_Ehits;
	}

	public void setExe_Ehits(int exe_Ehits) {
		this.exe_Ehits = exe_Ehits;
	}

	public int getExe_Likecount() {
		return exe_Likecount;
	}

	public void setExe_Likecount(int exe_Likecount) {
		this.exe_Likecount = exe_Likecount;
	}

	public Date getExe_Date() {
		return exe_Date;
	}

	public void setExe_Date(Date exe_Date) {
		this.exe_Date = exe_Date;
	}

	public int getWatched_Num() {
		return watched_Num;
	}

	public void setWatched_Num(int watched_Num) {
		this.watched_Num = watched_Num;
	}

	public Date getWatched_Date() {
		return watched_Date;
	}

	public void setWatched_Date(Date watched_Date) {
		this.watched_Date = watched_Date;
	}

	public String getYoutube_id() {
		return youtube_id;
	}

	public void setYoutube_id(String youtube_id) {
		this.youtube_id = youtube_id;
	}
	
}