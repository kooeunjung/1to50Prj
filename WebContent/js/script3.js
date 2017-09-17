/**
 *  /* 셔플함수의 정의 9월 4일 수정분
 */
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
			if (answer == value) {
				if (answer < 26) {
					$(this).fadeOut(200, function(){
						$(this).text(data2[value - 2]).fadeIn(200); 
					console.log(data2[value-2])
										});
				} else
					$(this).text("");
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
			
			console.log(data2);
			
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
		