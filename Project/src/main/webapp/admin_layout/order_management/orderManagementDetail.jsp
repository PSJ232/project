<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ֹ�������</title>
<style>
	.container #delivery_info label, #payment_info label {
		width: 150px; 
		display: inline-block;
	}
	
	.container #product_list,#payment_info {
		display: inline-block;
		width: 400px;
	}
	#product_list table {
		width: 450px;
	}
	
	.sub_container {
		display: flex;
		
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="../partial/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="../partial/nav.jsp"></jsp:include>
	</nav>
	<div class="container">
		<h1>Order Detail</h1>
		<div id="delivery_info">
			<h3>����� ����</h3>
			<label>�ֹ���</label><input type="text" value="ȫ�浿">
			<label>�ֹ��� ��ȭ��ȣ</label><input type="text" value="010-0000-0000"><br>
			<label>�޴���</label><input type="text" value="��浿">
			<label>�޴��� ��ȭ��ȣ</label><input type="text" value="010-0000-0000"><br>
			<label>�ּ�</label><input type="text" value="�λ걤���� ������"> <label>���ּ�</label><input type="text" value="oo����Ʈ oo�� ooȣ"><br>
			<label>��û �����</label><input type="text" value="2021-07-11"><br>
			<label>��۽� ��û����</label><input type="text" value="���տ��ΰ��ּ���">
		</div>
		<div class="sub_container">
		<div id="payment_info">
			<h3>���� ����</h3>
			<label>�� ��ǰ�ݾ�</label><input type="text" value="50000"><br>
			<label>���αݾ�</label><input type="text" value="5000"><br>
			<label>�����ݻ��</label><input type="text" value="3000"><br>
			<label>��������</label><input type="text" value="ī��"><br>
			<label>���������ݾ�</label><input type="text" value="42000">
		</div>
		<div id="product_list">
			<h3>��ǰ ����Ʈ</h3>
			<table border="1">
				<tr><th>no</th><th>product</th></tr>
				<tr><td>1</td><td>��ǰ1</td></tr>	
				<tr><td>1</td><td>��ǰ1</td></tr>	
				<tr><td>1</td><td>��ǰ1</td></tr>	
				<tr><td>1</td><td>��ǰ1</td></tr>	
			</table>
		</div>
		</div>
	</div>
	<footer>
		<jsp:include page="../partial/footer.jsp"></jsp:include>
	</footer>
</body>
</html>