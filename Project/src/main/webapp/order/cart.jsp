<%@page import="java.text.NumberFormat"%>
<%@page import="svc.ItemDetailService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.CartBean"%>
<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function qtyUpdate(c_id, i_inven, c_qty){ // 버튼을 누르면 증감 수행, 재고수량보다 많이 담을 경우 더 이상 담을 수 없다고 정보 표시함
	if(i_inven > c_qty) {
    	document.getElementById('cartNotice'+c_id).innerHTML = "";
    	location.href="CartUpdatePro.cr?c_id="+c_id+"&add=1";
	} else {
		document.getElementById('cartNotice'+c_id).innerHTML = "- 해당 상품의 최대 구매 가능한 수량은 " + i_inven + "개 입니다.";
	}
}
</script>
</head>
<%
ArrayList<CartBean> cartList = (ArrayList<CartBean>) request.getAttribute("cartList"); //장바구니에서 가져온 목록
ArrayList<ItemBean> itemList = (ArrayList<ItemBean>) request.getAttribute("itemList"); //장바구니에 담긴 아이템의 목록(위 장바구니 ArrayList와 순서동일)
String cookie_check = request.getHeader("Cookie");
// if(cookie_check != null){
// 	if(cartList == null){
// 		Cookie[] cookies = request.getCookies();
// 		for(Cookie cookie : cookies) {
// 			if(cookie.getName().equals("cartList")) {
// 				cartList = (ArrayList<CartBean>) cookie.getValue();
// 			}
// 		}
// 	}
// }


%>
<body>
	<h2>장바구니</h2>
	<form action="OrderCart.od" method="post">
		<table border="1">
			<tr>
				<td><input type="checkbox">상품정보</td>
				<td>추가상품</td>
				<td>합계금액</td>
			</tr>
			<%
			if (cartList.size() != 0) { // 장바구니 목록이 비어있는지 확인하여 화면을 선택 표시
				int totalAmount = 0; // 총 합계 금액 저장할 변수
				int i;
				for (i = 0; i < cartList.size(); i++) {// 장바구니와 아이템의 ArrayList에서 필요 정보 반복 추출
					String i_img = itemList.get(i).getI_img(); //상품 이미지
					String i_name = itemList.get(i).getI_name(); //상품 이름
					String delivery_date = cartList.get(i).getC_delivery_date(); //상품 배송 요청일
					int i_price = (int)(itemList.get(i).getI_price() * itemList.get(i).getI_discount() / 100) * 100; //상품(할인) 가격, 강제형변환으로 10원단위 절삭함
					int c_qty = cartList.get(i).getC_qty(); // 상품 수량
					int c_letter = cartList.get(i).getC_letter(); //편지지 선택 여부
					int c_id = cartList.get(i).getC_id(); // 장바구니 상품 번호 
					int i_inven = itemList.get(i).getI_inven();
	
					int letterPrice = 0; // 편지지 추가에 따른 추가요금
					String letter = ""; // 편지지가 선택되면 추가상품에 보이고, 선택되지 않으면 안보임(널스트링)
					if (c_letter == 1) { // 편지지가 1이면 2500원 추가, 0이면 선택안함
						letterPrice = 2500;
						letter = "편지 2,500원";
					}
	
					int sumAmount = i_price * c_qty + letterPrice; //각 상품에 대한 합계금액
	
					totalAmount += sumAmount; // 각 상품에 대한 합계금액을 누적한 총 합계금액
			
			%>
			<tr>
				<td><input type="checkbox" name="c_id<%=i %>" value="<%=c_id %>" checked><img src="<%=i_img%>"><br>
					<%=i_name%><input type="button" value="x" onclick="location.href='CartDeletePro.cr?c_id=<%=c_id%>'"><br>
					수령일:<%=delivery_date%><br>
					<%=NumberFormat.getInstance().format(i_price) %>원<br>
					<input type="button" value="-" onclick="location.href='CartUpdatePro.cr?c_id=<%=c_id%>&add=-1'"> 
					<%=c_qty%> 
					<input type="button" value="+" onclick="qtyUpdate(<%=c_id%>, <%=i_inven%>, <%=c_qty%>)"> <br>
					<span id="cartNotice<%=c_id%>"></span>
				</td>
				<td>
					<%=letter%>
					<%if (c_letter == 1){%><input type="button" value="x" onclick="location.href='CartUpdatePro.cr?c_id=<%=c_id%>&letter=0'"><%}%>
				</td>
				<td>
					<%=NumberFormat.getInstance().format(sumAmount)%>원<br> 무료배송
				</td>
			</tr>
			<%
			}
			%>
		</table>


		구매 전 확인해주세요.<br>
		- 구매 금액 합산이 30,000원 이상일 경우, 배송비는 무료입니다.(단,[정기구독],[무료배송] 상품은 구매금액 합산에 포함되지 않습니다.)<br>
		- [정기구독] 상품의 첫 번째 발송일에 일반 택배 상품을 함께 구매하실 경우,중복 배송비는 부분 환불 처리해 드립니다.<br>
		<hr>
	
		총 주문금액 <%=totalAmount %> 원 + 배송비 0원 = 총 결제 금액 <%=totalAmount %>원 (체크하면 금액계산되는 기능 구현 필요)<br> 
		
		<input type="hidden" name="iNum" value="<%=i %>">
		<input type="submit" value="구매하기">
	</form>
	
	<%
	} else {
	%>
	</table></form> <!-- if문안에서 태그가 짤려서 추가 -->
	장바구니가 비어있습니다.<br>
	그 계절 가장 이쁜 꽃으로 행복을 채워보세요.<br>
	
	<input type="button" value="쇼핑하러 가기" onclick="location='./'">
	
	
	<%
	}
	%>
	
	<br><br><br>
	<hr>
	<form action="CartInsertPro.cr" method="post">
		- 장바구니 담기 테스트 용 input -<br>
		아이템ID<input type="number" name="i_id" value=""> (백업DB기준 1-4번샘플상품있음)<br>
		수량<input type="number" name="c_qty" value=""><br>
		편지추가<input type="radio" name="c_letter" value="1" checked>추가할게요(2,500원)<input type="radio" name="c_letter" value="0">추가하지 않을게요<br>
		배달요청일<input type="date" name="c_delivery_date"><br>
		<input type="submit" value="장바구니담기">
	</form>
	
	<br><br><br>
	<hr>
	<form action="CartInsertPro.cr" method="post">
		- 장바구니 담기(비회원) 테스트 용 input -<br>
		아이템ID<input type="number" name="i_id" value=""> (백업DB기준 1-4번샘플상품있음)<br>
		수량<input type="number" name="c_qty" value=""><br>
		편지추가<input type="radio" name="c_letter" value="1" checked>추가할게요(2,500원)<input type="radio" name="c_letter" value="0">추가하지 않을게요<br>
		배달요청일<input type="date" name="c_delivery_date"><br>
		<input type="submit" value="장바구니담기">
	</form>
	<br><br><br><br><br>
</body>
</html>