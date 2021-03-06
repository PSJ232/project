<%@page import="java.text.NumberFormat"%>
<%@page import="vo.ReviewBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function sample6_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }                 
	            }
	            
	            
	            if(addr.indexOf("서울 ") == 0 || addr.indexOf("경기 ") == 0){
		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
		          	// document.getElementById('sample6_postcode').value = data.zonecode;
		            document.getElementById("sample6_address").value = addr;
		            // 커서를 상세주소 필드로 이동한다.
		            //document.getElementById("sample6_detailAddress").focus();
	            } else {
	            	alert("당일 배송 상품은\n서울/경기 일부 지역만 배송 가능합니다.\n주소를 다시 확인 부탁드립니다.");
	            };
	        }
	    }).open();
	}



	function isLetter(price) {
		var c_letter = document.order.c_letter.value;
		var qty = document.order.c_qty.value;
		var sub_option = 1;
		if(document.order.sub_option != null) {
			sub_option = document.order.sub_option.value;
		}
		
		if(c_letter==0){
			document.getElementById('amount').innerHTML = (qty*price*sub_option).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
			document.getElementById('totalPrice').innerHTML = (qty*price*sub_option).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
		} else {
			document.getElementById('amount').innerHTML = (qty*price*sub_option).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
			document.getElementById('totalPrice').innerHTML = ((qty*price*sub_option)+2500).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
		}
	}
	
	function ctlQty(sum, price, inven){ // 장바구니 수량 조절
		var qty = document.order.c_qty.value;
		if(qty==1 && sum<0){
			return;
		}
		if(inven == qty && sum < 0) {
			document.getElementById('invenNotice').innerHTML = "";
			document.order.c_qty.value = Number(qty)+sum;
			isLetter(price);
		} else if(inven > qty) {
			document.getElementById('invenNotice').innerHTML = "";
			document.order.c_qty.value = Number(qty)+sum;
			isLetter(price);
		} else {
			document.getElementById('invenNotice').innerHTML = "- 해당 상품의 <span class='invenNotice_red'>최대 구매 가능한 수량은 " + inven + "개</span> 입니다.";
		} 
	}
	
</script>

<%
ItemBean itemDetail = (ItemBean)request.getAttribute("itemDetail");
ArrayList<ReviewBean> rbList = (ArrayList<ReviewBean>)request.getAttribute("rbList");
// review null 값 처리해야됨
int i_id = Integer.parseInt(request.getParameter("i_id"));
float i_discount = itemDetail.getI_discount();
int i_price = itemDetail.getI_price();
String i_name = itemDetail.getI_name();
int price = (int)(i_price*i_discount/100)*100;
int inven = itemDetail.getI_inven();
String percent = (int)(100-i_discount*100) + "%";
String path = (String) request.getAttribute("path");
String category = "";
switch(path){
	case "/QuickContent.shop" : category = "당일배송"; break;
	case "/FlowersContent.shop" : category = "꽃다발"; break;
	case "/SubContent.shop" : category = "정기구독"; break;
}

