<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="./css/join.css" type="text/css" />
<link rel="stylesheet" href="./css/style.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

		function checkId(id) {
			
			var regex = new RegExp(/\S{2,}(@)\S{2,}(.)\S{2,}/); // 2자이상@2자이상.2자이상 조합이어야 이메일 형식으로 인정
			var element = document.getElementById('checkIdResult');
			if (document.formJoin.m_id.value == ""){
				element.innerHTML = '- 이메일 (아이디)를 입력해 주세요.';
				return;
			}
			
			if (regex.exec(id)) {
				element.innerHTML = '- 사용 가능한 이메일입니다.(DB쪽체크는 아직 미구현)';
				checkIdResult = true;
			} else {
				element.innerHTML = '- 이메일 형식으로 입력해주세요.';
				checkIdResult = false;
			}
			
		}
		
		function checkPhone(phone) {
			
			var regex = new RegExp(/\d{3}\d{3,4}\d{4}/);
			var element = document.getElementById('checkPhoneResult');
			if(document.formJoin.m_phone.value=="") {
				element.innerHTML = "- 전화번호를 입력해주세요."
				return;
			}
		      
		      if(regex.exec(phone)) {
		         element.innerHTML = '- 인증번호를 발송했습니다.(미구현)';
		         checkPhoneResult = true;
		      } else {
		         element.innerHTML = '- 형식에 맞지 않는 번호입니다.';
		         checkPhoneResult = false;
		      }    

		}
		
	$(document).ready(function() {
		$('#termCAll').click(function() {
	
			   if($("input:checkbox[id='termCAll']") .prop("checked")) {
			      $("input[type=checkbox]") .prop("checked" , true);
			      $('#question_box input[type="checkbox"]') .prop("checked" , false);
			   } else {  
			      $("input[type=checkbox]") .prop("checked", false);
			   }
		});
	});
	
	$('#idCheckBtn').click(function(){
		alert("클릭");
		$.ajax('test1.jsp', {
			date:{id:$('#id').val'},
			success:function(rdata) {
				$('div').html(rdata);
			}
		})
	})
	
</script>
</head>
<body>
	<div class="container">
   	<!-- header -->
   	<jsp:include page="../inc/header.jsp" ></jsp:include>
 	<!-- header -->
   	

	<div class="joinForm">
		<div class="title"><h1>회원가입</h1></div>
			<hr>
			<form action="MemberJoinPro.me" name=formJoin method="post">				
					<div class="topForm">
							 <div class="row"><label class="leftLabel">이메일(아이디)</label> 
							 								<input type="email" name="m_id" class="textBox" placeholder="예)kukka@kukk.kr" required>
										 				    <input type="button" id="idCheckBtn" class="btn" onclick="checkId(m_id.value)" value="중복확인"><br>
										 					<span id="checkIdResult" class="checkMessage">&nbsp;</span><br></div><!-- 아이디 유효성 검사 -->
							 <div class="row"><label class="leftLabel">비밀번호</label>
							 								<input type="password" name="m_pass" class="textBox2" placeholder="비밀번호를 입력해주세요." required><br></div>
							 <div class="row"><label class="leftLabel">비밀번호확인</label>
							 								<input type="password" class="textBox2" placeholder="비밀번호를 한 번 더 입력해주세요." required><br></div>
							<div class="row"><label class="leftLabel">이름</label>
															<input type="text" name="m_name" class="textBox2" placeholder="이름을 입력해주세요." required><br></div>
							 <div class="row"><label class="leftLabel">휴대폰 본인인증</label>
							 								<input type="tel" name="m_phone" class="textBox" placeholder="' - '없이 숫자만 입력해주세요." required>
							 																				<input type="button" id="phoneCheckBtn" class="btn" onclick="checkPhone(m_phone.value)" value="인증번호 받기"><br>
							 																				<span id="checkPhoneResult" class="checkMessage">&nbsp;</span><br></div> <!-- 폰번호 유효성 검사 -->
							<div class="row"><label class="leftLabel">&nbsp;</label>
															<input type="tel" class="textBox" placeholder="인증번호를 입력해주세요.">
															<input type="button" class="btn" value="확인">
															<span id="checkIdfNumResult" class="checkMessage">&nbsp;</span><br></div><!-- 인증번호 유효성 검사 -->
							 <div class="row"><label class="leftLabel">생년월일</label>
							 								<input type="text" class="longTextBox" name="year" placeholder="년도) 1999" required>
													 		<input type="text" class="shortTextBox" name="month" placeholder="월" required>
													 		<input type="text" class="shortTextBox" name="day" placeholder="일" required><br></div>
							 <div class="row"><label class="leftLabel">성별</label>
							 								<input type="radio" name="m_gender" value="1" checked>여성
							     	  	   					<input type="radio" name="m_gender" value="0">남성<br></div>
							 <hr><br><br>		 
							 <div class="row"><label class="leftLabel">이용약관 동의</label><br></div>
					</div>
					<div class="bottomForm">
							<div class="bottomContent"><input type="checkbox" name="termChkAll" id="termCAll">모두 동의합니다.<br>
									<hr width=90% size="1px" color="#eaeaea">
									<input type="checkbox" name="termChk1" id="termC1" required>이용약관 동의 <span class="textRed">(필수)</span><br>
									<input type="checkbox" name="termChk2"  id="termC2" required>개인정보 수집, 이용동의 <span class="textRed">(필수)</span><br>
									<input type="checkbox" name="termChk3"  id="termC3" required>개인정보 이용 동의 <span class="textRed">(필수)</span><br>
									<input type="checkbox" name="termChk4"  id="termC4" >이벤트, 혜택정보 수신 동의 (선택)<br><!-- 원래 name이 m_agree였음 -->
							</div>
					</div><br>
				<div class="bottomText">이용약관 보기 · 개인정보 처리방침 보기</div><br>
					<input type="submit" class="btns" value="회원가입">
													
			</form>
	</div>
	
	<jsp:include page="../inc/footer.jsp" ></jsp:include>
	</div>
	
	
</body>
</html>