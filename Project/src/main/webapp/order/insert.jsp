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
ItemBean itemDetail = (ItemBean) request.getAttribute("itemDetail");
MemberBean memberDetail = (MemberBean) request.getAttribute("memberDetail");
String m_name = memberDetail.getM_name();
int price = (int)(itemDetail.getI_price() * itemDetail.getI_discount()); // 관리자팀에게 반올림 기준과 수식 통일 요청

%>
<body>
	<h1>주문/결제</h1>
	<h3>주문내역 확인</h3>
	
	<%=itemDetail.getI_name() %><br>
	수령일:<br>
	편지지:<%=request.getParameter("l_id") %><br>
	수량:<%=request.getParameter("od_qty") %><br>
	
	
	<h3>주문자 정보</h3>
	이름 : <%=m_name %><br>
	전화번호 : <%=memberDetail.getM_phone() %><br>
	<form action="OrderInsertPro.od" method="post">
		<h3>발신인 정보</h3>
		이름 <input type="text" name="o_sender" value="<%=m_name%>"><br> <!--기본값은 회원이름, 수정시 수정이름으로 변경  -->
		<h3>배송지 정보</h3>
		받는분 이름 <input type="text" name="o_receiver" placeholder="이름을 입력해주세요."><br>
		(받는분이 입력이라는 기능있음(구현여부미정))<br>
		받는분 연락처 <input type="text" name="o_phone"><br>
	
	
		
		우편번호 <input type="text" id="sample6_postcode" name="address1"  placeholder="우편번호 검색">
		<input type="button" onclick="sample6_execDaumPostcode()" value="찾기"><br>
		주소 <input type="text" id="sample6_address" name="address2"  placeholder="주소"><br>
		<input type="text" id="sample6_detailAddress" name="address3"  placeholder="상세주소">
	
			<p>토요일 수령 선택 시 주의사항<br>
			토요일 수령을 선택하실 경우, 회사 주소는 배송이 어려워요.<br>
			자택이나 수령인이 직접 받으실 수 있는 주소지로 입력 부탁드릴게요.</p>
			
		<h3>쿠폰/포인트</h3>
		쿠폰 할인 <input type="text" placeholder="코드를 입력해주세요"><input type="button" value="적용"><br>
		포인트 <input type="text" name="o_point" value="0"><input type="button" value="적용"><br>
		현재 포인트:<%=memberDetail.getM_point() %>
		<h3>최종 결제 금액</h3>
		<h3>결제 수단</h3>
		
		<input type="hidden" name="od_message" value="<%=request.getParameter("od_message")%>"> <!-- 편지지4번 직접메세지 -->
		<input type="hidden" name="l_id" value="<%=request.getParameter("l_id") %>"> <!-- 편지지 선택 번호 -->
		<input type="hidden" name="od_qty" value="<%=request.getParameter("od_qty") %>"> <!-- 상품 주문 수량 -->
		<input type="hidden" name="m_id" value="<%=memberDetail.getM_id()%>"> <!-- 회원ID -->
		<input type="hidden" name="o_amount" value="<%=price%>"> <!-- 할인율 반영된 가격 -->
		<input type="submit" value="결제하기">
	<br>
	<br>
	
	</form>
</body>
</html>