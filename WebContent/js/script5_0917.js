	
/*-----------------------------배경-------------------------------*/

	(function($) {
	  $(".container").shards([10,35,180,.15],[255,20,220,.25],[0,0,0,.25],20,.58,2,.15,true);
	})(jQuery);

/*-----------------정의된 함수------------*/

	function shuffle(a) {
		var j, x, i;
		for (i = a.length; i; i--) { // shuffle(idxs)
			j = Math.floor(Math.random() * i);
			x = a[i - 1];
			a[i - 1] = a[j];
			a[j] = x;
		}
	}
/*------------------------------default---------------------------------*/
		var index = 0; // 내가 풀 문제
		var data = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
				19, 20, 21, 22, 23, 24, 25 ];

		var data2 = [ 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
				41, 42, 43, 44, 45, 46, 47, 48, 49, 50 ];

		shuffle(data);
		shuffle(data2);

		$("button.btn").each(function(i, obj) {
			$(obj).text(data[i]);
		});
		var value = 1;
		
		$("#restartBtn").hide();
		$("#gametimder").hide();
		$("#game_board").hide();
		
		
/*---------------------------------버튼 눌렀을때 사라짐------------------------------*/		

		$("button.btn").click(function() {
			var answer = $(this).text();
			var gametimer= $("#time").text();
			var nickname = $("#real_nickname").text();
			console.log(nickname);
			if (answer == value) {
				if (answer <= 25) {
					$(this).fadeOut(200, function(){
						$(this).text(data2[value - 2]).fadeIn(200); 
					console.log(data2[value-2])
										});
				} else if(answer<=49){
					$(this).text("");
					console.log(answer);
				} else {
					var record= $("#time").text();
					console.log(gametimer); //50눌렀을 때 시간이 찍힌다!
					$("button.btn").text("");
					$("#restartBtn").hide();
					$("#gametimer").hide();
					$("#game_board").hide();
					$("#time").text(record);
					$("#startBtn").show();
					var URL = "result-proc.jsp?score="+ record +"&nickname=" +nickname; //result-proc 으로 record와 nickname을 넘겨준다.
					location.href=URL;
				}
				value++;
			} else {
				$(this).effect("shake");
			}
		});

/*---------------------------------시간째깍째깍------------------------------*/			
		
/*		setInterval(function() {
			$("#time").text(parseInt($("#time").text()) + 1);
		}, 1000);*/

/*--------------------------------start------------------------------*/				
		$("#startBtn").click(function() {
			$("#game_board").show();
			shuffle(data);
			shuffle(data2);
			$("button.btn").each(function(i, obj) {
				$(obj).text(data[i]);
			});
			$("#startBtn").hide();
			$("#restartBtn").show();
			/*---------------------------------------*/
			var value = 1;
			setInterval(function() {
				$("#time").text(parseInt($("#time").text()) + 1);
			}, 1000);
		});
/*---------------------------------리로드------------------------------*/				
		
		$("#restartBtn").click(function() {
			location.reload();
		});
		
/*--------------------------------웹소켓채팅------------------------------*/		
        //웹소켓 초기화
        var webSocket = new WebSocket("ws://localhost:8080/1to50Prj/broadsocket");
        var messageTextArea = document.getElementById("messageTextArea");

        //메시지가 오면 messageTextArea요소에 메시지를 추가한다.
        webSocket.onmessage = function processMessge(message){
        
		//Json 풀기
        var jsonData = JSON.parse(message.data);
            if(jsonData.message != null) {
                messageTextArea.value += jsonData.message + "\n"
            };
        }
        
		//메시지 보내기
        function sendMessage(){
            var messageText = document.getElementById("messageText");
            webSocket.send(messageText.value);
            messageText.value = "";
        }
		$("#chat").focus(); // chat 창으로 포커스해쥼
		
		var h = $('#chatboard').prop('scrollHeight');
		$('#chatboard').scrollTop(h);

/*--------------------------------랭킹------------------------------*/
