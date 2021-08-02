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
<title>Insert title here</title>
<script type="text/javascript">
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
			document.getElementById('invenNotice').innerHTML = "- 해당 상품의 최대 구매 가능한 수량은 " + inven + "개 입니다.<br>";
		}
	}
	
	function showCalendar(){
		document.getElementById('showCalendar').innerHTML = "<br><input type='date' name='c_delivery_date' required>";
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

%>
<link rel="stylesheet" href="./css/itemDetail.css">
<link rel="stylesheet" href="./css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

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
			<div class="image">
				<ul>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
			<div class="category_product_detail">
				<div class="summary">
					<span class="name_1"><%=itemDetail.getI_desc() %></span><br>
					<span class="name_2"><%=i_name %></span><br>
					<span class="discount">
						<%if (i_discount!=1){%> <!-- 할인이 없으면 표시 안함 -->
						<span class="per"><%=percent %></span>
						<span class="old_price"><del><%=NumberFormat.getInstance().format(i_price) %>원-&gt;</del></span><%} %>
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
						<%if(!path.equals("/SubContent.shop")){ %>
							<div class="label_div">
								<label class="label_name" id="label_name_date">수령일</label>
								<input class="delivery_date" type="text" name="c_delivery_date" placeholder="수령일을 선택해주세요." required>
							</div>
						<%}else{ %> <!-- 정기구독 경유 접속시 표시 -->
							<div class="label_div">
								<label class="label_name">구독 옵션</label>
								<select name="sub_option" size="1" onchange="showCalendar(), isLetter(<%=price %>)" required>
									<option hidden="" value="">구독기간을 선택해주세요.</option>
									<option value="2">1개월동안 X 2주마다</option>
									<option value="4">2개월동안 X 2주마다</option>
									<option value="12">6개월동안 X 2주마다</option>
									<option value="24">12개월동안 X 2주마다</option>
								</select>
								<span id="showCalendar"></span>
							</div>
						<%} %>
						<div class="label_div">
							<label class="label_name" id="label_name_qty">수량</label> 
							<input class="button_qty" type="button" value="-" onclick="ctlQty(-1,<%=price %>,<%=inven%>)">
							<input class="c_qty" type="text" name="c_qty" value="1" required readonly>
							<input class="button_qty" type="button" value="+" onclick="ctlQty(1,<%=price %>,<%=inven%>)">
							<span id="invenNotice"></span>
						</div>
						<div class=label_div>
							<label class="label_name">편지 추가</label>
							<span class="add_letter">
								<label class="radiobtn"><input type="radio" class="radioA" name="c_letter" value="1" onclick="isLetter(<%=price %>)" checked>추가할게요(+2,500원)&emsp;</label>
								<label class="radiobtn"><input type="radio" class="radioB" name="c_letter" value="0" onclick="isLetter(<%=price %>)">추가하지 않을게요</label>
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
								if(path.equals("/SubContent.shop")){%> <!-- 비회원 접속시 표시 -->
								<input class="subbuy" type="submit" value="구독 신청" onclick="javascript:form.action='VisitorJoin.me'"> <!-- 정기구독(비회원) 경유 접속시 표시 -->
							<%}else{%>
								<input class="cartbuy" type="submit" value="장바구니" onclick="javascript:form.action='VisitorCart.cr'"> 
								<input class="nowbuy" type="submit" value="바로 구매" onclick="javascript:form.action='VisitorJoin.me'">
							<%} %>
						<%}else{
							if(path.equals("/SubContent.shop")){%> 
								<input class="subbuy" type="submit" value="구독 신청" onclick="javascript:form.action='OrderSub.od'"> <!-- 정기구독 경유 접속시 표시 -->
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
	</div>

	
	
	
	
	
		
	<br>
			
	<h3>상품설명</h3>
		
		
	<h3>리뷰</h3>
	<table border="1">
	<tr><td>별점</td><td>제목</td><td>작성자</td><td>주문일자</td></tr>
	<%
		System.out.println(rbList.size());
		for(int i=0; i<rbList.size(); i++) {%>
			<tr><td><%=rbList.get(i).getR_rate() %></td><td><%=rbList.get(i).getR_title() %></td><td><%=rbList.get(i).getR_writer() %></td><td><%=rbList.get(i).getR_rdate() %></td></tr>
		<%
		} 
	%>
	</table>
	
	<h3>배송안내</h3>
	<textarea rows="30" cols="150">
1. 배송 정보
1-1. 배송비 정책
[공통] 구매 금액 합산 30,000원 이상일 경우 배송비는 무료입니다. 
[유의사항] 정기구독 상품 및 일부 3만원 미만의 배송비 무료 상품은 구매금액 합산에 포함되지 않습니다.

1-2. 일반배송 (택배배송)
[배송일] 선택하신 수령일 전날 발송되어 해당 일에 수령합니다.
[배송방법] 우체국 택배와 cj대한통운 택배를 통해서 배송되며, 카카오톡 알림톡을 통해 주문하신 분께 송장 번호를 개별적으로 공지합니다.
[배송지역]  전국 모든 지역에 배송이 가능합니다. (제주도 및 도서 산간 지역은 1~2일 늦어질 수 있습니다.)
[배송시간] 택배로 배송되는 특성상 당일 정확한 배송 시간 안내는 어려운 점 양해 부탁드려요.
 해당 주소지에 평소 우체국택배 집배원님이 배송 가시는 시간에 받아보실 수 있습니다.

1-3. 새벽배송 
[배송지역] 서울/경기 일부지역에만 제공되며, 섬/공단/학교/학교기숙사/병원/관공서는 배송이 불가합니다.
[배송방법] 새벽배송 가능지역은 오전 8시 이전까지 작성하신 배송지로 배송되며, 그 외 지역은 일반배송 (택배배송)으로 발송됩니다.
[배송시간] 오후 2시 이전 주문완료건에 대하여 다음날 오전 8시 이전까지 배송받을 수 있습니다. 폭설, 한파, 자연재해 등 도로상황이 좋지 못할 경우 다소 지연될 수 있습니다.
[배송비 정책] 새벽배송 가능지역일 경우, 추가비용없이 배송됩니다.
[유의사항]
- 새벽배송은 저온의 온도를 유지하기 위해 단열재 없이 배송됩니다.
- 결제시, 공동현관 비밀번호 기입이 필수이며, 미기입시 1층 현관에 배송됩니다.

▶ 새벽배송 가능지역 ◀
1) 전지역 가능
서울, 안양시, 부천시, 구리시, 성남시, 수원시, 광명시, 의정부시, 안산시, 시흥시 (안산/시흥 공단지역 제외)

2) 일부지역가능
광주시  오포읍

