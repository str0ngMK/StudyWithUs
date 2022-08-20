<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <title>비밀번호 찾기</title>
  <link rel="stylesheet" href="style.css">
  <script src="jquery-3.4.1.js"></script>
  <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>

<body>

  <div class="findPwd-form">

    <h1>비밀번호 찾기</h1>

    <form action="" method="">

      <div class="int-area3">
        <input type="text" name="id" id="id" autocomplete="off" required>
        <label for="id">아이디</label>
      </div>

      <div class="int-area3">
        <input type="text" name="name" id="name" autocomplete="off" required>
        <label for="name">이름</label>
      </div>

      <div class="int-area3">
        <input type="email" name="email" id="email" autocomplete="off" required>
        <label for="email">이메일</label>
      </div>

      <div class="btn-area3">
        <button id="btn1" type="reset">닫기</button>
        <button id="btn2" type="submit">확인</button>
      </div>

    </form>

  </div>

  <script>
    let id = $('#id');
    let name = $('#name');
    let email = $('#email');
    let btn2 = $('#btn2');

    $(btn2).on('click', function () {
      if ($(id).val() == "") {
        $(id).next('label').addClass('warning');
        setTimeout(function () {
          $('label').removeClass('warning');
        }, 1500);
      }
      else if ($(name).val() == "") {
        $(name).next('label').addClass('warning');
        setTimeout(function () {
          $('label').removeClass('warning');
        }, 1500);
      }
      else if ($(email).val() == "") {
        $(email).next('label').addClass('warning');
        setTimeout(function () {
          $('label').removeClass('warning');
        }, 1500);
      }
    });
  </script>

</body>

</html>