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
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
MemberBean memberDetail = (MemberBean) request.getAttribute("memberDetail");
String m_name = memberDetail.getM_name();
int price = 0; // 단일상품금액

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
<body>
	<h1>주문/결제(비회원)</h1>
	<h3>주문내역 확인</h3>
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

		price = (itemList.get(i).getI_price() * checkList.get(i).getC_qty()) + letterPrice; // 단일상품금액 = (원가 * 수량) + 편지요금
	%>
		<img src="<%=itemList.get(i).getI_img()%>">
		<%=itemList.get(i).getI_name() %><br>
		<%=NumberFormat.getInstance().format(price) %><br>
		수령일:<%=checkList.get(i).getC_delivery_date() %><br>
		<%=addLetter %>
		수량:<%=checkList.get(i).getC_qty()%><br>
		<br>
	<%
	}
	%>
	
	<form action="OrderInsertPro.od" name="order" method="post">
		<h3>발신인 정보</h3>
		이름 <input type="text" name="o_sender"><br>
		<h3>휴대폰 본인 인증</h3>
		휴대폰번호 <input type="tel" name="o_visitor"><input type="button" value="인증번호 받기"><br>
		<input type="number"><input type="button" value="확인">
		<h3>배송지 정보</h3>
		받는분 이름 <input type="text" name="o_receiver" placeholder="이름을 입력해주세요."><br>
		받는분 연락처 <input type="text" name="o_phone"><br>
	
		
		우편번호 <input type="text" id="sample6_postcode" name="address1"  placeholder="우편번호 검색">
		<input type="button" onclick="sample6_execDaumPostcode()" value="찾기"><br>
		주소 <input type="text" id="sample6_address" name="address2"  placeholder="주소"><br>
		<input type="text" id="sample6_detailAddress" name="address3"  placeholder="상세주소"><br>
		
		<br>
		토요일 수령 선택 시 주의사항<br>
		토요일 수령을 선택하실 경우, 회사 주소는 배송이 어려워요.<br>
		자택이나 수령인이 직접 받으실 수 있는 주소지로 입력 부탁드릴게요.<br>
		<br>
			
		<h3>쿠폰/포인트</h3>
		쿠폰 할인 <input type="text" placeholder="코드를 입력해주세요"><input type="button" value="적용">(미구현)<br>
		<h3>최종 결제 금액</h3>
		총 상품 금액 <%=NumberFormat.getInstance().format(price) %> 원<br>
		배송비 0 원<br>
		쿠폰 할인 -0 원 (미구현)<br>
		
		<h4>총 결제 금액</h4>
		<%=NumberFormat.getInstance().format(price) %> 원
		<h3>결제 수단</h3>
		
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
		<input type="hidden" name="m_id" value="visitor"> <!-- 회원ID -->
		<input type="hidden" name="o_amount" value="<%=price %>">
		<input type="hidden" name="o_gdiscount" value="0">
		<input type="hidden" name="o_point" value="0">
		<input type="hidden" name="paymentAmount" value="<%=price %>">
		<input type="button" value="결제하기" onClick="window.open('./order/payment.jsp', 'payment', 'width=450, height=180, top=300, left=500')" > <!-- 결제 api에 따라서 변경해야됨  -->
	<br>
	<br>
	
	</form>
</body>
</html>