고양시
덕양구 – ( 벽제, 고양, 내유, 관산, 대자, 선유, 오금, 효자, 북한, 동산, 용두 ) 제외 전 지역 가능
일산동구 – 전 지역 가능
일산서구 – 전 지역 가능

과천시   관문동 제외 전지역

용인시   수지구 고기동, 처인구 제외 전지역

인천광역시   계양구, 부평구, 남동구, 연수구, 미추홀구, 서구, 동구, 중 ( 송현동, 송림동, 화수동, 만석동, 화평동, 송월동, 북성동, 항동, 해안동, 중앙동, 관동, 신포동, 내동, 전동, 인현동, 용동, 경동, 금곡동, 창영동, 도원동, 선화동, 유동, 신흥동, 신생동, 사동, 답동, 율목동 )

하남시   
미사동(미사1~2동), 신장동(신장1~2동), 덕풍동(덕풍1~3동), 망월동, 선동, 풍산동, 창우동, 천현동, 학암동, 위례동

파주시   
금촌동(금촌1~3동), 운정1~3동, 야동동, 다율동, 와동동, 목동동, 동패동, 문발동, 야당동, 교하동

화성시
병점동(병점1~2동), 동탄1~6동, 진안동, 반월동, 기산동, 능동, 반송동, 석우동, 영천동, 청계동, 오산동, 목동, 산척동, 봉담읍 일부

의왕시   내손동(내손1~2동), 포일동, 오전동, 고천동, 청계동

군포시   군포1~2동, 산본동(산본1~2동), 금정동, 당동, 당정동, 부곡동, 광정동, 궁내동, 수리동, 재궁동, 오금동

김포시   양촌읍, 고촌읍, 운양동, 장기동, 구래동, 마산동, 걸포동, 감정동, 사우동, 북변동, 풍무동

남양주시
진전읍, 진건읍, 와부읍, 별내면, 퇴계원면, 다산동(다산1~2동), 별내동, 평내동, 호평동, 금곡동, 이패동, 도농동, 지금동

2. 교환 및 환불 정책
[결제 완료] 상태라면 언제든지 홈페이지 및 고객센터를 통해 해지 가능합니다. (마이페이지 > 주문내역)
[발송 준비] 단계에서는 주문 내역 변경 및 주문 취소가 불가합니다.
[배송 완료] 배송 이후에는 원칙적으로 환불이 불가하며, 100% happiness program에 따라
꽃 신선도, 배송 상태(꽃 부러짐) 등 문제가 있는 경우에는 동일 꽃 혹은 동일 크기의 꽃으로 다시 보내드립니다.
[기타] 무통장 결제의 환불은 주문취소요청이 확인된 날짜 기준으로 다음날(휴일 제외)에 일괄적으로 이루어집니다.
	</textarea>
	
	
	
	
	<!-- footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- footer -->
	
	<script type="text/javascript">
		$(document).ready(function(){
			$('.radioA').click(function(){
				$('#letter').css('display','block');
			});
			$('.radioB').click(function(){
				$('#letter').css('display','none');
			});
		});
	</script>
</body>
</html>












