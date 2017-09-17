<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oneto.web.dao.*"%>
<%@ page import="com.oneto.web.entity.*"%>
<%@ page import="java.util.*"%>

<%
	String user = request.getParameter("nickname");
	String email = request.getParameter("email");
	String pwd = request.getParameter("password");
	String pwd2 = request.getParameter("password2");

	MemberDAO mm = new MemberDAO();

	boolean b = mm.nicknameExist(user);
	System.out.println(b);
	System.out.println(pwd);
	System.out.println(pwd2);
	
	if (b) {
		%>
		<script>
			alert('이미 존재하는 닉네임 입니다!');
			history.go(-1)
		</script>
		<%
	} else if (!pwd.equals(pwd2)){
		%>
		<script>
			alert('비밀번호가 일치하지 않습니다!');
			history.go(-1)
		</script>
		<%
	} else {
		Member m = new Member(user, pwd, email);
		mm.insert(m);
		response.sendRedirect("login.jsp");
		mm.close();
	}
%>

<!-- <a href=login.jsp>메인화면</a>
<a href = index.jsp> 메인화면으로 (3초후 자동이동!)</a> -->
