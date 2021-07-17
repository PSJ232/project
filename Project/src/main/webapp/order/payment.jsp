<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	function payment(){
		window.opener.order.submit();
		self.close();
	}
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
결제창 API<br>

전달되는 값?<br>
가맹점이름 : KUKKA<br>
상품명 : <br>
결제금액 :<br>


<input type="button" value="결제완료" onclick="payment()">
</body>
</html>