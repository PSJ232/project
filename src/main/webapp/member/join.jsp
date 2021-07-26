<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkId(id) {
		
		var regex = new RegExp(/\S{2,}(@)\S{2,}(.)\S{2,}/); // 2자이상@2자이상.2자이상 조합이어야 이메일 형식으로 인정
		var element = document.getElementById('checkIdResult');
		if (document.joinForm.m_id.value == ""){
			element.innerHTML = '- 이메일 (아이디)를 입력해 주세요.<br>';
			return;
		}
		
		if (regex.exec(id)) {
			element.innerHTML = '- 사용 가능한 이메일입니다.(DB쪽체크는 아직 미구현)<br>';
			checkIdResult = true;
		} else {
			element.innerHTML = '- 이메일 형식으로 입력해주세요.<br>';
			checkIdResult = false;
		}
		
	}

</script>
</head>
<body>
<h1>회원가입</h1>
<hr>
<form action="MemberJoinPro.me" name="joinForm" method="post">
이메일(아이디) <input type="text" name="m_id" placeholder="예)kukka@kukk.kr" required><input type="button" value="중복확인" onclick="checkId(m_id.value)"><br>
<span id="checkIdResult"></span>
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
<input type="checkbox">모두 동의합니다.<br>
<input type="checkbox" required>이용약관 동의 (필수)<br>
<input type="checkbox" required>개인정보 수집, 이용동의 (필수)<br>
<input type="checkbox" required>개인정보 이용 동의 (필수)<br>
<input type="checkbox" name="m_agree">이벤트, 혜택정보 수신 동의 (선택)<br>
이용약관 보기 · 개인정보 처리방침 보기<br>
<input type="submit" value="회원가입">
</form>
</body>
</html>