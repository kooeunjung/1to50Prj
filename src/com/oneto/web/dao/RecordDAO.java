package com.oneto.web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.oneto.web.entity.Member;
import com.oneto.web.entity.Record;
import com.oneto.web.properties.Property;

public class RecordDAO {

	Connection conn;

	// 생성자에는 커넥션까지!!
	public RecordDAO() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(Property.DB_URL, Property.DB_USER, Property.DB_PASSWD);
		System.out.println("커넥션 성공");
	}

	// 닫기
	public void close() throws Exception {
		conn.close();
	}

	// 점수삽입
	public void insert(Record r) throws Exception {
		String sql = "insert into RECORD (RECORD_SCORE,MEMBER_NICKNAME) values(?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, String.valueOf(r.getRECORD_SCORE()));
		pstmt.setString(2, r.getNICKNAME());

		int out = pstmt.executeUpdate();
		System.out.println("out = " + out + " 레코드입력성공," + r.getRECORD_SCORE() + "," + r.getNICKNAME());
		pstmt.close();
	}

	// 점수가져오기
	public int select(String MEMBER_NICKNAME) throws SQLException {
		int recentrecord = 0;
		System.out.println("-------select()-------");
		String sql = "select RECORD_SCORE from RECORD where MEMBER_NICKNAME='" + MEMBER_NICKNAME
				+ "'order by RECORD_DATE desc LIMIT 1";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		System.out.println(sql);
		if (rs.next()) {
			recentrecord = rs.getInt(1);
			System.out.println(recentrecord);
		}
		rs.close();
		stmt.close();
		conn.close();
		System.out.println("-------select 끝------------");
		return recentrecord;
	}

	// 최고점수
	public int selectBest(String MEMBER_NICKNAME) throws Exception {

		System.out.println("-------selectBest 시작------------");
		int bestrecord = 0;

		Statement stmt = conn.createStatement();
		ResultSet rs = null;

		String sql = "select RECORD_SCORE from RECORD where MEMBER_NICKNAME='" + MEMBER_NICKNAME
				+ "' order by RECORD_SCORE asc LIMIT 1";
		rs = stmt.executeQuery(sql);
		System.out.println("^^:" + sql);
		boolean next = rs.next();
		System.out.println("next():" + next);
		if (next) {
			bestrecord = rs.getInt(1);
			System.out.println(bestrecord);
		}
		rs.close();
		stmt.close();
		conn.close();

		System.out.println("-------selectBest 끝------------");
		return bestrecord;
	}

	// 1주일 랭킹
	public ArrayList<Record> select1weekrank() throws SQLException {

		ArrayList<Record> rec = new ArrayList<Record>();
		String sql = "SELECT RECORD_SCORE,MEMBER_NICKNAME,RECORD_DATE FROM RECORD WHERE TO_DAYS(NOW()) - TO_DAYS(RECORD_DATE) <= 7 order by RECORD_SCORE asc LIMIT 30";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);

		while (rs.next()) {

			System.out.println(
					rs.getString("RECORD_SCORE") + rs.getString("MEMBER_NICKNAME") + rs.getDate("RECORD_DATE"));

			Record r = new Record(rs.getString("RECORD_SCORE"), rs.getString("MEMBER_NICKNAME"),
					rs.getDate("RECORD_DATE"));
			rec.add(r);
		}
		rs.close();
		stmt.close();
		return rec;
	}

	// 랭킹
	public ArrayList<Record> selectallrank() throws SQLException {

		ArrayList<Record> rec = new ArrayList<Record>();
		String sql = "SELECT RECORD_SCORE,MEMBER_NICKNAME,RECORD_DATE FROM RECORD order by RECORD_SCORE asc LIMIT 30";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);

		while (rs.next()) {

			/*
			 * System.out.println(rs.getString("RECORD_SCORE")+rs.getString(
			 * "MEMBER_NICKNAME")+rs.getDate("RECORD_DATE"));
			 */

			Record r = new Record(rs.getString("RECORD_SCORE"), rs.getString("MEMBER_NICKNAME"),
					rs.getDate("RECORD_DATE"));
			rec.add(r);
		}
		rs.close();
		stmt.close();
		return rec;
	}

	public ArrayList<Record> memberRecord(String MEMBER_NICKNAME) throws SQLException {

		ArrayList<Record> rec = new ArrayList<Record>();
		String sql = "select RECORD_SCORE,RECORD_DATE from RECORD where MEMBER_NICKNAME='" + MEMBER_NICKNAME
				+ "'order by RECORD_DATE desc";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);

		while (rs.next()) {

			/*
			 * System.out.println(rs.getString("RECORD_SCORE")+rs.getDate(
			 * "RECORD_DATE"));
			 */

			Record r = new Record(rs.getString("RECORD_SCORE"), rs.getDate("RECORD_DATE"));
			rec.add(r);
		}
		rs.close();
		stmt.close();
		return rec;
	}
}
