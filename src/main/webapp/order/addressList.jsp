<%@page import="vo.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사계 | 최근 배송지</title>
<link rel="stylesheet" href="css/order_addressList.css" type="text/css" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
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
	<div class="address_container">	
	
		<div class="page_title">
			<span class="title">배송지 선택</span>
		</div>
		
		<div class="address_content_box">
			<div class="inbox">	
				<div class="inner">
					<form name="addressList" onsubmit="addressSelect(selectAddress.value)">
						<div class="add_form">
							<div class="address_list">
								<table>
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
						// 				String customPhone = ob.getO_phone().substring(0, 3) + "-" + ob.getO_phone().substring(3, 7) + "-" + ob.getO_phone().substring(7, 11); // 전화번호 "-"넣기
										String[] address = ob.getO_address().split("&");
									%>
					
								<tr>
									<td><input type="radio" name="selectAddress" class="address_radiobtn"
										value="<%=o_receiver%>,<%=o_phone%>,<%=address[0]%>,<%=address[1]%>,<%=address[2]%>">
										<%=o_receiver%>,<%=o_phone%><br>
										[<%=address[0]%>] <%=address[1]%> <%=address[2]%>
									</td>
								</tr>
								<%
								}
								%>
							</table>							
						</div>
							
					<div class="address_submit_area">
						<input type="submit"  class="btn_submit" value="변경">
					</div>			
							
						</div>
					</form>			
				</div>
			</div>
		</div>
		
		
	</div>
	
</body>
</html>