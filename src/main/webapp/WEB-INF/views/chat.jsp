<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
	<title>Chating</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
		.container{
			width: 500px;
			margin: 0 auto;
			padding: 25px
		}
		.container h1{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #A566FF;
			border-left: 3px solid #A566FF;
			margin-bottom: 20px;
		}
		.chating{
 			background-color: #F6F6F6; 
			width: 500px;
			height: 500px;
			word-break:break-all;
			overflow-y: scroll;
		}
		.chating .me{
			background-color: #E8D9FF;
			color: #4C4C4C;
			text-align: right;
			font-weight: bold;
			border: 1px solid #E8D9FF;
			border-radius: 8px 8px 8px 8px;
			padding: 10px 10px 10px 10px;
			margin-top: 10px;
			margin-left: 40%;
			margin-right: 10px;
			margin-bottom: 10px;
			box-shadow: inset 1px 5px 3px 2px #FAEBFF, 1px 2px 3px 1px #BDBDBD;
		}
		.chating .others{
			background-color: #E8D9FF;
			color: #4C4C4C;
			text-align: left;
			font-weight: bold;
			border: 1px solid #E8D9FF;
			border-radius: 8px 8px 8px 8px;
			padding: 10px 10px 10px 10px;
			margin-top: 10px;
			margin-left: 10px;
			margin-right: 40%;
			margin-bottom: 10px;
			box-shadow: inset 1px 5px 3px 2px #FAEBFF, 1px 2px 3px 1px #BDBDBD;
		}
		input{
			width: 330px;
			height: 25px;
		}
		#yourMsg{
			display: none;
		}
	</style>
</head>

<script type="text/javascript">
	var ws;

	function wsOpen(){
		//웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
		ws = new WebSocket("ws://" + location.host + "/chating/"+$("#roomNumber").val());
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 동작
		}
		
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						$("#chating").append("<p class='me'>" + d.msg + "</p>");	
					}else{
						$("#chating").append("<p class='others'>" + d.userName + " :" + d.msg + "</p>");
					}	
						// 아래로 자동 스크롤
						document.querySelector('#chating').value += (d.msg + '\n');
						document.getElementById("chating").scrollTop = document.getElementById("chating").scrollHeight;
				}else{
					console.warn("unknown type!")
				}
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

	window.onload = function chatName(){
		var userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			$("#yourName").hide();
			$("#yourMsg").show();
		}
	}

	function send() {
		var option ={
			type: "message",
			roomNumber: $("#roomNumber").val(),
			sessionId : $("#sessionId").val(),
// 			member: $("#member").val(),
			userName : $("#userName").val(),
			msg : $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}
	
	// 삭제 버튼 이벤트
	function delete_btn(){
		var rNumber = $("#roomNumber").val();
		window.location.href = "/deleteRoom.do?no=" + rNumber;	
	}
	
	// 공부 타이머 이벤트
	
</script>
<body>
	<div id="container" class="container">
		<h1>${roomName}의 채팅방</h1>
		<button onclick="delete_btn()">방 삭제</button>
<!-- 		<button id= "timer" onclick="timer_btn()">타이머 시작</button> -->
		<span class="timer js-timer">00:00:00</span>
		<input class="js-timer_startBtn" type="button" value="시작" />
		<input class="js-timer_stopBtn" type="button" value="정지" />
			
		<input type="hidden" id="sessionId" value="">
		<input type="hidden" id="roomNumber" value="${roomNumber}">
		
		<div id="chating" class="chating">
		</div>
		<div id="yourName">
			<table class="inputTable">
				<tr>
					<th>사용자명</th>
					<th><input type="text" name="userName" id="userName" value="${sessionScope.member.id}" readonly="readonly"></th>
					<th><button onclick="chatName()" id="startBtn">이름 등록</button></th>
				</tr>
			</table>
		</div>
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
					<th><button onclick="send()" id="sendBtn">보내기</button></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>