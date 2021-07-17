<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
// id 앞 4자리와 도메인만 보여주기 - 보안기능
String m_id = (String) request.getAttribute("m_id"); //찾아온 아이디를 변수에 저장
String myId[] = m_id.split("@"); //@기준으로 나눠서 배열에 저장
int j = myId[0].length() - 4; // 앞부분 길이에서 4자리를 제외한 자리수 변수에 저장
String a = myId[0].substring(0, 4); // 앞부분 4자리 추출해서 변수에 저장

String b = ""; // *을 나머지 자릿수만큼 주기위해 반복문으로 반복
for (int i = 0; i < j; i++) {
	b = b + "*";
}
m_id = a + b + "@" + myId[1]; // 모두 조합해서 완성
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>아이디 찾기</h1>
	<p>입력하신 정보와 일치하는<br> 
	ID(이메일)는 다음과 같습니다.</p>
	
	<h1><%=m_id %></h1>

		<input type="button" value="로그인"><br>
		비밀번호 찾기<br>
	<hr>
	- 개인정보 보호를 위해, 아이디의 일부는 암호화 처리되어 보여집니다.<br>
	- 확인이 되지 않으시면 kukka 고객센터로 연락주세요.<br>
	(1661-1031, 평일 AM10시-PM6시 / 점심시간 PM1시-2시 제외)<br>
	로 연락주세요.
</body>
</html>