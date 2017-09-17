<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oneto.web.dao.*"%> <!-- 패키지를 통째로 import -->
<%
	String user;
	String pwd;
	user = request.getParameter("nickname");
	pwd = request.getParameter("password");
	
	MemberDAO mm = new MemberDAO();
	RecordDAO rr = new RecordDAO();
	
	int bestrecord = rr.selectBest(user);
	
	boolean b = mm.isExist(user, pwd);
	
	mm.close();
	
	if(b){
		session.setAttribute("nickname",user);
		session.setAttribute("bestrecord",bestrecord);
		response.sendRedirect("main.jsp");
	}else{
%>

<script>
	alert('id나 password가 잘못되었습니다');
	history.go(-1)
</script>

<!-- 
<font color=red>fail~~~~</font>
<a href=javascript:history.go(-1)>back</a>
//history 기존페이지로 고고 -->

<%
}
%>

login id =<%=user%>
<br>
pwd = <%=pwd%>
<br>