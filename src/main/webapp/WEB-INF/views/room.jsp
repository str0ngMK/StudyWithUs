<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Room</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
 		.container{ 
 			margin: 0 auto; 
 			padding: 50px;
 		}
		.container h1{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #8041D9;
			border-left: 3px solid #A566FF;
			margin-bottom: 20px;
		}
/* 		.roomContainer{ */
/* 			background-color: #F6F6F6; */
/* 			width: 500px; */
/* 			height: 500px; */
/* 			overflow: auto; */
/* 		} */
		.roomList{
			display: flex;
			flex-flow: row wrap;
		}
		.roomList .num{
			width: 75px;
			text-align: center;
		}
		.roomList .room{
			width: 350px;
		}
		.roomList .go{
			width: 71px;
			text-align: center;
		}
		button{
			background-color: #D1B2FF;
			font-size: 14px;
			color: #000;
			border: 1px solid #8041D9;
			border-radius: 5px;
			padding: 3px;
			margin: 3px;
		}
		.inputTable th{
			padding: 5px;
		}
		.inputTable input{
			width: 330px;
			height: 25px;
		}
		#roomName{
			width: 290px;
		}
		img{
			width: 320px;
			height: 250px;
		}
		.test{
			margin-right: 30px;
			margin-top : 10px;
		}
		.testname:hover{					/* 방 제목 */
			text-decoration: underline;		/* 밑줄 */
			cursor : pointer;				/* 손구락 */
			font-weight: bold;				/* 두껍게 */
		}
	</style>
</head>

<script type="text/javascript">
	var ws;
	window.onload = function(){
		getRoom();
		// createRoom();
	}

	function getRoom(){
		commonAjax('/getRoom.do', "", 'post', function(result){
			createChatingRoom(result);
		});
	}
	
	function createRoomPage(){
		location.href = "/createRoomPage.do";
/* 		$("#createRoom").click(function(){
			var msg = {	roomName : $('#roomName').val()	};

			commonAjax('/createRoom', msg, 'post', function(result){
				createChatingRoom(result);
			});

			$("#roomName").val("");
		}); */
	}

	function goRoom(number, name){
		location.href="/moveChating.do?roomName="+name+"&"+"roomNumber="+number;
	}

// 	function createChatingRoom(res){
// 		if(res != null){
// 			var tag = "<tr><th class='num'>순서</th><th class='room'>방 이름</th><th class='go'></th></tr>";
// 			res.forEach(function(d, idx){
// 				var rn = d.rname.trim();
// 				var roomNumber = d.rno;
// 				tag += "<tr>"+
// 							"<td class='num'>"+(idx+1)+"</td>"+
// 							"<td class='room'>"+ rn +"</td>"+
// 							"<td class='go'><button type='button' onclick='goRoom(\""+roomNumber+"\", \""+rn+"\")'>참여</button></td>" +
// 						"</tr>";	
// 			});
// 			$("#roomList").empty().append(tag);
// 		}
// 	}
	function createChatingRoom(res){
		if(res != null){
			var tag = "";
			res.forEach(function(d, idx){
				var rn = d.rname.trim();
				var roomNumber = d.rno;
				var roomImg = d.imageUrl;
				
/* 				tag += "<td class='roomImg'><img src=" + roomImg + "/></td>";
				tag += "<td class='go'><button type='button' onclick='goRoom(\""+roomNumber+"\", \""+rn+"\")'>참여</button></td>";	 */
 				
				tag += "<div class='test'><img src=" + roomImg + "/><br><a class='testname' onclick='goRoom(\""+roomNumber+"\", \""+rn+"\")'>" + rn + "</a></div>";
			});
// 			$("#roomList").empty().append(tag);
			$("#roomList").empty().append(tag);
		}
	}

	function commonAjax(url, parameter, type, calbak, contentType){
		$.ajax({
			url: url,
			data: parameter,
			type: type,
			contentType : contentType!=null?contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success: function (res) {
				calbak(res);
			},
			error : function(err){
				console.log('error');
				calbak(err);
			}
		});
	}
	
	function searchRoomPage(){
		var data = {'roomName' : $('#roomName').val()};
		commonAjax('/getRoom.do', data, 'post', function(result){
			createChatingRoom(result);
		});
	}
</script>
<body>
	<div class="container">
		<h1>채팅방</h1>
			<table class="inputTable">
				<tr>
					<th>방 제목</th>
					<th><input type="text" name="roomName" id="roomName"></th>
					<th><button onclick="searchRoomPage();">검색</button>
					<th><button onclick="createRoomPage();">방 생성</button></th>
				</tr>
			</table>
		<div id="roomContainer" class="roomContainer">
			<span id="roomList" class="roomList"></span>
		</div>
		<div>
		</div>
	</div>
</html>