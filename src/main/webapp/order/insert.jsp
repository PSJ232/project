<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="vo.OrderDetailBean"%>
<%@page import="vo.CartBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberBean"%>
<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/order_insert.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
    function pointAccept(m_point, totalPrice, gradeDiscount){ // 포인트 입력하면 실행
    	var finalPrice = totalPrice - gradeDiscount; // 포인트 계산을 위한 최종금액 확인
    	if(m_point >= document.order.o_point.value && finalPrice >= document.order.o_point.value){
	    	document.getElementById('pointResult').innerHTML = document.order.o_point.value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 사용 포인트를 표시
	    	document.getElementById('nowPoint').innerHTML = (m_point - document.order.o_point.value).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); // (보유포인트 - 사용포인트)연산 결과를 표시
	    	document.getElementById('totalPrice').innerHTML = (finalPrice - document.order.o_point.value).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); // (상품 총금액 - 포인트)연산 결과를 표시
	    	document.order.paymentAmount.value = finalPrice - document.order.o_point.value; // 결제api에 전달할 결제금액을 저장 -> 테스트 실제로 덮어써지는지 테스트 아직 못해봄
    		document.getElementById('pointNotice').innerHTML = "";
    	} else {
    		document.order.o_point.value = "";
    		pointAccept(m_point, totalPrice, gradeDiscount);
    		document.getElementById('pointNotice').innerHTML = "- 보유포인트 또는 상품금액을 초과할 수 없습니다.<br>";
    	}
    }
    
    function pointFullAccept(m_point, totalPrice, gradeDiscount){ // 전액사용버튼 누르면 실행
    	var finalPrice = totalPrice - gradeDiscount; // 포인트 계산을 위한 최종금액 확인
    	if(m_point >= finalPrice) {
    		document.order.o_point.value = finalPrice;
    	} else {
    		document.order.o_point.value = m_point;
    	}
    	document.getElementById('pointNotice').innerHTML = "";
    	document.getElementById('pointResult').innerHTML = document.order.o_point.value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 사용 포인트를 표시
    	document.getElementById('nowPoint').innerHTML = (m_point - document.order.o_point.value).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); // (보유포인트 - 사용포인트)연산 결과를 표시
    	document.getElementById('totalPrice').innerHTML = (finalPrice - document.order.o_point.value).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); // (상품 총금액 - 포인트)연산 결과를 표시
    }

</script>
<head>
<meta charset="UTF-8">
<title>사계 | 주문/결제</title>
<%
Calendar cal = Calendar.getInstance();
int sub_option = 1;
if(request.getParameter("sub_option") != null) {
	sub_option = Integer.parseInt(request.getParameter("sub_option"));
}
String sub_name = "";
switch(sub_option){
case 2 : sub_name = "1개월동안 X 2주마다"; break;
case 4 : sub_name = "2개월동안 X 2주마다"; break;
case 12 : sub_name = "6개월동안 X 2주마다"; break;
case 99 : sub_name = "정기결제(2주마다 자동결제)"; break;
}

MemberBean memberDetail = (MemberBean) request.getAttribute("memberDetail");
String m_name = memberDetail.getM_name();
float g_discount = (float) request.getAttribute("g_discount"); // 등급에 따른 할인 정보 
int gradeDiscount = 0; // 등급에 따른 할인금액
int price = 0; // 단일상품금액
int totalPrice = 0; // 모든상품금액
int paymentAmount = 0; // 결제api에 넘길 금액 (모든상품금액 - 포인트 - 등급할인)

//장바구니 선택상품목록 또는 바로구매 상품 리스트
ArrayList<CartBean> checkList = (ArrayList<CartBean>) request.getAttribute("checkList");
//장바구니 선택상품목록 또는 바로구매 상품의 상품정보 리스트(순서동일)
ArrayList<ItemBean> itemList = (ArrayList<ItemBean>) request.getAttribute("itemList");
//letter.jsp에서 입력된 편지관련 정보 리스트
ArrayList<OrderDetailBean> orderFormInfo = null;
if(request.getAttribute("orderFormInfo") != null) { // 편지지가 선택되지 않으면 null 오류 발생하므로 관련코드 if문 처리
	orderFormInfo = (ArrayList<OrderDetailBean>) request.getAttribute("orderFormInfo");
}