int i_category = itemDetail.getI_category();
String minDate = "";
String maxDate = "";
switch (i_category) {
	case 1:
		minDate = "+1d";
		maxDate = "+14d";
		break;
	case 2:
		minDate = "+0d";
		maxDate = "+14d";
		break;
	case 3:
		minDate = "+1d";
		maxDate = "+20d";
		break;
}
%>
<link rel="stylesheet" href="./css/itemDetail.css">
<link rel="stylesheet" href="./css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title><%=itemDetail.getI_name() %></title>
</head>
<body>
  <!-- header -->
  	<jsp:include page="../inc/header.jsp" ></jsp:include>
  <!-- header -->
	<div class="contents_container">
		<div class="navigation">
			HOME > <%=category %> > <%=i_name %>
		</div>
		<div class="inbox">
			<div class="top_box">
				<div class="category_product_image">
					<div class="thumnail_main">
						<img src="./admin_layout/upload/<%=itemDetail.getI_img() %>">		
					</div>
					<div class="thumnail_mini">
						<ul class="images_4">
							<li class="image">
								<button type="button" class="change_img active" name="0">
									<img src="./admin_layout/upload/<%=itemDetail.getI_img() %>">
								</button>
							</li>
							<li class="image">
								<button type="button" class="change_img" name="1">
									<img src="./admin_layout/upload/<%=itemDetail.getI_subimg2() %>">
								</button>
							</li>
							<li class="image">
								<button type="button" class="change_img" name="2">
									<img src="./admin_layout/upload/<%=itemDetail.getI_subimg3() %>">
								</button>
							</li>
							<li class="image">
								<button type="button" class="change_img" name="3">
									<img src="./admin_layout/upload/<%=itemDetail.getI_subimg4() %>">
								</button>
							</li>
						</ul>
					</div>
				</div>
				<div class="category_product_detail">
					<div class="summary">
						<span class="name_1"><%=itemDetail.getI_desc() %></span><br>
						<span class="name_2"><%=i_name %></span><br>
						<span class="discount">
							<%if (i_discount!=1){%> <!-- 할인이 없으면 표시 안함 -->
							<span class="per"><%=percent %> </span>
							<span class="old_price"><del><%=NumberFormat.getInstance().format(i_price) %>원-&gt;</del> </span><%} %>
							<span class="price"><%=NumberFormat.getInstance().format(price) %>원</span>
						</span>
					</div>
					<div class="notice_fresh">
						<%if(path.equals("/FlowersContent.shop")){ %>
						<p class="notice_fresh_info">3만원 이상 구매 시, <b>무료배송!</b> <br>
							<span class="web">서울/경기/인천 일부지역은 <b>새벽배송으로 신선하게</b> 배송됩니다.</span><%} %> <!-- 꽃배달 경유 접속시 표시 -->
						</p>
						
						<%if(path.equals("/SubContent.shop")){ %>
						<p class="notice_fresh_info">정기구독 전상품, <b>무료배송!</b> <br>
							<span class="web">서울/경기/인천 일부지역은 <b>새벽배송으로 신선하게</b> 배송됩니다.</span><%} %> <!-- 정기구독 경유 접속시 표시 -->
						</p>
						
						<%if(path.equals("/QuickContent.shop")){ %>
						<p class="notice_fresh_info">당일 배송 상품은 서울/경기 일부 지역만 배송 가능합니다. <br>
							<span class="web">배송비는 지역에 따라 차등 부과됩니다.</span><%} %> <!-- 당일배송 경유 접속시 표시 -->
						</p>
					</div>
					<div class="form_section">
						<form method="post" name="order">
							<input type="hidden" name="i_id" value=<%=i_id %>>
							<%if(path.equals("/SubContent.shop")){ %> <!-- 정기구독 경유 접속시 표시 -->
								<div class="label_div">
									<label class="label_name" id="label_name_option">구독 옵션<span class="required_mark"> *</span></label>
									<select class="sub_option" name="sub_option" size="1" onchange="isLetter(<%=price %>)" required>
										<option hidden="" value="">구독기간을 선택해주세요.</option>
										<option value="2">1개월동안 X 2주마다</option>
										<option value="4">2개월동안 X 2주마다</option>
										<option value="12">6개월동안 X 2주마다</option>
										<option value="24">12개월동안 X 2주마다</option>
									</select>
								</div>
								<div class="calendar_right">
									<input class="delivery_date" type="text" name="c_delivery_date" style="display: none;" required>
									<span class="designinfo" style="display: none">- 8월 17일 이후로 지정하시면 <b>꽃다발 디자인이 변경됩니다.</b></span>
								</div>
							<%}else if(path.equals("/QuickContent.shop")){ %> <!-- 당일배송 경유 접속시 표시 --> 
								<div class="label_div">
									<label class="label_name" id="label_name_date">수령일<span class="required_mark"> *</span></label>
									<input class="delivery_date" type="text" name="c_delivery_date" placeholder="수령일을 선택해주세요." required>
									
									
									<div class="select_time_right" style="display: none;">
										<label class="label_name" id="label_name_date">수령시간<span class="required_mark"> *</span></label>
										<select class="quick_option" name="quick_option" size="1" required>
											<option hidden="" value="">수령시간을 선택해주세요.</option>
											<option value="11:30:00">오전11시 30분 - 오후1시 30분</option>
											<option value="13:30:00">오후1시 30분 - 오후3시 30분</option>
											<option value="16:00:00">오후4시 - 오후6시</option>
											<option value="18:00:00">오후6시 - 오후8시 수령</option>
										</select>
									</div>
									<div class="check_address_right" style="display: none;">
										<label class="label_name" id="label_name_date">주소검색<span class="required_mark"> *</span></label>
										<input class="address_option" id="sample6_address" type="text" name="address_option" placeholder="주소 검색" onclick="sample6_execDaumPostcode()" required>
									</div>	
								</div>
							<%}else{ %> <!-- 일반배송 경유 접속시 표시 -->
								<div class="label_div">
									<label class="label_name" id="label_name_date">수령일<span class="required_mark"> *</span></label>
									<input class="delivery_date" type="text" name="c_delivery_date" placeholder="수령일을 선택해주세요." required>
								</div>
							<%} %>
							<div class="label_div">
								<label class="label_name" id="label_name_qty">수량</label> 
								<input class="button_qty" type="button" value="-" onclick="ctlQty(-1,<%=price %>,<%=inven%>)">
								<input class="c_qty" type="text" name="c_qty" value="1" required readonly>
								<input class="button_qty" type="button" value="+" onclick="ctlQty(1,<%=price %>,<%=inven%>)"><br>
								<span id="invenNotice"></span>
							</div>
							<div class=label_div>
								<label class="label_name">편지 추가</label>
								<span class="add_letter">
									<label class="radiobtnA checked"><input type="radio" class="radio" name="c_letter" value="1" onclick="isLetter(<%=price %>)" checked>추가할게요.(+2,500원)&emsp;&emsp;</label>
									<label class="radiobtnB"><input type="radio" class="radio" name="c_letter" value="0" onclick="isLetter(<%=price %>)">추가하지 않을게요.</label>
								</span>
							</div>
							<div class="extra">
								<label class="label_name">상품가격</label>
								<div class="extra_right">
									<span id="amount"><%=NumberFormat.getInstance().format(price) %>원</span>
								</div>
							</div>
							<div class="extra" id="letter" style="display: block;">
								<label class="label_name">추가상품 : 편지추가</label>
								<div class="extra_right">
									<span class="letterPrice">2,500원<br></span>
								</div>
							</div>
							<div class="free">무료배송</div>
							<div class="total">총 주문금액&emsp;<span id="totalPrice"><%=NumberFormat.getInstance().format(price+2500) %>원</span></div>
							<div>
							<%if(session.getAttribute("m_id") == null){ 
									if(path.equals("/SubContent.shop")){%> <!-- 비회원 접속시 표시 -->  <!-- 정기구독(비회원) 경유 접속시 표시 -->
									<input class="cartbuy" type="submit" value="장바구니" onclick="javascript:form.action='VisitorCart.cr'">
									<input class="subbuy" type="submit" value="구독 신청" onclick="javascript:form.action='VisitorJoin.me'">
								<%}else if(path.equals("/QuickContent.shop")){%> <!-- 당일배송 경유 접속시 표시  -->
									<input class="nowbuy_Quick" type="submit" value="바로 구매" onclick="javascript:form.action='VisitorJoin.me'"> 
								<%}else{%>
									<input class="cartbuy" type="submit" value="장바구니" onclick="javascript:form.action='VisitorCart.cr'"> 
									<input class="nowbuy" type="submit" value="바로 구매" onclick="javascript:form.action='VisitorJoin.me'">
								<%} %>
							<%}else{
								if(path.equals("/SubContent.shop")){%> <!-- 정기구독 경유 접속시 표시 -->
									<input class="cartbuy" type="submit" value="장바구니" onclick="javascript:form.action='CartInsertPro.cr'">  
									<input class="subbuy" type="submit" value="구독 신청" onclick="javascript:form.action='OrderSub.od'">
								<%}else if(path.equals("/QuickContent.shop")){%> <!-- 당일배송 경유 접속시 표시  -->
									<input class="nowbuy_Quick" type="submit" value="바로 구매" onclick="javascript:form.action='OrderNow.od'"> 
								<%}else{%>
									<input class="cartbuy" type="submit" value="장바구니" onclick="javascript:form.action='CartInsertPro.cr'"> 
									<input class="nowbuy" type="submit" value="바로 구매" onclick="javascript:form.action='OrderNow.od'"> 
								<%}%>
							<%}%>
							</div>
						</form>
					
					</div>
				</div>
			</div>
			<!-- 상품상세 시작 -->
			<div class="category_product_description">
				<!-- 중간 3버튼 네비게이션   -->
				<ul class="middle_nav">
					<li class="middle_li li_desc active" onclick="location.href='#desc_image'">상품설명</li>
					<li class="middle_li li_review" onclick="location.href='#review_list'">리뷰</li>
					<li class="middle_li li_deli_info" onclick="location.href='#delivery_info'">배송안내</li>
				</ul>
				<div id="desc_image" class="desc_image">
					<img src="./admin_layout/upload/<%=itemDetail.getI_detailpage() %>">
				</div>
			</div>
			<!-- 리뷰 시작 -->
			<div id="review_list">
				<div class="review_top">
					<div class="review_title">
					리뷰
						<b class="point_event">리뷰 작성 시 200P 적립 (사진 등록 시 300P)</b>
					</div>
					<div class="review_write_btn">
						<a href="ReviewInsertForm.rv" class="btn_a">리뷰 쓰기</a>
					</div>
				</div>
				<div class="review_inbox">
					<ul class="tabs">
						<li class="tab-link current" data-tab="tab-1">
							<button type="button" class="btn best_reviews">
								<span>꽃다발 베스트 리뷰</span>
							</button>
						</li>
						<li class="tab-link" data-tab="tab-2">
							<button type="button" class="btn common_reviews">
								<span>이 상품의 리뷰</span>
							</button>
						</li>
					</ul>
					<div class="row">
						<div id="tab-1" class="tab-content current">
							<!-- 베스트 리뷰 jsp파일  -->
							<jsp:include page="../inc/best_review.jsp"></jsp:include>
						</div>
						<div id="tab-2" class="tab-content">
						<%if(rbList.isEmpty()) {
							%>작성된 리뷰가 없습니다.<%
						} else {%>	
							<table>
						<!-- 	<tr><td>별점</td><td>제목</td><td>작성자</td><td>주문일자</td></tr> -->
							<%for(int i=0; i<rbList.size(); i++) {
									//리뷰 아이디 설정
									String r_writer[] = rbList.get(i).getR_writer().split("@");
									String a = r_writer[0].substring(0, 4);
									String editId = a + "***";
								
									// 평점 설정
									String rate = "";
									switch(rbList.get(i).getR_rate()) {
									case 5: rate =  "★★★★★"; break;
									case 4: rate =  "★★★★"; break;
									case 3: rate =  "★★★"; break;
									case 2: rate =  "★★"; break;
									case 1: rate =  "★"; break;
										
									}
									
									String content = rbList.get(i).getR_content(); // 본문 줄바꿈
									if (content != null) {
										content = content.replaceAll("\r\n", "<br>");
									}
							%>
								<tr onclick="$(this).next('tr').toggle()">
									<td class="td1"><%=rate %></td>
									<td class="td2">
										<%=rbList.get(i).getR_title() %>
										<%if(rbList.get(i).getR_img()!=null){ %>
										<span class="icon_img"></span><%} %>
									</td>
									<td class="td3"><%=editId %>님</td>
									<td class="td4"><%=rbList.get(i).getR_rdate() %></td>
								</tr>
								<tr id="hidden">
									<td class="td5" colspan="5">
										<p><%=content %></p><br>
										<img src="./reviewUpload/<%=rbList.get(i).getR_img()%>"  onerror="this.style.display='none'" alt=''/>
									</td>
								</tr>
							<%}	%>
							</table>
						<%} %>
						</div>
					</div>
				</div>
			</div>
			<div id="delivery_info">
				<div class="delivery_info_tit_tab is_open">
					<div class="intab">
						<button type="button" class="opener" data-type="information">
							<span class="deli_title">배송안내</span>&nbsp;&nbsp;&nbsp;
							<span class="icon_arrow"><img src="./img/arrow_icon1.png" width="20px"></span>
							<span class="icon_arrow" style="display: none"><img src="./img/arrow_icon2.png" width="20px"></span>
						</button>
					</div>
				</div>
				<div class="inner">
					<div id="info_html">
						<h3>
							<strong>1. 배송 정보</strong>
						</h3>
						<p>
							<strong>1-1. 배송비 정책</strong>
						</p>
						<p>[공통]&nbsp;구매 금액 합산 30,000원 이상일 경우 배송비는 무료입니다.&nbsp;</p>
						<p>[유의사항] 정기구독 상품 및 일부 3만원 미만의&nbsp;배송비 무료 상품은&nbsp;구매금액 합산에 포함되지 않습니다.</p>
						<p>&nbsp;</p>
						<p>
							<strong>1-2. 일반배송&nbsp;(택배배송)</strong>
						</p>
						<p>[배송일]&nbsp;선택하신 수령일 전날 발송되어 해당 일에 수령합니다.</p>
						<p>[배송방법]&nbsp;우체국 택배와 cj대한통운 택배를 통해서 배송되며, 카카오톡 알림톡을 통해 주문하신 분께 송장 번호를 개별적으로 공지합니다.</p>
						<p>[배송지역]&nbsp;&nbsp;전국 모든 지역에 배송이 가능합니다. (제주도 및 도서 산간 지역은 1~2일 늦어질 수 있습니다.)</p>
						<p>[배송시간]&nbsp;택배로 배송되는 특성상 당일 정확한 배송 시간 안내는 어려운 점 양해 부탁드려요.</p>
						<p>&nbsp;해당 주소지에 평소 우체국택배 집배원님이 배송 가시는 시간에 받아보실 수 있습니다.</p>
						<p>&nbsp;</p>
						<p>
							<strong>1-3. 새벽배송&nbsp;</strong>
						</p>
						<p>[배송지역] 서울/경기 일부지역에만 제공되며, 섬/공단/학교/학교기숙사/병원/관공서는 배송이 불가합니다.</p>
						<p>[배송방법] 새벽배송 가능지역은 오전 8시 이전까지 작성하신 배송지로 배송되며, 그 외 지역은 일반배송 (택배배송)으로 발송됩니다.</p>
						<p>[배송시간] 오후 2시 이전 주문완료건에 대하여 다음날 오전 8시 이전까지 배송받을 수 있습니다. 폭설, 한파, 자연재해 등 도로상황이 좋지 못할 경우 다소 지연될 수 있습니다.</p>
						<p>[배송비 정책] 새벽배송 가능지역일 경우, 추가비용없이 배송됩니다.</p>
						<p>[유의사항]</p>
						<p>- 새벽배송은 저온의 온도를 유지하기 위해 단열재 없이 배송됩니다.</p>
						<p>- 결제시, 공동현관 비밀번호 기입이 필수이며, 미기입시 1층 현관에 배송됩니다.</p>
						<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>
						<p>
							<strong>▶ 새벽배송 가능지역 ◀</strong>
						</p>
						<p>1) 전지역 가능</p>
						<p>서울, 안양시, 부천시, 구리시, 성남시, 수원시, 광명시, 의정부시, 안산시, 시흥시 (안산/시흥 공단지역 제외)</p>
						<p>&nbsp;</p>
						<p>2) 일부지역가능</p>
						<p><u>광주시</u>&nbsp; 오포읍</p>
						<p>&nbsp;</p>
						<p><u>고양시</u></p>
						<p>덕양구 – ( 벽제, 고양, 내유, 관산, 대자, 선유, 오금, 효자, 북한, 동산, 용두 ) 제외 전 지역 가능</p>
						<p>일산동구 – 전 지역 가능</p>
						<p>일산서구 – 전 지역 가능</p>
						<p>&nbsp;</p>
						<p><u>과천시</u>&nbsp; &nbsp;관문동 제외 전지역</p>
						<p>&nbsp;</p>
						<p><u>용인시</u>&nbsp; &nbsp;수지구 고기동, 처인구 제외 전지역</p>
						<p>&nbsp;</p>
						<p><u>인천광역시</u>&nbsp; &nbsp;계양구, 부평구, 남동구, 연수구, 미추홀구, 서구, 동구, 중 ( 송현동, 송림동, 화수동, 만석동, 화평동, 송월동, 북성동, 항동, 해안동, 중앙동, 관동, 신포동, 내동, 전동, 인현동, 용동, 경동, 금곡동, 창영동, 도원동, 선화동, 유동, 신흥동, 신생동, 사동, 답동, 율목동 )</p>
						<p>&nbsp;</p>
						<p><u>하남시</u>&nbsp; &nbsp;</p>
						<p>미사동(미사1~2동), 신장동(신장1~2동), 덕풍동(덕풍1~3동), 망월동, 선동, 풍산동, 창우동, 천현동, 학암동, 위례동</p>
						<p>&nbsp;</p>
						<p><u>파주시</u>&nbsp; &nbsp;</p>
						<p>금촌동(금촌1~3동), 운정1~3동, 야동동, 다율동, 와동동, 목동동, 동패동, 문발동, 야당동, 교하동</p>
						<p>&nbsp;</p>
						<p><u>화성시</u></p>
						<p>병점동(병점1~2동), 동탄1~6동, 진안동, 반월동, 기산동, 능동, 반송동, 석우동, 영천동, 청계동, 오산동, 목동, 산척동, 봉담읍 일부</p>
						<p>&nbsp;</p>
						<p><u>의왕시</u>&nbsp; &nbsp;내손동(내손1~2동), 포일동, 오전동, 고천동, 청계동</p>
						<p>&nbsp;</p>
						<p><u>군포시</u>&nbsp; &nbsp;군포1~2동, 산본동(산본1~2동), 금정동, 당동, 당정동, 부곡동, 광정동, 궁내동, 수리동, 재궁동, 오금동</p>
						<p>&nbsp;</p>
						<p><u>김포시</u>&nbsp; &nbsp;양촌읍, 고촌읍, 운양동, 장기동, 구래동, 마산동, 걸포동, 감정동, 사우동, 북변동, 풍무동</p>
						<p>&nbsp;</p>
						<p><u>남양주시</u></p>
						<p>진전읍, 진건읍, 와부읍, 별내면, 퇴계원면, 다산동(다산1~2동), 별내동, 평내동, 호평동, 금곡동, 이패동, 도농동, 지금동</p>
						<p>&nbsp;</p>
						<h3>
							<strong>2. 교환 및 환불 정책</strong>
						</h3>
						<p>[결제 완료] 상태라면 언제든지 홈페이지 및 고객센터를 통해 해지 가능합니다. (마이페이지 &gt; 주문내역)</p>
						<p>[발송 준비] 단계에서는 주문 내역 변경 및 주문 취소가 불가합니다.</p>
						<p>[배송 완료] 배송 이후에는 원칙적으로 환불이 불가하며, 100% happiness program에 따라</p>
						<p>꽃 신선도, 배송 상태(꽃 부러짐) 등 문제가 있는 경우에는 동일 꽃 혹은 동일 크기의 꽃으로 다시 보내드립니다.</p>
						<p>[기타]&nbsp;무통장 결제의 환불은 주문취소요청이 확인된 날짜 기준으로 다음날(휴일 제외)에 일괄적으로 이루어집니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- footer -->
	
	<div class="sticky">
		<ul class="middle_nav">
			<li class="middle_li li_desc active" onclick="location.href='#desc_image'">상품설명</li>
			<li class="middle_li li_review" onclick="location.href='#review_list'">리뷰</li>
			<li class="middle_li li_deli_info" onclick="location.href='#delivery_info'">배송안내</li>
		</ul>
	</div>
