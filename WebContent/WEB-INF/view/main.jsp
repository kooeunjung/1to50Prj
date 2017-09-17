<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.oneto.web.dao.*"%>
<%@ page import="com.oneto.web.entity.*"%>
<%
	RecordDAO rd = new RecordDAO();
	ArrayList<Record> weeklylist = rd.select1weekrank();
	ArrayList<Record> everylist = rd.selectallrank();
%>

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript" src="js/shards.js"></script>
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
		<div class="subtitle">순발력게임</div>
	    <div class="title"> 1 to 50</div>
		</header>
		
		<section class="content"> 
		<nav> </nav> 
		<main>
		<div id="left">
<!--------------------------------------------------------- 게임콘트롤영역 + 시간 --------------------------------------------------------->
			<div id="left_timer">
				<div id="show_record">
					<div class="show_nickname">
						<p class="show_nick_record"><%=session.getAttribute("nickname")%></p>
					</div>
					<div class="show_nickname">
					님의 최고기록은
					<%=session.getAttribute("record")%>입니다.
					</div>
					<p class="show_everyrecord"> >>기록보기</p>
				</div>
				<div id="gamecontroller">
					<div class=mal></div>
					<div id=start>
						<button id=startBtn>start</button>
					</div>
					<div id=restart>
						<button id=restartBtn>restart</button>
					</div>
					<div id=time class=pre>
						<p id=gametimder>0</p>
					</div>
					<div class=mal></div>
				</div>
				<div class=mal2></div>
			</div>

				
<!---------------------------------------------------------게임영역----------------------------------------------- -->
			<div id="left_board">
				<div class=mal2></div>
				<div id="game_board">
					<table>
						<tr>
							<td><button class=btn>1</button></td>
							<td><button class=btn>2</button></td>
							<td><button class=btn>3</button></td>
							<td><button class=btn>4</button></td>
							<td><button class=btn>5</button></td>
						</tr>
						<tr>
							<td><button class=btn>1</button></td>
							<td><button class=btn>2</button></td>
							<td><button class=btn>3</button></td>
							<td><button class=btn>4</button></td>
							<td><button class=btn>5</button></td>
						</tr>
						<tr>
							<td><button class=btn>1</button></td>
							<td><button class=btn>2</button></td>
							<td><button class=btn>3</button></td>
							<td><button class=btn>4</button></td>
							<td><button class=btn>5</button></td>
						</tr>
						<tr>
							<td><button class=btn>1</button></td>
							<td><button class=btn>2</button></td>
							<td><button class=btn>3</button></td>
							<td><button class=btn>4</button></td>
							<td><button class=btn>5</button></td>
						</tr>
						<tr>
							<td><button class=btn>1</button></td>
							<td><button class=btn>2</button></td>
							<td><button class=btn>3</button></td>
							<td><button class=btn>4</button></td>
							<td><button class=btn>5</button></td>
						</tr>
					</table>
				</div>
				<!-- <div class=mal2></div> -->
			</div>
		</div>

		<div id="right">
		
	<!---------------------------------------------------------랭킹영역----------------------------------------------- -->
			<div id="right_rangking">
				<div class="ranking_Space"></div>
				<div id="weekly_ranking">
					<div class="rankingTitle">주간 랭킹</div>
					<div class="ranking" onload="scroller()">
						<table class="rangkingtable">
							<%
								for (int i = 0; i < weeklylist.size(); i++) {
									Record weekly = weeklylist.get(i);
							%>
							<tr>
								<td id="stage"><%=i + 1%>등</td>
								<td class="hoho"><%=weekly.getRECORD_SCORE()%> 초</td>
								<td class="hoho2"><%=weekly.getNICKNAME()%></td>
								<td class="hoho3"><%=weekly.getRECORD_DATE()%></td>
								<%
									}
								%>
							
						</table>
					</div>
				</div>
				<div class="ranking_Space"></div>
				<div id="every_ranking">
					<div class="rankingTitle">전체 랭킹</div>
					<div class="ranking" onload="scroller()">
						<table class="rangkingtable">
							<%
								for (int i = 0; i < everylist.size(); i++) {
									Record every = everylist.get(i);
							%>
							<tr>
								<td id="stage"><%=i + 1%>등</td>
								<td class="hoho"><%=every.getRECORD_SCORE()%> 초</td>
								<td class="hoho2"><%=every.getNICKNAME()%></td>
								<td class="hoho3"><%=every.getRECORD_DATE()%></td>
								<%
									}
									rd.close();
								%>
							
						</table>
					</div>
				</div>
			</div>
			
<!---------------------------------------------------------채팅영역----------------------------------------------- -->
			<div id="right_chatting">
			  
				<div id="chatboard">
					<!-- 메시지 표시 영역 -->
					<textarea id="messageTextArea" readonly="readonly" rows="15"
						cols="35">
				     <%=session.getAttribute("nickname")%> 님 입장
						</textarea>
					    
					<!-- 송신 메시지 텍스트박스 -->
					<div id=sendbox">
						<input type="text" id="messageText" size="30" />
						<!-- 송신 버튼 -->
						<button class="sendBtn" type="button" value="Send" onclick="sendMessage()" />
					</div>
				</div>
	
			</div>
		</main> <aside></aside> </section>
			
<!---------------------------------------------------------푸터영역----------------------------------------------- -->
		<footer id="footer"> 
		<p>Copyright 2017 8-9 kooeunjung</p>
		</footer>
	</div>
	<script type="text/javascript" src="js/script.js"></script>
	<script src="//code.jquery.com/jquery-1.12.4.js"></script>
	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</body>
</html>

