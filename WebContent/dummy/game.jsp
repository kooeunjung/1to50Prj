<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
	/* 셔플함수의 정의 */
	function shuffle(a) {
		var j, x, i;
		for (i = a.length; i; i--) { //shuffle(idxs) 
			j = Math.floor(Math.random() * i);
			x = a[i - 1];
			a[i - 1] = a[j];
			a[j] = x;
		}
	}
</script>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="style.css" type="text/css">
<title>game</title>

</head>
<body>
	<div class="container">
		<header>
			<h1>집중력 게임! 1 to 50</h1>
		</header>
		<section class="content">
			<nav>
				<!-- <ul>
					<li>html</li>
					<li>css</li>
					<li>javascript</li>
				</ul> -->
			</nav>


			<main>
		<div id="left">
			<!-- 게임시간 -->
			<div id="left_timer">
				<div id=time class=pre>0</div>
				<h3><%=session.getAttribute("id")%> 님께서 로그인하셨습니다.
</h3>
			</div>

			<!-- 게임화면	 -->
			<div id="left_board">
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

				<button id=reload>초기화</button>

			</div>
		</div>

		<div id="right">
			<div id="right_ranking">랭킹</div>
			<div id="right_chatting">

				<%
					String id = "koo";
					String message = "어서오세요";
					BufferedReader br = new BufferedReader(new FileReader("c:/koo/chat.txt"));
					String line = "";
					while ((line = br.readLine()) != null) {

						message += line;
					}
					br.close();

					String chat = request.getParameter("chat"); // 폼태그의 input name=chat에서 받아옴!
					if (chat != null) { // chat 초기값이 없기때문엥
						message += "[" + id + "]" + chat + "<br>";
						BufferedWriter bw = new BufferedWriter(new FileWriter("c:/koo/chat.txt"));
						bw.write(message);
						bw.close();
					}
				%>
				<div id=chatboard>
					<%=message%>
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
		</div>
			</main>

			<aside>AD</aside>
		</section>

		<footer id="footer">
			<a href="https://opentutorials.org/course/1">홈페이지</a>
		</footer>
	</div>
</body>
</html>
<!-- //////JavaScript/////// -->
<script>
	var index = 0; //내가 풀 문제
	var data = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
			19, 20, 21, 22, 23, 24, 25 ];

	var data2 = [ 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
			41, 42, 43, 44, 45, 46, 47, 48, 49, 50 ];

	shuffle(data);
	shuffle(data2);

	//1단계 idea! 
	//$("#btn0").text("1");
	//2단계 idea!
	//$("#btn0").text(data[0]);
	//3단게
	/* for(i=0;i<25;i++)
	 $("#btn"+i).text(data[idxs]); */
	//4단계
	
	$("button.btn").each(function(i, obj) {
		$(obj).text(data[i]);
	});

	var value = 1;
	$("button.btn").click(function() {
		var answer = $(this).text();

		if (answer == value) {
			if (answer <= 25) {
				$(this).fadeOut(200, function(){
					$(this).text(data2[value - 1]).fadeIn(200); //동기비동기	!!! 비동기 방식을 구현하기 위한 방식!! callback function
				console.log(data2[value-1])
				});
			} else
				$(this).text("");
			value++;
		} else {
			$(this).effect("shake");
		}
	});

	setInterval(function() {
		$("#time").text(parseInt($("#time").text()) + 1);
	}, 1000);

	$("#reload").click(function() {
		location.reload();
	});


</script>
