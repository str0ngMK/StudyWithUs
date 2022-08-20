<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>비밀번호 인증</title>
  <link rel="stylesheet" href="style.css">
  <script src="jquery-3.4.1.js"></script>
  <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body>

  <div class="authenticpwd" >
    
  <h1>비밀번호 인증</h1>

  <form action="" method="">

  <div class="comment">
    <label for=""><h4>비밀번호 인증이 필요합니다.</h4><br>
      회원정보 수정, 비밀번호 변경, 회원탈퇴를 하시려면 비밀번호 인증이 필요합니다.
      <br><br>
      계속하시려면 비밀번호를 입력바랍니다.
    </label>
  </div>

  <div class="int-area10">
    <input type="text" id="pwd" name="pwd" autocomplete="off" required>
    <label for="pwd">비밀번호를 입력해주세요</label>
  </div>

  <div class="btn-area10">
    <button id="btn1" type="reset">취소</button>
    <button id="btn2" type="submit">확인</button>
  </div>

</form>

</div>

<script>
  let pwd = $('#pwd');
  let btn2 = $('#btn2');

  $(btn2).on('click', function () {
    if ($(pwd).val() == "") {
      $(pwd).next('label').addClass('warning');
      setTimeout(function () {
        $('label').removeClass('warning');
      }, 1500);
    }
  });
</script>
</html>