</body>
	<script type="text/javascript">
		$(document).ready(function(){
			// 편지지 추가 옵션
			$('.radio').click(function(){
				if($(this).val() == 1) {
					$('#letter').css('display','block');
					$('.radiobtnB').removeClass('checked');
					$('.radiobtnA').addClass('checked');
				} else {
					$('#letter').css('display','none');
					$('.radiobtnA').removeClass('checked');
					$('.radiobtnB').addClass('checked');
				}
			});
			
			 // 구독 옵션 선택하면 날짜입력창 보임
			$('.sub_option').change(function(){
				$('.delivery_date').css('display','block');
				$('.designinfo').css('display','block');
			});
			 // 당일배송 날짜 선택하면 시간선택창 보임
			$('.delivery_date').change(function(){
				$('.select_time_right').css('display','block');
			});
			 // 당일배송 시간 선택하면 주소창 보임
			$('.quick_option').change(function(){
				$('.check_address_right').css('display','block');
			});
			
			
			// 이미지 전환
			$('.change_img').click(function(){
				$('.change_img').removeClass('active');
				$(this).addClass('active');
				var imgUrl = $(this).find('img').attr('src')
			 	$('.thumnail_main img').attr('src', imgUrl);
			});
			
			// 중간 네비게이션 바 선택
			$('.middle_li').click(function(){
				if($(this).hasClass('li_desc')){
					$('.middle_li').removeClass('active');
					$('.li_desc').addClass('active');
				}
				if($(this).hasClass('li_review')){
					$('.middle_li').removeClass('active');
					$('.li_review').addClass('active');
				}
				if($(this).hasClass('li_deli_info')){
					$('.middle_li').removeClass('active');
					$('.li_deli_info').addClass('active');
				}
			});
			
			// 중간 네비게이션 바 하단에 보이기
			$(document).scroll(function(){
				var point = $(this).scrollTop();
				if(point > $(".middle_nav").offset().top){
					$('.sticky').addClass('visible');
				} else {
					$('.sticky').removeClass('visible');
				}
				
				if(point+700 > $(".desc_image").offset().top){
					$('.middle_li').removeClass('active');
					$('.li_desc').addClass('active');
				}
				
				if(point+700 > $("#review_list").offset().top){
					$('.middle_li').removeClass('active');
					$('.li_review').addClass('active');
				}
				
				if(point+700 > $("#delivery_info").offset().top){
					$('.middle_li').removeClass('active');
					$('.li_deli_info').addClass('active');
				}
				
			});
			
			// 배송안내 내용 보이기
			$('.intab .opener').click(function(){
				$('#info_html').toggle();
				$('.icon_arrow').toggle();
				
			});
			
			// 리뷰 탭 변경기능
			$('ul.tabs li').click(function(){
				var tab_id = $(this).attr('data-tab');
		
				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');
		
				$(this).addClass('current');
				$("#"+tab_id).addClass('current');
			})
			
			// 달력 한글화
			  $.datepicker.setDefaults({
		        dateFormat: 'yymmdd',
		        prevText: '이전 달',
		        nextText: '다음 달',
		        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		        showMonthAfterYear: true,
		        yearSuffix: '년'
		    });
			
		    // 달력 설정 시작일
		    $('.admin_header_subtitle').text("수령일");
		    $('.delivery_date').datepicker({
		       dateFormat: "yy-mm-dd",
		       changeMonth: true,
		       maxDate: "<%=maxDate%>",
		       minDate: "<%=minDate%>",
		       beforeShowDay: function(date) {
		            var day = date.getDay();
		            return [(day != 0 && day != 1), '']; //일,월 배송일 제외
		        }
		    });
		});
	</script>
</html>












