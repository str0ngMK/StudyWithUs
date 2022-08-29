<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/navigationbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/redirect.jsp"></jsp:include>
<meta charset="UTF-8">
<title>create room</title>
<style>
	.tright{
		padding-left: 10px;
	}
	.tleft{
		line-height: 50px;
		display: flex;
		flex-direction: row-reverse;
	}
	.tbutton{
		padding-top: 10px;
		display: flex;
		flex-direction: row;
		justify-content: center;
	}
	#sub{
		margin-left: 10px;
		background-color: #D1B2FF;
		border: 1.5px solid #A566FF;
		border-radius: 5px;
		color: white;
	}
	#sub:hover {
		background-color: #A566FF;
	}
	
	#createTable{
		margin: 0 auto;
	}
	.createBox{
		width: 300px;
		height: 30px;
	}
	.createOp{
		width: 309px;
		height: 30px;
	}
}
</style>
</head>

<!-- 
/* 		$("#createRoom").click(function(){
			var msg = {	roomName : $('#roomName').val()	};

			commonAjax('/createRoom', msg, 'post', function(result){
				createChatingRoom(result);
			});

			$("#roomName").val("");
		}); */


 -->

<body>
<form action="/createRoom.do" method="post">
<table id="createTable">
	<tr>
		<td class="tleft">룸 제목</td>
		<td class="tright"><input class="createBox" type="text" name="roomName" required="required"></td>
	</tr>
	<tr>
		<td class="tleft">카테고리</td>
		<td class="tright">
			<select class="createOp" name="category">
				<option>자격증</option>
				<option>수능</option>
				<option>임용고시</option>
				<option>기타</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="tleft">인원수</td>
		<td class="tright">
			<select class="createOp" name="userCount">
				<option>2</option>
				<option>3</option>
				<option>4</option>
				<option>5</option>
				<option>6</option>
				<option>7</option>
				<option>8</option>
				<option>9</option>
				<option>10</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="tleft">비밀번호</td>
		<td class="tright">
			<input type="radio" name="pwdYn" value="1">허용
			<input type="radio" name="pwdYn" value="0">거부
		</td>
	</tr>
	<tr>
		<td class="tleft"></td>
		<td class="tright"><input class="createBox" type="password" name="pwd"></td>
	</tr>
	<tr hidden="true">
		<td class="tleft"  hidden="true">이미지 첨부</td>
		<td class="tright" hidden="true"><input type="file" name="roomImage"  hidden="true"></td>
	</tr>
	<tr>
		<td></td>
		<td class="tbutton">
			<button type="button" onclick="back()">취소</button>
			<button type="submit" id="sub">생성</button>
		</td>
	</tr>
</table>
</form>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
<script type="text/javascript">
	function back() {
		window.history.back();
	}
</script>
</html>