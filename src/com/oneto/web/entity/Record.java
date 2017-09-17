package com.oneto.web.entity;

import java.sql.Date;

public class Record {
	
	private String RECORD_ID;
	private String RECORD_SCORE;
	private Date RECORD_DATE;
	private String MEMBER_NICKNAME;

	public String getRECORD_ID() {
		return RECORD_ID;
	}

	public void setRECORD_ID(String RECORD_ID) {
		this.RECORD_ID = RECORD_ID;
	}

	public String getRECORD_SCORE() {
		return RECORD_SCORE;
	}

	public void setRECORD_SCORE(Double RECORD_SCORE) {
		this.RECORD_SCORE = String.valueOf(RECORD_SCORE);
	}

	public Date getRECORD_DATE() {
		return RECORD_DATE;
	}

	public void setRECORD_DATE(Date RECORD_DATE) {
		this.RECORD_DATE = RECORD_DATE;
	}

	public String getNICKNAME() {
		return MEMBER_NICKNAME;
	}

	public void setNICKNAME(String MEMBER_NICKNAME) {
		this.MEMBER_NICKNAME = MEMBER_NICKNAME;
	}
	

	public Record(String RECORD_ID, String RECORD_SCORE, Date RECORD_DATE, String MEMBER_NICKNAME){
		this.RECORD_ID = RECORD_ID;
		this.RECORD_DATE = RECORD_DATE;
		this.RECORD_SCORE = RECORD_SCORE;
		this.MEMBER_NICKNAME = MEMBER_NICKNAME;
	}
	
	public Record(String RECORD_SCORE, String MEMBER_NICKNAME){
		this.RECORD_SCORE = RECORD_SCORE;
		this.MEMBER_NICKNAME = MEMBER_NICKNAME;
	}
	
	public Record(String RECORD_SCORE, String MEMBER_NICKNAME,Date RECORD_DATE){
		this.RECORD_SCORE = RECORD_SCORE;
		this.MEMBER_NICKNAME = MEMBER_NICKNAME;
		this.RECORD_DATE=RECORD_DATE;
	}

	public Record(String RECORD_SCORE,Date RECORD_DATE){
		this.RECORD_SCORE = RECORD_SCORE;
		this.RECORD_DATE = RECORD_DATE;
	}
	public Record(String RECORD_SCORE){
		this.RECORD_SCORE = RECORD_SCORE;
	}
}
