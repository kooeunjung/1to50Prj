<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oneto.web.dao.*"%>
<%@ page import="com.oneto.web.entity.*"%>
<%@ page import="java.util.*"%>

<%
	String score =  request.getParameter("score"); //getparameter는 url로 오는 값을 받는것 같음!
	String nickname = request.getParameter("nickname");
	
	RecordDAO rr = new RecordDAO();
	Record r = new Record(score,nickname);
	rr.insert(r);
	
	int recentrecord = rr.select(nickname);
	//저장된값을 보내줘야aa
	response.sendRedirect("result.jsp?recentrecord="+recentrecord);
	rr.close();
	System.out.println(recentrecord);
%>

<!-- <a href=login.jsp>메인화면</a>
<a href = index.jsp> 메인화면으로 (3초후 자동이동!)</a> -->
