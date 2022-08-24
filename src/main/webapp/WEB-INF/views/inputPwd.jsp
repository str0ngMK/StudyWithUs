<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	var password = window.prompt('비밀번호를 입력하세요');
	
	function pwdCheck2(){	
		$.ajax({
			url: '/moveChating.do',
			data: data,
			type: 'post',
			success: function () {
				console.log($("#roomData"));
			},
			error : function(err){
				console.log('error');
				calbak(err);
			}
		});
	}
	
</script>