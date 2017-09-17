<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>

<%

	String chat = request.getParameter("chat"); // 폼태그의 input name=chat에서 받아옴!
	String message = (String)application.
		getAttribute("message"); //29번재 라인에서 message가 String임을 알려줬기 때문에 에러가 런타임 에러가 난것이다.
		//getatt 로 할때는 setatt로 가져올 타입은 동일 타입이다 라고 하고 가정을 하는 것이다.!! 
	
	if (message == null) {                      // chat 초기값이 없기때문엥
		application.setAttribute("message","채팅서비스<br>");
		message = "채팅서비스<br>";
	}

	if (chat != null) { // chat 초기값이 없기때문엥
		message += chat + "<br>";
		application.setAttribute("message",message);
		message = "ok";
	}
%>

 
<%=message%><!--  //달나라로 가라는 문장 -->