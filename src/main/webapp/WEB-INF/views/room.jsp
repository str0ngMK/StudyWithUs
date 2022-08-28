<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/includes/navigationbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/redirect.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Room</title>
	<style>
/*  		*{  */
/*  			margin:0;  */
/*  			padding:0;  */
/*  		}  */
/*  		.container{  */
/*  			margin: 0 auto;  */
/*  			padding: 50px; */
/*  		} */
		.container h2{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #8041D9;
			margin-bottom: 20px;
			font-weight: bold;
		}
		#book{
			width: 50px;
			height: 50px;
			margin-right: 15px;
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
		.test{
			border-radius: 10px 10px 10px 10px;
			box-shadow: 0 -10px 50px -5px #E8D9FF inset;
			margin-right: 30px;
			margin-top : 10px;
		}
		.img{
			border-radius: 10px 10px 10px 10px;
			width: 320px;
			height: 250px;
		}
		.rName{
			font-size: 20px;
		}
		.rName:hover{					/* 방 제목 */
			cursor : pointer;				/* 손구락 */
			font-weight: bold;				/* 두껍게 */
		}
		.rRowner{
			float: right;
			flex-direction: row-reverse;
		}
		
		.mainBtn{
			margin-left: 10px;
			background-color: #D1B2FF;
			border: 1.5px solid #A566FF;
			border-radius: 5px;
			color: white;
		}
		.mainBtn:hover {
			background-color: #A566FF;
		}
}
	</style>
</head>

<script type="text/javascript">
	var ws;
	window.onload = function(){
		getRoom();
	}

	function getRoom(){
		commonAjax('/getRoom.do', "", 'post', function(result){
			createChatingRoom(result);
		});
	}
	
	function createRoomPage(){
		location.href = "/createRoomPage.do";
	}

	function goRoom(number, name){
		window.open("/moveChat.do?roomName="+name+"&"+"roomNumber="+number, 'go', 'width=495, height=730');
	}

	function createChatingRoom(res){
		if(res != null){
			var tag = "";
			res.forEach(function(d, idx){
				var rn = d.rname.trim();
				
				var roomNumber = d.rno,
				    roomImg = d.imageUrl,
				    category = d.category,
				    rowner = d.rowner;
 				
				tag += "<div class='test'><img class='img' src=" + roomImg + "/><br><p class='rCategory'>[" + category + "]</p><a class='rName' onclick='goRoom(\""+roomNumber+"\", \""+rn+"\")'>" + rn +"</a><a class='rRowner'>" + rowner + "</a></div>";
			});
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
		var data = {'roomName' : $('#roomName').val(),
					'category' : $("select[name=category]").val()};
		commonAjax('/getRoom.do', data, 'post', function(result){
			createChatingRoom(result);
		});
	}
	
	function logout(){
		location.href = '/login/logout';
	}
	
</script>
<body>
	<div class="container">
		<h2><img id="book" src="/resources/image/studyBook.png"/>STUDY</h2>
			<table class="inputTable">
				<tr>
					<th>
						<select name="category">
							<option>전체</option>
							<option>자격증</option>
							<option>수능</option>
							<option>임용고시</option>
							<option>기타</option>
						</select>
					</th>
					<th><input type="text" name="roomName" id="roomName" placeholder="제목"></th>
					<th><button class="mainBtn" onclick="searchRoomPage();">검색</button></th>
					<th><button class="mainBtn" onclick="createRoomPage();">방 생성</button></th>
				</tr>
			</table>
		<div id="roomContainer" class="roomContainer">
			<span id="roomList" class="roomList"></span>
		</div>
		<div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>