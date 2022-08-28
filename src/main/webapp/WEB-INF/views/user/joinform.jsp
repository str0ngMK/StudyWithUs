<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입 양식</title>
<link href="../resources/css/style.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
	.container {
	  position : absolute;
	  top : 5%;
	  left : 13%;
	}
	.idbox {
		display : flex;
	}
	.idChk {
		width : 100px;
		height : 40px;
		margin-left : 10px;
		border : none;
		border-radius : 20px;
		background-color: rgb(180, 112, 203);
		color : white;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">

				<h1>회원가입 양식</h1>

				<form class="validation-form" action="/user/joinform" method="post" id="regForm" novalidate>

					<div class="row">
						<div class="col-md-6 mb-3">

							<div>
								<label for="user_name">이름</label> <input type="text"
									class="form-control" id="user_name" name="user_name"
									placeholder="" value="" autocomplete="off" required>
							</div>
							
							<label for="name">아이디<span style='color: red;'> (영대소문자 또는 숫자 4~12자리)</span></label>
							<div class="idbox">
								 <input type="text" class="form-control" id="id" name="id" placeholder="" value="" required>

							<button class="idChk" type="button" id="idChk"
								onclick="fn_idChk()" value="N">중복검사</button>
							<img id="id_check_sucess" style="display: none;">
							</div>

							<div>
								<label for="name">비밀번호</label> <input type="password"
									class="form-control" id="user_pwd" name="user_pwd"
									placeholder="" value="" required>
							</div>
							<div>
								<label for="name">비밀번호 확인</label> <input type="password"
									class="form-control" id="pwd_check" name="pwd_check"
									placeholder="" value="" required>
							</div>
							<div>
								<label for="nickname">닉네임</label> <input type="text"
									class="form-control" id="nickname" name="nickname"
									placeholder="" value="" required>
							</div>

							<div>
								<label for="name">휴대폰번호</label>
								<!--자동완성-->
								<input type="text" class="form-control" id="contact"
									name="contact" placeholder="" value="" required
									onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
							</div>

						</div>

					</div>

					<div class="mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control" id="email" name="email"
							placeholder="you@example.com" required>
					</div>

					<input class="info" type="hidden" id="birth_date" name="birth_date">
						<label for="birth">생년월일</label><br> <select class="box"
							id="birth-year">
							<option disabled selected>출생 연도</option>
						</select> 년 <select class="box" id="birth-month">
							<option disabled selected>월</option>
						</select> 월 <select class="box" id="birth-day">
							<option disabled selected>일</option>
						</select>
					
					<div class="mb-3">
						<label for="gender">성별</label> <input type="radio" name="gender"
							value=1 checked="checked" /> 여성 <input type="radio" name="gender"
							value=2 /> 남성
					</div>

					<div class="mb-3">
						<label for="address">주소</label> <input type="text"
							class="form-control" id="address" name="address" required>

					</div>

					<hr class="mb-4">

					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>

					<div class="mb-4"></div>
					<div class="btn-area">
						<button type="reset">다시작성</button>
						<br> <br>
						<button id="join_complete" onclick="return joinForm()">가입 완료</button>
					</div>
				</form>

			</div>
		</div>
	</div>

	<script>
    var isFlag = true;
	
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);

    // '출생 연도' 셀렉트 박스 option 목록 동적 생성
    const birthYearEl = document.querySelector('#birth-year')
    // option 목록 생성 여부 확인
    isYearOptionExisted = false;
    birthYearEl.addEventListener('focus', function () {
      // year 목록 생성되지 않았을 때 (최초 클릭 시)
      if (!isYearOptionExisted) {
        isYearOptionExisted = true
        for (var i = 1940; i <= 2022; i++) {
          // option element 생성
          const YearOption = document.createElement('option')
          YearOption.setAttribute('value', i)
          YearOption.innerText = i
          // birthYearEl의 자식 요소로 추가
          this.appendChild(YearOption);
        }
      }
    });
    // Month, Day도 동일한 방식으로 구현
    const birthMonthEl = document.querySelector('#birth-month')
    isMonthOptionExisted = false;
    birthMonthEl.addEventListener('focus', function () {
      if (!isMonthOptionExisted) {
        isMonthOptionExisted = true
        for (var i = 1; i <= 12; i++) {
          const MonthOption = document.createElement('option')
          
          if(i<10){
        	  MonthOption.setAttribute('value', "0" + i)
        	  MonthOption.innerText = "0" + i
          } else {
        	  MonthOption.setAttribute('value', i)
          	  MonthOption.innerText = i
          }
          
          this.appendChild(MonthOption);
        
        }
      }
    });

    const birthDayEl = document.querySelector('#birth-day')
    isDayOptionExisted = false;
    birthDayEl.addEventListener('focus', function () {
      if (!isDayOptionExisted) {
        isDayOptionExisted = true
        for (var i = 1; i <= 31; i++) {
          const DayOption = document.createElement('option')
          
          if(i<10) {
        	  DayOption.setAttribute('value', "0" + i)
          	  DayOption.innerText =  "0" + i
        	  
          } else {
        	  DayOption.setAttribute('value', i)
          	  DayOption.innerText = i
          }

          this.appendChild(DayOption);
        }
      }
    });

    // birthYearEl focus 이벤트 리스너 함수 내부에 추가
   // YearOption.setAttribute('value', i);

    // select된 option 확인
    const selectedYearEl = document.querySelector('#print-date')
    birthYearEl.addEventListener('change', (event) => {
      selectedYearEl.textContent = 'Year of birth : ${event.target.value}'
    });
    
    function fn_idChk() {
    	var isFlag = idCheck();
    	
		if(isFlag){
	    	if ($("#id").val().length > 0) {
		    	$.ajax({
		    		url : "/idChk",
		    		type : "post",
		    		dataType : "json",
		    		data : {"id" : $("#id").val()},
		    		success : function(data) {
		    			if(data ==1) {
		    				alert("중복된 아이디입니다.");
		    			}else if(data==0) {
		    				$("#idChk").attr("value", "Y");
		    				alert("사용가능한 아이디입니다.");
		    				console.log($("#id").val());
		    			}
		    		}
		    	});
	    	} else {
				alert('아이디가 비어있습니다.');    		
	    	}
		}    	
    }
    
   // 생일 형식 확인하는 코드 
  /*   function joinBirth() {
        var birth = $("#birth-year").val();
    	  var month = $("#birth-month").val();
    	  var day = $("#birth-day").val();
    	 
    	  console.log(birth);
    	  console.log(month);
    	  console.log(day);
    	  
    	 $("#birth_date").val(new Date(birth+month+day)); 
    	 
    	  
      } */
      
    function idCheck(){
  	    var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);	  
  	    	isFlag = true;

		//아이디 공백 확인
		if (id.value == "") {
		  alert("아이디 입력해주세요");
		  $("#id").focus();
		  isFlag = false;
		} else {
			//아이디 유효성검사
			if (!getCheck.test($("#id").val())) {
			  alert("형식에 맞게 아이디를 입력해주세요");
			  $("#id").val("");
			  $("#id").focus();
			  isFlag = false;
			}
		}
		
		return isFlag;
    }
   
    function joinForm() {
    	  //이름, 아이디, 비밀번호, 닉네임, 휴대폰번호, 이매일
    	  var user_name = document.getElementById("user_name");
    	  var id = document.getElementById("id");
    	  var user_pwd = document.getElementById("user_pwd");
    	  var check_pwd = document.getElementById("check_pwd");
    	  var nickname = document.getElementById("nickname");
    	  var contact = $("#contact").val();
    	  var email = document.getElementById("email");
    	  var birth = $("#birth-year").val();
    	  var month = $("#birth-month").val();
    	  var day = $("#birth-day").val();
    	  var aggrement = document.getElementById('aggrement').checked;
    	  
    	  //이메일 정규화 공식
    	  var regul2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
    	  var getCheck = RegExp(/^[a-zA-Z0-9)]{4,12}$/);

    	  //이름 공백 검사
    	  if (user_name.value == "") {
    	    alert("이름 입력해주세요");
    	    $("#user_name").focus();
    	    isFlag = false;
    	  }
    	  
    	  // 아이디 체크
    	  isFlag = idCheck();
    	  
    	  //비밀번호 공백 확인
    	  if ($("#user_pwd").val() == "") {
    	    alert("비밀번호를 입력해주세요");
    	    $("#user_pwd").focus();
    	    isFlag = false;
    	  }
    	  
    	  if ($("#id").val() == ($("#user_pwd").val())) {
    	    alert("비밀번호가 아이디와 동일합니다.");
    	    $("#user_pwd").val("");
    	    $("#user_pwd").focus();
    	  }

		  // 비밀번호 유효성 검사
    	  if (!getCheck.test($("#user_pwd").val())) {
    	    alert("형식에 맞춰 비밀번호를 입력해주세요");
    	    $("#user_pwd").val("");
    	    $("#user_pwd").focus();
    	    isFlag = false;
    	  }

    	  //비밀번호 확인란 공백 확인
    	  if ($("#pwd_check").val() == "") {
    	    alert("비밀번호 확인란을 입력해주세요");
    	    $("#pwd_check").focus();
    	    isFlag = false;
    	  }

    	  //비밀번호 서로확인
     	  if ($("#user_pwd").val() != $("#pwd_check").val()) {
     	    alert("비밀번호가 상이합니다");
     	    $("#user_pwd").val("");
     	    $("#pwd_check").val("");
     	    $("#user_pwd").focus();
     	    isFlag = false;
     	  }
    	  
    	  //닉네임 공백 확인
    	  if (nickname.value == "") {
    	    alert("닉네임 입력해주세요");
    	    $("#nickname").focus();
    	    return false;
    	  }

    	  // 전화번호 유효성 검사
    	  if (contact.length > 11 || contact.length < 11) {
			alert('전화번호 형식에 맞게 입력해주세요');
			$('#contact').val("");
			$('#contact').focus();
			isFlag = false;
    	  }

    	  //이메일 입력 안했을 경우
    	  if ((email.value) == "") {
    	    alert("이메일을 입력해주세요");
    	    email.focus();
    	    isFlag = false;
    	  }

    	  //이메일 공백 확인
    	  if ($("#email").val() == "") {
    	    alert("이메일을 입력해주세요");
    	    $("#email").focus();
    	    isFlag = false;
    	  }

    	  //이메일 유효성 검사
    	  if (!regul2.test($("#email").val())) {
    	    alert("이메일형식에 맞게 입력해주세요")
    	    $("#email").val("");
    	    $("#email").focus();
    	    isFlag = false;
    	  }
    	  
    	  // 생년월일 유효성 검사
    	  if (birth == null || month == null || day == null) {
    		  alert('생년월일을 선택해주세요');
    		  $("#birth-year").focus();
    		  isFlag = false;
    	  }
    	  
    	  // 개인정보 이용동의
    	  if (!aggrement) {
    		  alert('개인정보 이용동의해주세요');
    		  $('#aggrement').focus();
    		  isFlag = false;
    	  }
    	  
    	  $("#birth_date").val(birth+month+day);
    	  
    	  console.log(birth+month+day);
    	  
   		  var param = {"user_name": $('#user_name').val, "id": $('#id').val(), "user_pwd": $('#user_pwd').val(), "nickname": $('#nickname').val(), "contact": contact
   				  , "email": email, "birth_date": birth_date}
   		  
    	  // 회원 DB Insert
    	  /* $.ajax({
	    		type : "POST",
	    		url : "/user/joinform",
	    		data : param,
	    		dataType : "json",
	    		success : function(data) {
	    			if(data ==1) {
	    				alert("회원가입이 완료되었습니다.");
	    				window.location.href = '/login/loginForm.jsp';
	    	
	    			}else if(data==0) {
	    				alert("회원가입이 실패하였습니다.");
	    			}
	    		}
	    	});  */  
	    	
	  		//회원가입 완료
			if(isFlag){
				$("#join_complete").on("click", function() {
					var idChkVal = $("#idChk").val();
					if(idChkVal == "N"){
						alert("중복확인 버튼을 눌러주세요");
					}else{
						$("#regForm").submit();
					}
				});
			} else {
				isFlag = false;
				alert("잘못입력된 값이 있습니다.");
			}
	    	
	    	return isFlag;
		}
	
  </script>
  
</body>

</html>