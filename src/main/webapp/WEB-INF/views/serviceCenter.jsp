<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ include file="/WEB-INF/views/includes/navigationbar.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>고객센터</title>
<style type="text/css">
	#Accordion_wrap{
  		box-sizing: border-box;   
	}
	  
	.que:first-child{
	    border-top: 1px solid black;
	}
	  
	.que{
		position: relative;
		padding: 17px 0;
		cursor: pointer;
		font-size: 14px;
		border-bottom: 1px solid #dddddd;
	}
	  
	.que::before{
 		display: inline-block;
		content: 'Q';
		font-size: 14px;
		color: #006633;
		margin: 0 5px;
	}
	
	.que.on>span{
		font-weight: bold;
		color: #006633; 
	}
	  
	.anw {
		display: none;
		overflow: hidden;
		font-size: 14px;
		background-color: #f4f4f2;
		padding: 27px 0;
	}
	  
	.anw::before {
 		display: inline-block;
		content: 'A';
		font-size: 14px;
		font-weight: bold;
		color: #666;
		margin: 0 5px;
	}
	
	.arrow-wrap {
		position: absolute;
		top:50%; right: 10px;
		transform: translate(0, -50%);
	}
	
	.que .arrow-top {
		display: none;
	}
	.que .arrow-bottom {
		display: block;
	}
	.que.on .arrow-bottom {
		display: none;
	}
	.que.on .arrow-top {
	 	display: block; 
	}
	
	.All{
		width: 100%;
		height: 100%;
		display: flex;
	}
	.left{
		display: block;
		width: 50%
	}
	.right{
		border-top: solid 1px black;
		border-left: dashed 1px black;
		display: block;
		width: 50%;
	}
	#tlqkf{
		text-align: center;
		font-size: 40px;
		color: white;
	}
	
	.topAll{
		width: 100%;
		height: 100%;
		display: flex;
	}
	.textLeft{
		display: block;
		width: 50%;
	}
	.textRight{
		display: block;
		width: 50%;
	}
	#topText{
		font-weight: bold;
		font-size: 30px;
	}
	
	.table{
		margin: 0 auto;
	}
	.tText{
		font-size: 100px;
	}
	
	#Ttitle{
		width: 300px;
		height: 30px;
	}
	#Twriter{
		width: 300px;
		height: 30px;
	}
	textarea{
		width: 355px;
		height: 200px;
		resize: none;
	}
	#submit{
		width: 100px;
		margin-left: 200px;
	}
</style>
</head>
<body>
<h1>고객센터</h1>
<br>
<div class="topAll">
	<div class="textLeft">
		<p id="topText">자주 묻는 질문</p>
	</div>
	<div class="textRight">
		<p id="topText">관리자에게 문의하기</p>
	</div>
</div>
<div class="All">
	<div class="left">
		<div id="Accordion_wrap">
		     <div class="que">
		     	<span>회원가입 안된다 이사람아</span>
		     </div>
		     <div class="anw">
		     	<span>정보 누락없이 다 작성해라</span>
		     </div>
		     <div class="que">
		     	<span>아이디를 까먹었다 어카냐</span>
		     </div>
		     <div class="anw">
		     	<span>그건 나도 어쩔 수가 없다</span>
		     </div>
		     <div class="que">
		     	<span>비밀번호는 어캐 찾냐</span>
		     </div>
		     <div class="anw">
		     	<span>메모장에 써놔라</span>
		     </div>
		</div>
	</div>
	<div class="right">
	<form action="/askService.do" method="post">
		<table class="table">
			<tr>
				<td><p class="Ttext">제목</p></td>
				<td><input type="text" id="Ttitle" name="title" placeholder="제목"/></td>
			</tr>
			<tr>
				<td><p class="Ttext">작성자</p></td>
				<td><input type="text" id="Twriter" value="${sessionScope.member.id}" readonly="readonly" /></td>
			</tr>
			<tr>
				<td><p class="Ttext">내용</p></td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="content" placeholder="문의 내용"></textarea></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" id="submit" value="전송"/></td>
			</tr>
		</table>
	</form>
	</div>
</div>
</body>
<script type="text/javascript">
$(".que").click(function() {
	   $(this).next(".anw").stop().slideToggle(300);
	  $(this).toggleClass('on').siblings().removeClass('on');
	  $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
	});
</script>
</html>