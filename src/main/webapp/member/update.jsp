<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@page import="vo.AnniversaryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.JdbcUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="vo.MemberBean"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
<link href="css/mypage.css" rel="stylesheet"> 
<link rel="stylesheet" href="css/update.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
</head>
<%
	MemberBean memberMypageDetail = (MemberBean) request.getAttribute("memberMypageDetail");
	ArrayList<AnniversaryBean> annList = (ArrayList<AnniversaryBean>) request.getAttribute("annList");
	
	String date[] = memberMypageDetail.getM_birth().split("-"); // 날짜 "-"을 기준으로 분리해서 배열에 저장
	String year = date[0];
	String month = date[1];
	String day = date[2];
%>
<body>
	<!-- 헤더 들어가는곳 -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- 헤더 들어가는곳 -->

	<!-- 본문 메인 상단 -->
	<jsp:include page="../inc/mypagebanner.jsp"></jsp:include>

		<!-- 본문 내용 -->
	<div class ="mypage_update_container">
		<jsp:include page="../inc/mypagemenu.jsp"></jsp:include>


		
			<div class="top_banner">
				<div class="page_title"><h2>개인정보 수정</h2></div>
			</div>
			
			<div class="update_box">
				<div class="inbox">
					<form action="MemberUpdatePro.me" id="formUpdate" method="post">
						<div class="inner">
						
							<div class="row">
								<div class="update_name">이메일(아이디)</div>
								<div class="update_input">
								 		<input type="text"  class="textBox" name="m_id" value="<%=memberMypageDetail.getM_id() %>" readonly>
								 	</div>
							 </div>
							 
							 
							<div class="row">
								<div class="update_name">신규 비밀번호</div>
								<div class="update_input">
									  		<input type="password"  class="textBox" name="m_pass" placeholder="새 비밀번호를 입력해주세요.">									  		
									  </div>
							</div>
									  
					 		<div class="row">
					 			<div class="update_name">이름</div>
					 			<div class="update_input">
					 				  		<input type="text" class="textBox"  name="m_name" value="<%=memberMypageDetail.getM_name() %>" required>
					 			</div>
					 		</div>	
					 			  						   
							<div class="row">
								<div class="update_name">휴대폰 본인인증</div>
								<div class="update_input">
								   	   <input type="text"  class="textBox" name="m_phone" value="<%=memberMypageDetail.getM_phone() %>" required>
								   	 </div>
								</div>
									<!-- 뷰페이지 참고 : 휴대폰번호 수정하면 본인인증 창이 나타남 -->
							<div class="row">
								<div class="update_name">생년월일</div>
								<div class="update_input">
								   	<input type="text" class="textbox_long" name="year" value="<%=year %>" required>
								   	<input type="text" class="textbox_short" name="month" value="<%=month %>" required>
								   	<input type="text" class="textbox_short"  name="day" value="<%=day %>" required>						
								</div>
							</div>							
							
							<div class="row">
								<div class="update_name">성별</div>
								<div class="update_input">
									<input type="radio" name="m_gender" value="0" <%if(memberMypageDetail.getM_gender()==0){%>checked<%}%>>남
									<input type="radio" name="m_gender" value="1" <%if(memberMypageDetail.getM_gender()==1){%>checked<%}%>>여								
								</div>
					  		</div>
					  		
					  	</div> <!-- inner닫 -->
					  	
					  	
						<div class="anniversary_desc">
							<span class="textSubject">기념일 관리</span> 
							<span class="textNormal">  기념일을 등록하시면</span>
							<span class="textGreen">5일전에</span> 
							<span class="textNormal">kukka가 메일로 알려드릴게요!</span><br>						
						</div>	
						
							<div class="anniversary">
										<span class="textBlack">기념일을 등록해주세요.</span><br>
										<span class="textNormal">kukka 회원들은 평균 7.5개의 기념일을 등록하여 꽃을 즐기고있어요!</span>
									<table id="annInsert">
										<%
										for (AnniversaryBean ab : annList) { // 반복문으로 기념일 정보를 하나씩 꺼내어 판별
							
											String repeat = "없음"; // 반복패턴 판별하여 저장할 변수, 기본값 : 없음
											switch (ab.getA_repeat()) {
											case 1:
												repeat = "매년";
												break;
											case 100:
												repeat = "100일마다";
											}
							
											Calendar now = Calendar.getInstance();
											Calendar annDay = Calendar.getInstance();
											annDay.setTime(Date.valueOf(ab.getA_date()));
							
											long dDay = (long) Math.floor(((now.getTimeInMillis() - annDay.getTimeInMillis()) / 24.0 / 60 / 60 / 1000)); // 디데이 기본값 정보 저장
							
											if (ab.getA_repeat() == 1) { // 매년 반복(1)이면 그 다음해를 새 기념일로 해서 계산
												if (now.getTimeInMillis() > annDay.getTimeInMillis()) { // 기념일이 지났는지 판별
													int yearPlus = now.get(Calendar.YEAR) - annDay.get(Calendar.YEAR); // 해가 다르면 차이만큼 더해서 똑같은 연도로 맞춰서 계산한다
													if (now.get(Calendar.MONTH) > annDay.get(Calendar.MONTH)) { // 월이 지났으면 한해를 더해서 계산한다
														yearPlus += 1;
													} else if (now.get(Calendar.MONTH) == annDay.get(Calendar.MONTH) && now.get(Calendar.DATE) >= annDay.get(Calendar.DATE)) {
														// 월이 같지만 일이 같거나 크면 한해를 더해서 계산한다
														yearPlus += 1;
													}
													annDay.set(Calendar.YEAR, (annDay.get(Calendar.YEAR) + yearPlus)); // 계산 후 annDay의 연도부분을 setYear해서 엎어써준다
													dDay = (long) Math.floor(((now.getTimeInMillis() - annDay.getTimeInMillis()) / 24.0 / 60 / 60 / 1000));
												} else {
													// 기념일이 지나지 않았으면 기본값 그대로 사용
												}
											} else if (ab.getA_repeat() == 100) { // 100일마다(100) 반복이면
												if (now.getTimeInMillis() < annDay.getTimeInMillis()) {
													// 기념일이 지나지 않았으면 기본값 그대로 사용
												} else { //기념일이 지났다면, 다음 repeat값을 dDay로 설정
													dDay = (((long) Math.floor((now.getTimeInMillis() - annDay.getTimeInMillis()) / 24.0 / 60 / 60 / 1000)) % 100) - 100;
												}
											} else {
												// 반복없음(0)이면 기본값 그대로 사용
											}
										%>
										<tr>
											<td class="d_day_cell">D<%=dDay%></td>
											<td class="date_cell"><%=ab.getA_date()%></td>
											<td class="ann_name_cell"><%=ab.getA_name()%></td>
											<td class="repeat_cell"><%=repeat%></td>
											<td class="update_cell"><a href="MemberAnnUpdateForm.me?a_id=<%=ab.getA_id()%>" onclick="window.open(this.href, 'anniversary', 'width=450, height=500'); return false;">수정</a></td>
											<td class="delete_cell"><a href="MemberAnnDeletePro.me?a_id=<%=ab.getA_id()%>">삭제</a></td>
										</tr>
										<%
										}
										%>
									</table>
									<input type="button" class="btn" value="기념일 등록하기" onclick="window.open('MemberAnnForm.me', 'anniversary', 'width=450, height=500')">
							</div>		
							<input type="hidden" name="m_pass_origin" value="<%=memberMypageDetail.getM_pass() %>">
							<input type="checkbox" name="m_agree" <%if(memberMypageDetail.getM_agree()!=null){%>checked<%}%> >꾸까가 알려주는 꽃에 대한 정보와 다양한 소식을 받아보세요. <br>
							<input type="submit" class="yellowBtn" value="수정하기"> <br>
						</form>
						
						
						
						<div class="member_delete">
							<div class="row_del">					
								<input type="button" class="btnDel" value="회원 탈퇴" onclick="location.href='MemberDelete.me'">
							</div>
						</div>
						
					</div> <!-- anniversary 닫 -->			
				
			 	</div> <!-- inbox 닫 -->
			 	
			</div><!-- update_box 닫기 -->		
		
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</div><!--  container 닫기 -->
	
</body>
</html>