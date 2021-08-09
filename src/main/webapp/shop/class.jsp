<%@page import="java.text.NumberFormat"%>
<%@page import="vo.ClassBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<ClassBean> classList = (ArrayList<ClassBean>) request.getAttribute("classList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사계 | 언제나 꽃과함께, NO.1 플라워브랜드</title>
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
			<div class="shop_class_title">
				One-day Class<br>
				<strong>원데이 클래스</strong>
			</div>
			<div id="shop_container">
				<table class="quick_list_layout">
					<%
					for (int i = 0; i < classList.size(); i++) {
						if(i != 0 && !classList.get(i).getClass_subject().equals(classList.get(i-1).getClass_subject()) || i == 0){
						%> 
						
						<tbody class="class_item_box">
							<tr>
								<td>
									<a href="ClassReserv.od?f_id=<%=classList.get(i).getClass_id()%>">
										<img src="./admin_layout/upload/<%=classList.get(i).getF_thumbnail_img()%>" class="quick_item_img">
									</a>
								</td>
							</tr>
							<tr class="quick_item_name">
								<td>
									<a href="ClassReserv.od?f_id=<%=classList.get(i).getClass_id()%>"><%=classList.get(i).getClass_subject()%></a>
								</td>
							</tr>
							<tr class="quick_item_price">
								<td>
									<span><%=NumberFormat.getInstance().format(classList.get(i).getClass_price())%>원</span>
								</td>
							</tr>
							<tr class="quick_item_size">
								<td>
								<%for(int j = 0; j < classList.size(); j++){ 
									if(classList.get(i).getClass_subject().equals(classList.get(j).getClass_subject()) && classList.get(i).getClass_date().equals(classList.get(j).getClass_date()) ){
								%>
									<span class="quick_item_size_icon"><%=classList.get(j).getClass_place()%></span>
								<%}
								} %>
								</td>
							</tr>
						</tbody>
						<%
						}else continue;
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