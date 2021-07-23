<%@page import="vo.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function addressSelect(a) {
		var info = a.split(',');
		opener.document.order.o_receiver.value = info[0];
		opener.document.order.o_phone.value = info[1];
		opener.document.order.address1.value = info[2];
		opener.document.order.address2.value = info[3];
		opener.document.order.address3.value = info[4];

		window.close();
	}
</script>
<%
ArrayList<OrderBean> orderList = (ArrayList<OrderBean>) request.getAttribute("orderList");
%>
</head>
<body>
	<h2>배송지 선택</h2>
	<form name="addressList" onsubmit="addressSelect(selectAddress.value)">
		<table border="1">
			<%
			OrderBean ob = null;
			int j = 0;
			int i = 0;
			if (orderList.size() > 6) j = orderList.size() - 5;
			for (i = orderList.size(); i > j;) { // 최근주소지가 위로 오도록 내림차순으로 정렬, 최근 5개만 표시
				i--;
				ob = new OrderBean();
				ob = orderList.get(i);
				String o_receiver = ob.getO_receiver();
				String o_phone = ob.getO_phone();
				String customPhone = ob.getO_phone().substring(0, 3) + "-" + ob.getO_phone().substring(3, 7) + "-" + ob.getO_phone().substring(7, 11); // 전화번호
				String[] address = ob.getO_address().split("&");
			%>

			<tr>
				<td><input type="radio" name="selectAddress"
					value="<%=o_receiver%>,<%=o_phone%>,<%=address[0]%>,<%=address[1]%>,<%=address[2]%>">
					<%=o_receiver%>,<%=customPhone%><br>
					[<%=address[0]%>] <%=address[1]%> <%=address[2]%>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<input type="submit" value="변경">
	</form>

</body>
</html>