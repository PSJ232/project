<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입</h1>
<hr>
<form action="MemberJoinPro.me" method="post">
이메일(아이디) <input type="email" name="m_id" placeholder="예)kukka@kukk.kr" required><input type="button" value="중복확인"><br>
비밀번호 <input type="password" name="m_pass" placeholder="비밀번호를 입력해주세요." required><br>
비밀번호확인 <input type="password" placeholder="비밀번호를 한 번 더 입력해주세요." required><br>
이름 <input type="text" name="m_name" placeholder="이름을 입력해주세요." required><br>
휴대폰 본인인증 <input type="tel" name="m_phone" placeholder="'-'없이 숫자만 입력해주세요." required><input type="button" value="인증번호 받기"><br>
<input type="tel" placeholder="인증번호를 입력해주세요."><input type="button" value="확인"><br>
생년월일 <input type="text" name="year" placeholder="년도)1999" required><input type="text" name="month" placeholder="월" required><input type="text" name="day" placeholder="일" required><br>
성별 <input type="radio" name="m_gender" value="1" checked>여성
<input type="radio" name="m_gender" value="0">남성<br>
<hr>
이용약관 동의<br>
<input type="checkbox" required>모두 동의합니다.<br>
<input type="checkbox" required>이용약관 동의 (필수)<br>
<input type="checkbox" required>개인정보 수집, 이용동의 (필수)<br>
<input type="checkbox" required>개인정보 이용 동의 (필수)<br>
<input type="checkbox" name="m_agree">이벤트, 혜택정보 수신 동의 (선택)<br>
이용약관 보기 · 개인정보 처리방침 보기<br>
<input type="submit" value="회원가입">
</form>
</body>
</html>