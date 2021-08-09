<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#btn_no {
	width: 193px;
	height: 52px;
	opacity: 0%;
	position: absolute;
	top: 106px;
	left: 257px;
}
#btn_yes {
	width: 193px;
	height: 52px;
	opacity: 0%;
	position: absolute;
	top: 106px;
	left: 54px;
}

button {
	cursor: pointer;
}
</style>
<script type="text/javascript">
function go_cart(){
	window.opener.location = "/project/Cart.cr";
	window.close();
}
</script>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<img src="../img/cart_popup_img.png">
	<button id="btn_yes" onclick="window.close()">쇼핑 계속하기</button>
	<button id="btn_no" onclick="go_cart()">장바구니 이동</button>
</body>
</html>
