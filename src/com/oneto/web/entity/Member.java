package com.oneto.web.entity;
public class Member {
	
	private String MEMBER_ID;
	  private String MEMBER_NICKNAME;
	  private String MEMBER_PWD;
	  private String MEMBER_EMAIL;
	   
	  
  public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String MEMBER_ID) {
		MEMBER_ID = MEMBER_ID;
	}
	public String getMEMBER_NICKNAME() {
		return MEMBER_NICKNAME;
	}
	public void setMEMBER_NICKNAME(String MEMBER_NICKNAME) {
		MEMBER_NICKNAME = MEMBER_NICKNAME;
	}
	public String getMEMBER_PWD() {
		return MEMBER_PWD;
	}
	public void setMEMBER_PWD(String mEMBER_PWD) {
		MEMBER_PWD = mEMBER_PWD;
	}
	public String getMEMBER_EMAIL() {
		return MEMBER_EMAIL;
	}
	public void setMEMBER_EMAIL(String mEMBER_EMAIL) {
		MEMBER_EMAIL = mEMBER_EMAIL;
	}

   public Member(String MEMBER_ID, String MEMBER_NICKNAME, String MEMBER_PWD, String MEMBER_EMAIL) {
      this.MEMBER_ID = MEMBER_ID;
      this.MEMBER_NICKNAME = MEMBER_NICKNAME;
      this.MEMBER_PWD = MEMBER_PWD;
      this.MEMBER_EMAIL = MEMBER_EMAIL;
   }
   public Member(String MEMBER_NICKNAME, String MEMBER_PWD, String MEMBER_EMAIL) {
	      this.MEMBER_NICKNAME = MEMBER_NICKNAME;
	      this.MEMBER_PWD = MEMBER_PWD;
	      this.MEMBER_EMAIL = MEMBER_EMAIL;
	   }
}
