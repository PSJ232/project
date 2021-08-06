<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="css/join.css" type="text/css" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
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
// 		         element.innerHTML = '- 인증번호를 발송했습니다.(미구현)';
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
		
		$('#idCheckBtn').click(function(){
			$.ajax({
				url : 'IdCheck.me',
				type : "post",
				datatype : "text",
				data:{m_id:$('#m_id').val()},
				success:function(rdata) {
					$('#checkIdResult').html(rdata);
				}
			});
		});
		
	});
</script>
</head>
<body>
	<div class="container">
   	<!-- header -->
   	<jsp:include page="../inc/header.jsp" ></jsp:include>
 	<!-- header -->
   	<div class="top_banner">
		<div class="page_title"><h2>회원가입</h2></div>
	</div>
	
	<div class="join_us_box">	
		<form action="MemberJoinPro.me" name=formJoin method="post">				
				<div class="inbox">
					<div class="inner">
						
							 <div class="row">
							 	<div class="join_name">이메일(아이디)</div>
							 	<div class="join_input">
							 		<input type="email" name="m_id" id="m_id" class="textBox" placeholder="예)four@season.kr" required>
									<input type="button" id="idCheckBtn" class="btn" onclick="checkId(m_id.value)" value="중복확인"><br>
									<span id="checkIdResult" class="checkMessage">&nbsp;</span><br><!-- 아이디 유효성 검사 -->
								</div>
							</div>
								
							 <div class="row">
							 	<div class="join_name">비밀번호</div>
							 	<div class="join_input">
							 		<input type="password" name="m_pass" class="textBox" placeholder="비밀번호를 입력해주세요." required><br>
							 	</div>
							</div>
							
							 <div class="row">
							 	<div class="join_name">비밀번호확인</div>
							 	<div class="join_input">
							 		<input type="password" class="textBox" placeholder="비밀번호를 한 번 더 입력해주세요." required><br>
							 	</div>
							 </div>
							 
							<div class="row">
								<div class="join_name">이름</div>
								<div class="join_input">
								 <input type="text" name="m_name" class="textBox" placeholder="이름을 입력해주세요." required><br>
								 </div>
							</div>
							
							 <div class="row">
							 	<div class="join_name">휴대폰 본인인증</div>
							 	<div class="join_input"><input type="tel" name="m_phone" class="textBox" placeholder="' - '없이 숫자만 입력해주세요." required>
																		   <input type="button" id="phoneCheckBtn" class="btn" onclick="checkPhone(m_phone.value)" value="인증번호 받기"><br>
							 											   <span id="checkPhoneResult" class="checkMessage">&nbsp;</span><br>
	 							</div> <!-- 폰번호 유효성 검사 -->
	 						</div>
	 							
							<div class="row">
								<div class="join_name">&nbsp;</div>
								<div class="join_input"><input type="tel" class="textBox" placeholder="인증번호를 입력해주세요.">
								  										   <input type="button" class="btn" value="확인">
																		   <span id="checkIdfNumResult" class="checkMessage">&nbsp;</span><br>
								</div><!-- 인증번호 유효성 검사 -->
							</div>
								
							 <div class="row">
							 	<div class="join_name">생년월일</div>
							 	<div class="join_input"><input type="text" class="textbox_long" name="year" placeholder="년도) 1999" required>
													 					   <input type="text" class="textbox_short" name="month" placeholder="월" required>
													 					   <input type="text" class="textbox_short" name="day" placeholder="일" required><br>
								</div>
							</div>
							
							 <div class="row">
							 	<div class="join_name">성별</div>
							 	<div class="join_input"><input type="radio" class="radio_gender" name="m_gender" value="1" checked><span class="gender_txt">여성</span>
							 		  	     	  	   					   <input type="radio" class="radio_gender" name="m_gender" value="0"><span class="gender_txt">남성</span>
								</div>
							</div>
								
							 
						</div> <!-- inner -->
					</div><!-- inbox -->
							
					
					<div class="bottomForm">
						<div class="inner">
							 <div class="row">
							 	<div class="join_name">이용약관 동의</div>
							 	<div class="join_input"></div>
							 </div>
							 <br><br>

								<ul class="agreement_list">
										<li class="agree_all"><input type="checkbox" id="termCAll">모두 동의합니다.<br></li>
										<li class="agree_part"><input type="checkbox"  id="termC1" required>이용약관 동의 <span class="textRed">(필수)</span></li>
										<li class="agree_part"><input type="checkbox"  id="termC2" required>개인정보 수집, 이용동의 <span class="textRed">(필수)</span></li>
										<li class="agree_part"><input type="checkbox"  id="termC3" required>개인정보 이용 동의 <span class="textRed">(필수)</span></li>
										<li class="agree_part"><input type="checkbox" name="m_agree"  id="termC4" >이벤트, 혜택정보 수신 동의 (선택)</li><!-- 원래 name이 m_agree였음 -->
								</ul>
								
							<div class="agree_terms">이용약관 보기 · 개인정보 처리방침 보기</div>
								
							<div class="inner">
								<div class="row">
									<input type="submit" class="btn_submit" value="회원가입">
								</div>
							</div>
						</div><!-- inner -->

														
					</div><!-- bottomForm -->
			</form>
					
			
 		</div> <!-- join_us_box 닫기 -->		

	
	<jsp:include page="../inc/footer.jsp" ></jsp:include>
  </div> <!-- container 닫기 -->
	
	
</body>
</html>