String addLetter;// 편지가 추가되면 해당 html 추가

%>
</head>
<body>

	<!-- header -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- header -->
<div class="container">
<div class="order_insert_all"> 

	<h1 id="order_insert_title">주문/결제</h1>
	<h3 id="order_insert_title_h3">주문내역 확인</h3>
	<%
	int letterPrice;
	for(int i = 0; i < checkList.size(); i++) {
		if (checkList.get(i).getC_letter() == 1) { // 편지가 추가되면 해당 html 추가
			addLetter = "추가상품:편지<br>";
			letterPrice = 2500;
		} else {
			addLetter = "";
			letterPrice = 0;
		}
		
		cal.setTime(Date.valueOf(checkList.get(i).getC_delivery_date())); // 요일
		int dNum = cal.get(Calendar.DAY_OF_WEEK);
		String day = "";
		switch(dNum){
		case 1 : day = "일요일"; break;
		case 2 : day = "월요일"; break;
		case 3 : day = "화요일"; break;
		case 4 : day = "수요일"; break;
		case 5 : day = "목요일"; break;
		case 6 : day = "금요일"; break;
		case 7 : day = "토요일"; break;
		}

		price = ((int)(itemList.get(i).getI_price() * itemList.get(i).getI_discount() / 100) * 100 * sub_option * checkList.get(i).getC_qty()) + letterPrice; // 단일상품금액 = (원가 * 할인) * 수량 + 편지요금
		totalPrice += price; // 모든 상품의 누적 총 금액(쿠폰 및 포인트, 등급할인 제외)
	%>
	<div class="order_insert_c">
		<img src="<%=itemList.get(i).getI_img()%>">
		<p id="order_insert_pb"><%=itemList.get(i).getI_name() %>
		<span id="order_insert_span"><%=NumberFormat.getInstance().format(price) %>원</span></p>
		
		<%if(sub_name.equals("")){%>
		<p id="order_insert_p">수령일 : <%=day %>,<%=checkList.get(i).getC_delivery_date() %></p>
		<%} else {%> <!-- 정기구독 경유 접속시 표시 -->
		<p id="order_insert_p">첫 구독일 : <%=day %>,<%=checkList.get(i).getC_delivery_date() %></p>
		<p id="order_insert_p">구독내용 : <%=sub_name %></p>
		<%} %>
		<p id="order_insert_p"><%=addLetter %>
		<p id="order_insert_p">수량 : <%=checkList.get(i).getC_qty()%>개</p><br>
		<br>
	<%
	}
	gradeDiscount = ((int)(totalPrice *(1 - g_discount) / 100) * 100); // totalPrice에 등급할인 계산하여 할인금액 저장
	%>
	</div>
	<div class="order_insert_c">
	<h3 id="order_insert_title_h3">주문자 정보</h3>
	<span id="order_insert_n">이름</span><br> <span id="order_insert_inp_one"><%=m_name %></span>
	<span id="order_insert_n">전화번호</span><br> <span id="order_insert_inp_one"><%=memberDetail.getM_phone() %></span>
	</div>
	
	
	
	<form action="OrderInsertPro.od" name="order" method="post" onsubmit="defaultPoint()">
		<div class="order_insert_c">
		<h3 id="order_insert_title_h3">발신인 정보</h3>
		<span id="order_insert_n">이름</span> <input id="order_insert_inp_one" type="text" name="o_sender" value="<%=m_name%>">
		</div> <!--기본값은 회원이름, 수정시 수정이름으로 변경  -->
		
		<div class="order_insert_c">
		<h3 id="order_insert_title_h3">배송지 정보</h3>
		<div id="order_insert_i">받는분 이름</div> <input id="order_insert_inp_one" type="text" name="o_receiver" placeholder="이름을 입력해주세요.">
		<div id="order_insert_i">받는분 연락처</div><input id="order_insert_inp_one" type="text" name="o_phone">
		
		<div id="order_insert_i">우편번호 </div> 
		<input id="order_insert_btn"  type="button" onclick="sample6_execDaumPostcode()" value="찾기"><br>
		<input class="order_insert_inp_two" type="text" id="sample6_postcode" name="address1"  placeholder="우편번호 검색" readonly>
		<div id="order_insert_i">주소 </div> 
		<input class="order_insert_inp_one" type="text" id="sample6_address" name="address2"  placeholder="주소" readonly><br>
		<input class="order_insert_inp_one" type="text" id="sample6_detailAddress" name="address3"  placeholder="상세주소"><br>
		
		<div id="order_insert_b">
		<input id="order_insert_btn" type="button" value="최근배송지" onClick="window.open('OrderAddress.od', 'address', 'width=450, height=500')">
		</div>
		
		<div id="order_insert_p">
		<p>토요일 수령 선택 시 주의사항<br>
		토요일 수령을 선택하실 경우, 회사 주소는 배송이 어려워요.<br>
		자택이나 수령인이 직접 받으실 수 있는 주소지로 입력 부탁드릴게요.<br>
		</p>
		</div>
		
		</div>	
		<div class="order_insert_c">
		<h3 id="order_insert_title_h3">쿠폰/포인트</h3>
		<span id="order_insert_n">쿠폰 할인</span><br><input id="order_insert_btn" type="button" value="(미구현)"> <input id="order_insert_inp_two" type="text" placeholder="코드를 입력해주세요">
			
		<span id="order_insert_n">포인트</span><br> <input id="order_insert_inp_one" type="text" name="o_point" placeholder="0" onkeyup="pointAccept(<%=memberDetail.getM_point()%>,<%=totalPrice %>,<%=gradeDiscount%>)"><br>
		<span id="order_insert_n">현재 포인트</span><br>
		<input id="order_insert_btn" type="button" value="전액사용" onclick="pointFullAccept(<%=memberDetail.getM_point()%>, <%=totalPrice %>, <%=gradeDiscount%>)">
		<span id="order_insert_inp_two"><%=NumberFormat.getInstance().format(memberDetail.getM_point()) %></span>
		</div>
		<div class="order_insert_c">
		<h3 id="order_insert_title_h3">최종 결제 금액</h3>
		<span id="order_insert_n">총 상품 금액</span><br> <span id="mypage_orderHistoryDetail_del_span_r"><%=NumberFormat.getInstance().format(totalPrice) %> 원</span><br>
		<span id="order_insert_n">배송비</span><br> <span id="mypage_orderHistoryDetail_del_span_r">0 원</span><br>
		<span id="order_insert_n">쿠폰 할인</span><br><span id="mypage_orderHistoryDetail_del_span_r"> -0 원 (미구현)</span><br>
		<span id="order_insert_n">포인트 할인</span><br><span id="mypage_orderHistoryDetail_del_span_r">0 원</span><br>
		<span id="order_insert_n">등급 할인</span><br><span id="mypage_orderHistoryDetail_del_span_r"><%=NumberFormat.getInstance().format(gradeDiscount) %> 원</span><br>
		</div>

		<div class="order_insert_c">
		<div id="col">
		<span id="order_insert_n">총 결제 금액</span>
		<span id="order_insert_span_p"><%=NumberFormat.getInstance().format(totalPrice-gradeDiscount) %>원</span></div> 
		</div>
		
		<%
		int i;
		for (i = 0 ; i < checkList.size() ; i++){
			if(orderFormInfo != null) {
				if (checkList.get(i).getC_id() == orderFormInfo.get(i).getC_id()) {
				%>
				<input type="hidden" name="l_id<%=i %>" value="<%=orderFormInfo.get(i).getL_id()%>">
				<input type="hidden" name="c_id<%=i %>" value="<%=orderFormInfo.get(i).getC_id()%>">
				<input type="hidden" name="i_id<%=i %>" value="<%=orderFormInfo.get(i).getI_id()%>">
				<input type="hidden" name="od_qty<%=i %>" value="<%=orderFormInfo.get(i).getOd_qty()%>">
				<input type="hidden" name="od_message<%=i %>" value="<%=orderFormInfo.get(i).getOd_message()%>">
				<input type="hidden" name="od_delivery_date<%=i %>" value="<%=orderFormInfo.get(i).getOd_delivery_date()%>">
				<%
				} else {
				%>
				<input type="hidden" name="l_id<%=i %>" value="0">
				<input type="hidden" name="c_id<%=i %>" value="<%=checkList.get(i).getC_id()%>">
				<input type="hidden" name="i_id<%=i %>" value="<%=checkList.get(i).getI_id()%>">
				<input type="hidden" name="od_qty<%=i %>" value="<%=checkList.get(i).getC_qty()%>">
				<input type="hidden" name="od_message<%=i %>" value="">
				<input type="hidden" name="od_delivery_date<%=i %>" value="<%=checkList.get(i).getC_delivery_date()%>">
				<%
				}
			} else {
				%>
				<input type="hidden" name="l_id<%=i %>" value="0">
				<input type="hidden" name="c_id<%=i %>" value="<%=checkList.get(i).getC_id()%>">
				<input type="hidden" name="i_id<%=i %>" value="<%=checkList.get(i).getI_id()%>">
				<input type="hidden" name="od_qty<%=i %>" value="<%=checkList.get(i).getC_qty()%>">
				<input type="hidden" name="od_message<%=i %>" value="">
				<input type="hidden" name="od_delivery_date<%=i %>" value="<%=checkList.get(i).getC_delivery_date()%>">
				<%
			}
		}
		%>
		<input type="hidden" name="iNum" value="<%=i %>">
		<input type="hidden" name="m_id" value="<%=memberDetail.getM_id()%>"> <!-- 회원ID -->
		<input type="hidden" name="sub_option" value="<%=sub_option%>"> <!-- 정기구독 옵션 번호 -->
		<input type="hidden" name="o_amount" value="<%=totalPrice %>">
		<input type="hidden" name="o_gdiscount" value="<%=gradeDiscount %>">
		<input type="hidden" name="o_payment" value="1"> <!-- 비안씨 작업용 수정 다시 ""로 돌려놓기 -->
		<input id="order_insert_submit" type="submit" value="결제하기"> 			<!-- 비안씨 작업용 임시용 코드 삭제예정 이거지우고 밑에꺼 활성화 -->
	</form>
	</div>
		
	<form name="payfrm" method="post">
		<input type="hidden" name="m_id" value="<%=memberDetail.getM_id()%>">
		<input type="hidden" name="pay_point" value="">
		<input type="hidden" name="pay_gdiscount" value="<%=gradeDiscount %>">
		<input type="hidden" name="pay_amount" value="<%=totalPrice %>">
	</form>
	<!-- <input type="button" value="결제하기" onClick="payment_popup()" > -->
</div>

	<script type="text/javascript">
	    function defaultPoint(){ // 포인트 input 공백일 경우 오류 방지
	    	if(document.order.o_point.value == ""){
	    		document.order.o_point.value = 0;
	    	}
	    }
	    
		function payment_popup() {
			defaultPoint();
			document.payfrm.pay_point.value = document.order.o_point.value;
			window.open('', 'payment', 'width=850, height=630, top=300, left=300');
			var payform = document.payfrm;
			payform.action = "./order/payment.jsp";
			payform.target = "payment";
			payform.submit();
		}
	    
	</script>
	
	<!-- footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- footer -->
	
</body>
</html>