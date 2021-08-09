<%@page import="java.text.DecimalFormat"%>
<%@page import="vo.ItemBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<ItemBean> mainSubscribeList = (ArrayList<ItemBean>)request.getAttribute("mainSubscribeList");
ArrayList<ItemBean> mainFlowerList = (ArrayList<ItemBean>)request.getAttribute("mainflowerList");
ArrayList<ItemBean> mainQuickList = (ArrayList<ItemBean>)request.getAttribute("mainQuickList");
DecimalFormat dc = new DecimalFormat("###,###,###,###");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사계 | 언제나 꽃과함께, NO.1 플라워브랜드</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/main.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">


<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="javascript/main.js"></script>

<%
String m_id = (String)session.getAttribute("m_id");
String cookie_check = request.getHeader("Cookie");
if(cookie_check != null){
	if(m_id == null){
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("m_id")) {
				m_id = cookie.getValue();
				session.setAttribute("m_id", m_id);
			}
		}
	}
}
%>
<style type="text/css">
.bx-wrapper {
  -moz-box-shadow: none;
  -webkit-box-shadow: none;
  box-shadow: none;
  border: 0;
}
</style>
</head>
<body>
  	<jsp:include page="inc/header.jsp" ></jsp:include>
	<ul class="bxSlider">
		<li><a href="#"><img src="./img/main/main_banner_1.jpg"></a></li>	
		<li><a href="#"><img src="./img/main/main_banner_2.png"></a></li>	
		<li><a href="#"><img src="./img/main/main_banner_3.png"></a></li>	
		<li><a href="#"><img src="./img/main/main_banner_4.png"></a></li>	
		<li><a href="#"><img src="./img/main/main_banner_5.png"></a></li>	
		<li><a href="#"><img src="./img/main/main_banner_6.png"></a></li>	
	</ul>
	<div id="main_container">
		<section class="main_subscribe_section">
			<div>
				<div class="main_subscribe_left">
					<h5 class="main_title">
						<span>2주에 한번, 나를 위한 행복</span><br>
						<span>꾸까 꽃 정기구독</span>
					</h5>					
					<p>이 계절 가장 이쁜 꽃으로 구성된 구독 꽃이예요!</p>
					<span class="main_subscribe_size_box">
						<span>
							<span class="main_size_icon">S</span>
							<span class="main_size">size</span>
						</span>
						<span>
							<span class="main_size_icon">XL</span>
							<span class="main_size">size</span>
						</span>
						<span>
							<span class="main_size_icon">M</span>
							<span class="main_size">size</span>
						</span>
						<span>
							<span class="main_size_icon">L</span>
							<span class="main_size">size</span>
						</span>												
					</span>
					<button class="main_subscribe_btn" onclick="location.href='Subscription.shop'">정기구독 더 알아보기</button>
				</div>
				<div class="main_subscribe_right">
					<div class = "wrapper main_subscribe_wrapper">
						<div class="bxSlider2">
							<%for(ItemBean ib : mainSubscribeList){%>
						 		<div class="main_slider_subbox">
						 			<a href="SubContent.shop?i_id=<%=ib.getI_id()%>"><img id="img" src="./admin_layout/upload/<%=ib.getI_img()%>"></a>
						 			<div class="main_item_info">
						 				<span class="main_item_desc"><%=ib.getI_desc()%></span>
						 				<span class="main_item_name"><%=ib.getI_name()%></span>
						 				<span class="main_item_pricebox">
						 					<span>1회 기준</span>
						 					<span><%=dc.format((int)ib.getI_price())%>원~</span>
						 				</span>
						 			</div>
						 		</div>
						 	<%}%>
						 </div>
					 </div>
				</div>
			</div>
		</section>
	</div>
	<div id="main_display_layout">
		<div id="main_container2" class="gray_background">
			<section class="main_section">
				<div>
					<h5 class="main_title">
						<span>꽃이 필요한 순간,</span>
						<span>꾸까 꽃다발</span>
					</h5>
					<a class="main_more">더보기</a>
				</div>
				<div class="main_flower_content">
					<div class = "wrapper main_flower_wrapper">
						<div class="bxSlider3">
							<%for(int i=0; i < 6;i++) {
								ItemBean ib = mainFlowerList.get(i);%>
					 		<div class="main_slider_subbox">
					 			<a href="FlowersContent.shop?i_id=<%=ib.getI_id()%>"><img id="img" src="./admin_layout/upload/<%=ib.getI_img()%>"></a>
					 			<div class="main_item_info">
					 				<span class="main_item_desc"><%=ib.getI_desc()%></span>
					 				<a class="main_item_name" href="#"><%=ib.getI_name()%></a><br>
					 				<span class="main_item_pricebox2">
					 					<%if(ib.getI_discount()!=1){%>
						 					<span class="main_dc_percent"><%=dc.format((int)((1-ib.getI_discount())*100))%>%</span>
						 					<del class="main_price"><%=dc.format((int)(ib.getI_price()))%>원-></del>
					 					<%}%>
					 					<span class="main_dc_price"><%=dc.format((int)(ib.getI_price()*ib.getI_discount()))%>원</span>
					 				</span><br>
					 				<span>
					 					<span class="main_size_icon"><%=ib.getI_size()%></span>
					 					<span class="main_size">size</span>
					 					<span class="main_free_icon">무료배송</span>
					 				</span>
					 			</div>
					 		</div>
					 		<%}%>
						 </div>
					 </div>
				</div>
			</section>
		</div>
		<div id="main_container2">
			<section class="main_section">
				<div>
					<h5 class="main_title">
						<span>오늘 바로 받는,</span>
						<span>당일 배송</span>
					</h5>
					<a class="main_more">더보기</a>
				</div>
				<div class="main_flower_content">
					<div class = "wrapper main_flower_wrapper">
						<div class="bxSlider3">
							<%for(int i=0; i < 6;i++) {
								ItemBean ib = mainQuickList.get(i);%>
						 		<div class="main_slider_subbox">
						 			<a href="QuickContent.shop?i_id=<%=ib.getI_id()%>"><img id="img" src="./admin_layout/upload/<%=ib.getI_img()%>"></a>
						 			<div class="main_item_info">
						 				<span class="main_item_desc"><%=ib.getI_desc()%></span>
						 				<a class="main_item_name" href="#"><%=ib.getI_name()%></a><br>
						 				<span class="main_item_pricebox2">
						 				<%if(ib.getI_discount()!=1){%>
						 						<span class="main_dc_percent"><%=dc.format((int)((1-ib.getI_discount())*100))%>%</span>
						 						<del class="main_price"><%=dc.format((int)(ib.getI_price()))%>원-></del>
						 				<%}%>
						 					<span class="main_dc_price"><%=dc.format((int)(ib.getI_price()*ib.getI_discount()))%>원</span>
						 				</span><br>
						 				<span>
						 					<span class="main_size_icon"><%=ib.getI_size()%></span>
						 					<span class="main_size">size</span>
						 					<span class="main_free_icon">무료배송</span>
						 				</span>
						 			</div>
						 		</div>
					 		<%}%>
						 </div>
					 </div>
				</div>
			</section>
		</div>
		<div class="main_subbanner">
			<div>
				<img alt="" src="./img/main_sub_banner.png">
			</div>
		</div>
		<div id="main_container2">
			<section class="main_section">
				<div class="main_class_title_box">
					<h5 class="main_title">
						<span>꽃과 함께 하는 일상,</span>
						<span> 플라워클래스</span>
					</h5>
					<a class="main_more">더보기</a>
				</div>
				<div class="main_class_content">
					<div class="main_class_left">
						<img class="main_Class_mainImg" alt="" src="img/main_class.png">
						<div>
							<span>2021년에도 꾸까 클래스와 함께</span><br>
							<strong>8월 플라워 클래스</strong>
						</div>
					</div>
					<div class="main_class_right">
						<div class="main_class_top">
							<div class="main_class_submig"><img alt="" src="img/franch_class.jpg"></div>
							<div class="main_class_subInfo">
								<p class="main_item_name">프랑스 명화 플라워 클래스</p>
								<p class="main_dc_price">59,900원</p>
								<span>
									<a class="main_place_btn seo_btn">서면점</a>
									<a class="main_place_btn nam_btn">남포점</a>
									<a class="main_place_btn hae_btn">해운대점</a>
								</span>
							</div>
						</div>	
						<hr>
						<div class="main_class_bottom">
							<div class="main_class_submig"><img alt="" src="img/class6.jpg"></div>
							<div class="main_class_subInfo">
								<p class="main_item_name">베이직 코스(8주 과정)</p>
								<p class="main_dc_price">74,900원</p>
								<span>
									<a class="main_place_btn nam_btn">남포점</a>
									<a class="main_place_btn hae_btn">해운대점</a>
								</span>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="inc/footer.jsp"></jsp:include>
	<!-- footer -->
</body>
</html>












