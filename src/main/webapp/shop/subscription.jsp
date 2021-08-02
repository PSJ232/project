<%@page import="java.text.NumberFormat"%>
<%@page import="vo.ItemBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
ItemBean sizeS = null;
ItemBean sizeM = null;
ItemBean sizeL = null;
ItemBean sizeXL = null;
ArrayList<ItemBean> itemList = (ArrayList<ItemBean>) request.getAttribute("itemList");
for(ItemBean ib : itemList) {
	if(ib.getI_category() == 3){
		switch(ib.getI_size()){
		case "S" : sizeS = ib; break;
		case "M" : sizeM = ib; break;
		case "L" : sizeL = ib; break;
		case "XL" : sizeXL = ib; break;
		}
	}
}
%>
<link rel="stylesheet" href="./css/subscription.css">
<link rel="stylesheet" href="./css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
	<!-- header -->
  	<jsp:include page="../inc/header.jsp" ></jsp:include>
  	<!-- header -->
	<div class="category_content">
		<div class="category_header bg_subscription">
			<div class="inbox">
				<div class="tbl">
					<div class="td">
						<h3 class="title">꾸까 꽃 정기구독</h3>
						<p class="desc">2주에 한번, 매번 새로운 꽃으로 당신의 일상을 행복으로 채울게요</p>
					</div>				
				</div>			
			</div>
		</div>
		
		<div class="inner">
			<div class="subscription_category_tabs">
				<h4 class="tit subscribe is_active">정기구독 상품
					<button type="button" id="toggleA" class="toggle" data-tab="product">
						<span class="blind">활성화</span>
					</button>
				</h4>
				<div class="category_product_list" style="display: block;">
					<div class="inbox">
						<ul class="products">
							<li class="list">
								<div class="category_product_detail is_subscription">
									<dl class="detail">
										<dt class="thumnail">
											<a class="link" href="SubContent.shop?i_id=<%=sizeS.getI_id() %>" style="background-image: url('./img/subscription/sub_banner_s.jpg');">
												<img src="./img/subscription/subscription_list_thumnail.png" alt="가벼운 S 꽃구독">
												<span class="image" style="background-image: url('./img/subscription/sub_banner_s.jpg');"></span>								
												<span class="category_product_bdg"></span>
											</a>
										</dt>
										<dd class="summary">
											<span class="name_1"><%=sizeS.getI_desc() %></span>
											<a href="SubContent.shop?i_id=<%=sizeS.getI_id() %>" class="name_2"><%=sizeS.getI_name() %></a>
											<span class="discount">
												<span class="price"><%=NumberFormat.getInstance().format(sizeS.getI_price()) %>원~</span>
											</span>
											<span class="desc">
												<span>2주에 한번, 꽃이 일상이 되는 가벼운 시작<br></span>
												<span>작지만 그 계절 가장 예쁜 꽃으로 만들었어요.<br></span>
												<span>나에게, 사랑하는 사람에게 작은 꽃다발이 주는 행복을 전해보세요.<br></span>
											</span>
											<span class="more">
												<span class="free">무료배송</span>
											</span>
										</dd>
									</dl>
								</div>
							</li>
							<li class="list">
								<div class="category_product_detail is_subscription">
									<dl class="detail">
										<dt class="thumnail">
											<a class="link" href="SubContent.shop?i_id=<%=sizeM.getI_id() %>" style="background-image: url('./img/subscription/sub_banner_m.jpg');">
												<img src="./img/subscription/subscription_list_thumnail.png" alt="딱좋은 M 꽃구독">
												<span class="image" style="background-image: url('./img/subscription/sub_banner_m.jpg');"></span>								
												<span class="category_product_bdg"></span>
											</a>
										</dt>
										<dd class="summary">
											<span class="name_1"><%=sizeM.getI_desc() %></span>
											<a href="SubContent.shop?i_id=<%=sizeM.getI_id() %>" class="name_2"><%=sizeM.getI_name() %></a>
											<span class="discount">
												<span class="price"><%=NumberFormat.getInstance().format(sizeM.getI_price()) %>원~</span>
											</span>
											<span class="desc">
												<span>2주에 한번, 내 공간이 꽃이 되는 좋은 시작<br></span>
												<span>한 손에 가득 차는 꽃다발로 그 계절 가장 예쁜 꽃을 담았어요.<br></span>
												<span>책상 위, 침대 옆에 두고 더욱 커지는 일상의 행복을 느껴보세요.<br></span>
											</span>
											<span class="more">
												<span class="free">무료배송</span>
											</span>
										</dd>
									</dl>
								</div>
							</li>
							<li class="list">
								<div class="category_product_detail is_subscription">
									<dl class="detail">
										<dt class="thumnail">
											<a class="link" href="SubContent.shop?i_id=<%=sizeL.getI_id() %>" style="background-image: url('./img/subscription/sub_banner_l.jpg');">
												<img src="./img/subscription/subscription_list_thumnail.png" alt="풍성한 L 꽃구독">
												<span class="image" style="background-image: url('./img/subscription/sub_banner_l.jpg');"></span>								
												<span class="category_product_bdg"></span>
											</a>
										</dt>
										<dd class="summary">
											<span class="name_1"><%=sizeL.getI_desc() %></span>
											<a href="SubContent.shop?i_id=<%=sizeL.getI_id() %>" class="name_2"><%=sizeL.getI_name() %></a>
											<span class="discount">
												<span class="price"><%=NumberFormat.getInstance().format(sizeL.getI_price()) %>원~</span>
											</span>
											<span class="desc">
												<span>2주에 한번, 꽃이 일상이 되는 가벼운 시작<br></span>
												<span>작지만 그 계절 가장 예쁜 꽃으로 만들었어요.<br></span>
												<span>나에게, 사랑하는 사람에게 작은 꽃다발이 주는 행복을 전해보세요.<br></span>
											</span>
											<span class="more">
												<span class="free">무료배송</span>
											</span>
										</dd>
									</dl>
								</div>
							</li>
							<li class="list">
								<div class="category_product_detail is_subscription">
									<dl class="detail">
										<dt class="thumnail">
											<a class="link" href="SubContent.shop?i_id=<%=sizeXL.getI_id() %>" style="background-image: url('./img/subscription/sub_banner_xl.jpg');">
												<img src="./img/subscription/subscription_list_thumnail.png" alt="가득찬 XL 꽃구독">
												<span class="image" style="background-image: url('./img/subscription/sub_banner_xl.jpg');"></span>								
												<span class="category_product_bdg"></span>
											</a>
										</dt>
										<dd class="summary">
											<span class="name_1"><%=sizeXL.getI_desc() %></span>
											<a href="SubContent.shop?i_id=<%=sizeXL.getI_id() %>" class="name_2"><%=sizeXL.getI_name() %></a>
											<span class="discount">
												<span class="price"><%=NumberFormat.getInstance().format(sizeXL.getI_price()) %>원~</span>
											</span>
											<span class="desc">
												<span>2주에 한번, 꽃으로 가득차는 일상의 행복<br></span>
												<span>한 아름 안을 수 있는 꽃다발로 그 계절 가장 예쁜 꽃을 가득 담았어요.<br></span>
												<span>이 꽃다발 하나라면 모두의 행복을 가득 채울 수 있어요.<br></span>
											</span>
											<span class="more">
												<span class="free">무료배송</span>
											</span>
										</dd>
									</dl>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<h4 class="tit how_to">이용 방법
					<button type="button" id="toggleB" class="toggle" data-tab="how">
						<span class="blind">활성화</span>
					</button>
				</h4>
				<div class="subscription_how_to" style="display: none;">
					<h5 class="how_tit">꽃 정기구독, 이렇게 시작해보세요!</h5>
					<ol class="how_step">
						<li class="list">
							<span class="ico s1"></span>
							<strong class="step">01</strong>
							<span class="desc">정기구독 상품 중 <br	class="m">
							<b>원하시는 <br class="pc">꽃 사이즈
							</b>를 <br class="m">선택해주세요.</span>
						</li>
						<li class="list">
							<span class="ico s2"></span>
							<strong class="step">02</strong>
							<span class="desc">꽃을 <b>구독하고 싶은 <br class="m">
							<br class="pc">총 기간</b>을 선택해주세요.</span>
						</li>
						<li class="list">
							<span class="ico s3"></span>
							<strong class="step">03</strong>
							<span class="desc">꽃을 <b>받고 싶은 요일</b>을 <br class="m">
							<br class="pc">선택해주세요.</span>
						</li>
						<li class="list">
							<span class="ico s4"></span>
							<strong class="step">04</strong>
							<span class="desc"><b>2주에 한번 그 계절 가장 <br class="m">
							<br class="pc">이쁜 꽃</b>으로 찾아갈게요.</span>
						</li>
					</ol>
					<p class="how_tip">
						<span class="line">혹시, 일정을 변경하고 싶으신가요? 마이페이지 혹은 고객센터를 통해 미리 일정을 변경하실 수 있습니다.</span>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- footer -->
	
	
	
	<script type="text/javascript">
		$(document).ready(function(){
			$('#toggleA').click(function(){
				$('.subscribe').addClass('is_active');
				$('.how_to').removeClass('is_active');
				$('.category_product_list').css('display','block');
				$('.subscription_how_to').css('display','none');
			});
			$('#toggleB').click(function(){
				$('.subscribe').removeClass('is_active');
				$('.how_to').addClass('is_active');
				$('.category_product_list').css('display','none');
				$('.subscription_how_to').css('display','block');
			});
		});
	</script>
</body>
</html>