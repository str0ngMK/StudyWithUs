<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>회원가입 양식</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
</head>

<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">

				<h1>회원가입 양식</h1>

				<form class="validation-form" action="/user/joinform" method="post"
					novalidate>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="user_name">이름</label> <input type="text"
								class="form-control" id="user_name" name="user_name" placeholder="" value="" 
								autocomplete="off" required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>

							<label for="name">아이디</label> <input type="text"
								class="form-control" id="id" name="id" placeholder="" value="" required>
							<div class="invalid-feedback">아이디를 입력해주세요.</div>

							<label for="name">비밀번호</label> <input type="text"
								class="form-control" id="user_pwd" name="user_pwd" placeholder="" value=""
								required>
							<div class="invalid-feedback">비밀번호를 입력해주세요.</div>

							<label for="nickname">닉네임</label> <input type="text"
								class="form-control" id="nickname" name="nickname" placeholder="" value=""
								required>
							<div class="invalid-feedback">별명을 입력해주세요.</div>

							<label for="name">휴대폰번호</label>
							<!--자동완성-->
							<input type="text" class="form-control" id="contact" name="contact"
								placeholder="" value="" required>
							<div class="invalid-feedback">휴대폰를 입력해주세요.</div>

						</div>

					</div>

					<div class="mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control" id="email" name="email" placeholder="you@example.com"
							required>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>

					<!--  <div class="info" id="birth_date">
            <label for="birth">생년월일</label><br>
            <select class="box" id="birth-year">
              <option disabled selected>출생 연도</option>
            </select>
            <select class="box" id="birth-month">
              <option disabled selected>월</option>
            </select>
            <select class="box" id="birth-day">
              <option disabled selected>일</option>
            </select>
          </div> -->

					<div class="info" id="birth_date">
						<label for="birth">생년월일</label><br> <input
							class="form-control" type="text" id="birth_date"
							name="birth_date" />
					</div>
					
					<div id="print-date"></div>


					<div class="mb-3">
						<label for="gender">성별</label><br> <input type="radio"
							name="gender" value=1 /> 여성 <input type="radio" name="gender"
							value=2 /> 남성
						<div class="invalid-feedback">성별을 선택해주세요</div>
					</div>

					<div class="mb-3">
						<label for="address">주소</label> <input type="text"
							class="form-control" id="address" name ="address" required>
						<div class="invalid-feedback">주소를 입력해주세요.</div>
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
						<br>
						<br>
						<button type="submit">가입 완료</button>
					</div>
				</form>

			</div>
		</div>
	</div>
	<script>
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
          MonthOption.setAttribute('value', i)
          MonthOption.innerText = i
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
          DayOption.setAttribute('value', i)
          DayOption.innerText = i
          this.appendChild(DayOption);
        }
      }
    });

    // birthYearEl focus 이벤트 리스너 함수 내부에 추가
    YearOption.setAttribute('value', i)

    // select된 option 확인
    const selectedYearEl = document.querySelector('#print-date')
    birthYearEl.addEventListener('change', (event) => {
      selectedYearEl.textContent = 'Year of birth : ${event.target.value}'
    });
  </script>
</body>

</html>