<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/navigationbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/redirect.jsp"></jsp:include>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>고객센터</title>
<style type="text/css">
	#serviceTitle{
		font-weight: bold;
		color: #8041D9;
	}
	#service{
		width: 50px;
		height: 50px;
		margin-right: 15px;
	}
	
	#Accordion_wrap{
  		box-sizing: border-box;
  		margin-bottom: 120px;
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
		width: 50%;
	}
	#left_bottom{
		border-top: solid 1px black;
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
		font-size: 20px;
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
	
	#ask_list{
		width: 100%;
	    border-collapse: collapse;
	}
	.th_item, .td_item{
		border-bottom: 1px solid #444444;
    	padding: 10px;
    	text-align: center;
	}
</style>
</head>
<body>
<div class="container">
	<h2 id="serviceTitle"><img id="service" src="/resources/image/service.png"/>고객센터</h2>
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
			     	<span>회원가입이 되질 않습니다.</span>
			     </div>
			     <div class="anw">
			     	<span>정보 입력란에 누락된 정보가 있는지 확인해보세요. <br>자세한 사항은 관리자에게 문의 바랍니다.</span>
			     </div>
			     <div class="que">
			     	<span>스터디룸을 증설하고 싶습니다.</span>
			     </div>
			     <div class="anw">
			     	<span>로그인 ▷ 상단 '스터디 참여' 클릭 ▷ '방 생성' 버튼 클릭</span>
			     </div>
			     <div class="que">
			     	<span>회원 탈퇴를 하고싶습니다.</span>
			     </div>
			     <div class="anw">
			     	<span>로그인 후 마이페이지 ▷ 회원 탈퇴</span>
			     </div>
			</div>
			<p id="topText">문의 내역</p>
			<div id="left_bottom">
				<form action="/askList.do" method="get">
					<table id="ask_list">
						<tr>
							<th class="th_item">제목</th>
							<th class="th_item">작성일</th>
							<th class="th_item">상태</th>
						</tr>
						<tr>
							<td class="td_item">안녕하세요</td>
							<td class="td_item">2022.08.28</td>
							<td class="td_item">답변 대기</td>
						</tr>
						<tr>
							<td class="td_item">안녕하세요</td>
							<td class="td_item">2022.08.28</td>
							<td class="td_item">답변 대기</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div class="right">
			<form action="/askService.do" method="post">
				<table class="table">
					<tr>
						<td><p class="Ttext">제목</p></td>
						<td><input type="text" id="Ttitle" name="title" placeholder="제목" required/></td>
					</tr>
					<tr>
						<td><p class="Ttext">작성자</p></td>
						<td><input type="text" id="Twriter" value="${sessionScope.member.id}" readonly="readonly" required/></td>
					</tr>
					<tr>
						<td><p class="Ttext">내용</p></td>
					</tr>
					<tr>
						<td colspan="2"><textarea name="content" placeholder="문의 내용" required></textarea></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" id="submit" value="전송"/></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
<script type="text/javascript">
$(".que").click(function() {
	   $(this).next(".anw").stop().slideToggle(300);
	  $(this).toggleClass('on').siblings().removeClass('on');
	  $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
	});
</script>
</html>