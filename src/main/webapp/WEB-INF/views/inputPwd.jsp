<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	window.onload = function(){
		pwdCheck();
	}
	
	function pwdCheck(){	
	    var password = window.prompt('비밀번호를 입력하세요');
	    
		if(password != null){
			var data = {
					    'roomNumber' : ${roomNumber},
					    'roomName'   : '${roomName}', 
					    'password'   : password
			           }
			
			$.ajax({
				url: '/pwdCheck.do',
				data: data,
				type: 'post',
				success: function (res) {
					if(res.page == 'success'){
		 				window.location.href="/moveChatSuccess.do?roomName=" + res.roomName + "&" + "roomNumber=" + res.roomNumber;
					} else {
						alert('비밀번호가 잘못입력되었습니다.');
						window.location.href="/moveChat.do?roomName=" + '${roomName}' + "&" + "roomNumber=" + ${roomNumber};
					}
				},
				error : function(err){
					console.log('error');
					calbak(err);
				}
			});
		} else window.close();
	}
	
</script>