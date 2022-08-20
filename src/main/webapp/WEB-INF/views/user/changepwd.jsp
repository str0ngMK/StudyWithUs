<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <title>비밀번호 변경</title>
  <link rel="stylesheet" href="style.css">
  <script src="jquery-3.4.1.js"></script>
  <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>

<body>
  <div class="changepwd">
    <h1>비밀번호 변경</h1>
    <form action="" method="">

      <div class="int-area12">
        <input type="text" name="newpwd" id="newpwd" autocomplete="off" required>
        <label for="newpwd">새 비밀번호 (8~12자의 영문, 숫자, 특수문자 조합)
        </label>
      </div>

      <div class="int-area12">
        <input type="text" name="checkpwd" id="checkpwd" autocomplete="off" required>
        <label for="checkpwd">새 비밀번호 확인 (위의 비밀번호를 다시 입력해주세요)</label>
      </div>

      <div class="btn-area12">
        <button id="btn1" type="reset">취소</button>
        <button id="btn2" type="submit">확인</button>
      </div>
    </form>
  </div>

  <script>
    let newpwd = $('#newpwd');
    let checkpwd = $('#checkpwd');
    let btn2 = $('#btn2');

    $(btn2).on('click', function () {
      if ($(newpwd).val() == "") {
        $(newpwd).next('label').addClass('warning');
        setTimeout(function () {
          $('label').removeClass('warning');
        }, 1500);
      }
      else if ($(checkpwd).val() == "") {
        $(checkpwd).next('label').addClass('warning');
        setTimeout(function () {
          $('label').removeClass('warning');
        }, 1500);
      }
    });

  </script>
</body>

</html>