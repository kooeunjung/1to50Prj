package com.oneto.web.dao;

//src의 자바클래스사용안함! 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.oneto.web.entity.Member;
import com.oneto.web.properties.Property;

public class MemberDAO {

	// 클래스 전역변수로!
	Connection conn;

	// 생성자에는 커넥션까지!!
	public MemberDAO() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(Property.DB_URL, Property.DB_USER, Property.DB_PASSWD);
		System.out.println("커넥션 성공");
	}

	// 닫기
	public void close() throws Exception {
		conn.close();
	}

	// 카운트 존재하면!
	public boolean isExist(String user, String pwd) throws Exception {
		Statement stmt = conn.createStatement();

		String sql = "select count(*) from MEMBER where MEMBER_NICKNAME = '" + user + "' and MEMBER_PWD = '" + pwd + "'";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		int cnt = rs.getInt(1);
		rs.close();
		return cnt > 0;
	}
	
	public boolean nicknameExist(String user) throws Exception {
		Statement stmt = conn.createStatement();

		String sql = "select count(*) from MEMBER where MEMBER_NICKNAME = '" + user + "'";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		int cnt = rs.getInt(1);
		rs.close();
		return cnt > 0;
	}
	
	public void insert(Member m) throws Exception {
		String sql = "insert into MEMBER (MEMBER_NICKNAME, MEMBER_PWD, MEMBER_EMAIL) values(?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m.getMEMBER_NICKNAME());
		pstmt.setString(2, m.getMEMBER_PWD());
		pstmt.setString(3, m.getMEMBER_EMAIL());

		int out = pstmt.executeUpdate();
		System.out.println("out = " + out +" 레코드입력성공");
		pstmt.close();
		conn.close();
	}

	/*// db에 넣기 망한 함수!
	public void insert2(String mem_ID, String mem_PWD, String mem_NAME, String GENDER, String HOBBY) throws Exception {

		String sql = "INSERT INTO member VALUES(?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, mem_ID);
		pstmt.setString(2, mem_PWD);
		pstmt.setString(3, mem_NAME);
		pstmt.setString(4, GENDER);
		pstmt.setString(5, HOBBY);

		int out = pstmt.executeUpdate(); // 레코드를 하나 입력ㅎ -
		System.out.println("입력한레코드개수?:" + out);
		pstmt.close();
		conn.close();
	}*/

/*	public ArrayList<Member> select() throws SQLException {

		ArrayList<Member> ret = new ArrayList<Member>();
		String sql = "select * from member";
		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery(sql);

		while (rs.next()) {
			System.out.println(rs.getString("mem_ID") + "" + rs.getString("mem_PWD"));

			Member m = new Member(rs.getString("mem_ID"), rs.getString("mem_PWD"), rs.getString("mem_NAME"),
					rs.getString("GENDER"), rs.getString("HOBBY"));
			ret.add(m);
		}
		rs.close();
		stmt.close();
		return ret;
	}*/
	
	
	/*public Member select(String mem_ID) throws SQLException {
		String sql = "select * from member where mem_ID='"+mem_ID+"'";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);

		Member m = null;
		
		if (rs.next()) {
			m = new Member(rs.getString("mem_ID"),
					rs.getString("mem_PWD"),
					rs.getString("mem_NAME"),
					rs.getString("GENDER"),
					rs.getString("HOBBY"));
		}
		rs.close();
		stmt.close();
		return m;
	}
	
	public int delete(String mem_ID) throws Exception{
		Statement stmt = conn.createStatement();
		String sql = "delete from member where mem_ID='"+mem_ID+"'";
		int cnt = stmt.executeUpdate(sql); //비셀렉트문일때 다 업데이트 쓴다.
		stmt.close();
		return cnt;
	}
	
	public void update(Member m) throws Exception {
		String sql = "update member set mem_PWD = ?,mem_NAME=?,GENDER=?,HOBBY=? where mem_ID="+m.mem_ID+"'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m.mem_PWD);
		pstmt.setString(2, m.mem_NAME);
		pstmt.setString(3, m.GENDER);
		pstmt.setString(4, m.HOBBY);

		int out = pstmt.executeUpdate();
		System.out.println("out = " + out);
		pstmt.close();
		conn.close();
	}*/
}