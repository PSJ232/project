<%@page import="vo.ClassBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<ClassBean> classReservList = (ArrayList<ClassBean>) request.getAttribute("classList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/quick.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

</head>
	<body>	
		<!-- header -->
	  	<jsp:include page="../inc/header.jsp" ></jsp:include>
	  	<!-- header -->

		<div id="quick_banner_container">
			<div class="classList_banner_img">
				<div>
					<div class="quick_banner_textbox">
						<span>사계 플라워클래스</span>
						<div>
							<span>일주일에 한 번, 꽃이 주는 행복을 느껴보세요.</span>
							<span>[클래스 진행 지점]서면점, 해운대점, 남포점</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="container">
			<div>
				One-day Class<br>
				<strong>원데이 클래스</strong>
			</div>
			<div id="shop_container">
				<table class="quick_list_layout">
					<%
					for (ClassBean classList : classReservList) {
						%> 
						<tbody class="class_item_box">
							<tr>
								<td>
									<a href="ClassReserv.od?f_id=<%=classList.getClass_id()%>">
										<img src="img_upload/<%=classList.getClass_main_img()%>" class="quick_item_img">
									</a>
								</td>
							</tr>
							<tr class="quick_item_name">
								<td>
									<a href="ClassReserv.od?f_id=<%=classList.getClass_id()%>"><%=classList.getClass_subject()%></a>
								</td>
							</tr>
							<tr class="quick_item_price">
								<td>
									<span><%=classList.getClass_price()%>원</span>
								</td>
							</tr>
							<tr class="quick_item_size">
								<td>
									<span class="quick_item_size_icon"><%=classList.getClass_place()%></span>
								</td>
							</tr>
						</tbody>
						<%
					}
					%>
				</table>
			</div>
		</div>
		<!-- footer -->
		<jsp:include page="../inc/footer.jsp"></jsp:include>
		<!-- footer -->
	</body>
</html>