<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="com.oneto.web.dao.*"%>
<%@ page import="com.oneto.web.entity.*"%>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="style.css" type="text/css">
<title>game</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">

</head>

<body>
	<div class="container">
		<header>
			<h1>집중력 게임! 1 to 50</h1>
		</header>
		<section class="content">
			<nav></nav>

			<main>
		<div id="left">
			<!-- 게임시간 -->
			<div id="left_timer">
				<div id="show_record">
					<p class="show_nick_record"><%=session.getAttribute("nickname")%> 님의 최고기록은 <%=session.getAttribute("record")%>입니다.</p>
					<p class="show_everyrecord">>>기록보기</p>	
				</div>			
				<div id="gamecontroller">
					<div class=mal></div>
					<div id=start><button id=startBtn>start</button></div>
				    <div id=restart><button id=restartBtn>restart</button></div>
					<div id=time class=pre><p id=gametimder>0</p></div>
					<div class=mal></div>
				</div>
				<div class=mal2></div>
			</div>

			<!-- 게임화면	 -->
			<div id="left_board">
				<div id=result>	<p class="show_nick_record"><%=session.getAttribute("nickname")%>님의 기록은  <%=request.getParameter("recentrecord")%>입니다.</p></div>
			</div>

		<div id="right">
			<div id="right_ranking">랭킹</div>
			<<div id="right_chatting">

				<div id=chatboard>
			    <!-- 메시지 표시 영역 -->
			    <textarea id="messageTextArea" readonly="readonly" rows="10" cols="45"></textarea><br />
			    <!-- 송신 메시지 텍스트박스 -->
			    <input type="text" id="messageText" size="50" />
			    <!-- 송신 버튼 -->
			    <input type="button" value="Send" onclick="sendMessage()" />
				</div>

				<form id=chat location=chat.jsp> 
					<!-- jquery 쓸때는 id 필요함 -->
					<input id=submitChat type=text name=chat value=chatting>
				</form>

				<script>
					$("#chat").focus(); // chat 창으로 포커스해쥼
					var h = $('#chatboard').prop('scrollHeight');
					$('#chatboard').scrollTop(h);
				</script>
							
			</div>
			</main>

			<aside>AD</aside>
		</section>

		<footer id="footer">
			<a href="https://opentutorials.org/course/1">홈페이지</a>
		</footer>
	</div>
<script type="text/javascript" src="js/script.js"></script>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
</html>

