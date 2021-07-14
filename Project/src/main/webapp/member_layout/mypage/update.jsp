<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>
</head>
<body>
<h1>개인정보 수정</h1>
<hr>
<ul>
<li><label>이메일(아이디)</label><input type="text"></li>
<li><label>신규 비밀번호</label><input type="password" value="새 비밀번호를 입력해주세요."></li>
<li><label>이름</label><input type="text"></li>
<li><label>휴대폰 본인인증</label><input type="text"><input type="text"><input type="text"></li>
<li><label>생년월일</label><input type="text"><input type="text"><input type="text"></li>
<li><label>성별</label><input type="radio" name="gender" value="남">남
					  <input type="radio" name="gender" value="여">여</li>
</ul>
<hr>
<h3>기념일 관리</h3>
기념일을 등록하시면 5일전에 kukka가 문자로 알려드릴게요! <br>
<table border="1">
<tr><td>D-348</td><td>2021-06-21</td><td>돌</td><td>매년</td><td>수정</td><td>삭제</td></tr>
<!-- ... -->
</table>
<input type="button" value="기념일 등록하기">
<hr>
</body>
<input type="checkbox" name="marketing" value="marketing">꾸까가 알려주는 꽃에 대한 정보와 다양한 소식을 받아보세요. <br>
<input type="button" value="수정하기"> <br>
<input type="button" value="회원 탈퇴" onclick="href='/MemberDelete.me'">

</html>