<%@page import="java.sql.Time"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.ClassBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ClassBean classBean = (ClassBean)request.getAttribute("classBean");
	ArrayList<Time> selectableTimeList = (ArrayList<Time>)request.getAttribute("selectableTimeList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 클래스수정</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="./css/admin.css">
<link rel="stylesheet" href="./css/admin_class_modify_form.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script>
	$(document).ready(function(){
		$('.admin_header_subtitle').text("클래스 수정");
	});
</script>
</head>
<body>
    <!-- header -->
  	<jsp:include page="/inc/adminHeader.jsp" ></jsp:include>
  	<!-- header -->
  	
    <!-- nav -->
	<jsp:include page="/inc/navigation.jsp" ></jsp:include>
	<!-- nav -->
	
		<form action="ClassModifyPro.ad?class_num=<%=classBean.getClass_id() %>" method="post" enctype="multipart/form-data" name="modify_form" id="modify_form">
			<div class="sub_container1">
				<h1 id="title">클래스 수정</h1>
				<label>클래스 명</label> <input type="text" name="class_subject" value="<%=classBean.getClass_subject()%>" required><br>
				<label>클래스 요약설명</label> <input type="text" name="class_sub_desc" value="<%=classBean.getClass_sub_desc()%>" required><br>
				<label>날짜</label> <input type="text" id="date" name="date" value="<%=classBean.getClass_date()%>" readonly><br>
				<label>장소</label> <input type="text" name="place" value="<%=classBean.getClass_place() %>" readonly>
				<label>시간추가</label>
				<select name="timeList" id="timeList" multiple="multiple">
				<%
					for(Time time: selectableTimeList){
						%><option><%=time %></option><%
					}
				%>
				</select><br>
				<br><label>비용</label> <input type="number" id="cost" name="class_cost" value="<%=classBean.getClass_price()%>" readonly><br>
				<label>정원</label> <input type="text" name="max_member" value="<%=classBean.getClass_max_member()%>" required><br>
			</div>
			<div class="sub_container2">
				<label>썸네일 이미지</label> <input type="file" name="class_thumbnail_img"><br>
				<label>메인 이미지</label> <input type="file" name="class_main_img" ><br>
				<label>서브 이미지1</label> <input type="file" name="class_sub_img1" ><br>
				<label>서브 이미지2</label> <input type="file" name="class_sub_img2" ><br>
				<label>서브 이미지3</label> <input type="file" name="class_sub_img3" ><br>
				<label>설명 이미지</label> <input type="file" name="class_desc_img"><br>
				<input type="hidden" name="ori_main_img" value="<%=classBean.getClass_main_img()%>">
				<input type="hidden" name="ori_sub_img1" value="<%=classBean.getClass_sub_img1()%>">
				<input type="hidden" name="ori_sub_img2" value="<%=classBean.getClass_sub_img2()%>">
				<input type="hidden" name="ori_sub_img3" value="<%=classBean.getClass_sub_img3()%>">
				<input type="hidden" name="ori_desc_img" value="<%=classBean.getF_desc_img()%>">
				<input type="hidden" name="ori_thumbnail_img" value="<%=classBean.getF_thumbnail_img()%>">
				<fieldset><legend>클래스 설명</legend><textarea name="class_desc" rows="20" cols="65"><%=classBean.getClass_desc() %></textarea></fieldset><br>
				<input type="submit" value="수정">
			</div>
		</form>
	<footer>
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</footer>
</body>

</html>