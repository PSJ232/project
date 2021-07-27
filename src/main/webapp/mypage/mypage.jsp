<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/mypage.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

</head>
<body>

	<!-- 헤더 들어가는곳 -->
	<header>
		<jsp:include page="../inc/header.jsp"></jsp:include>
	</header>
	<!-- 헤더 들어가는곳 -->

	<!-- 본문들어가는 곳 -->
	<!-- 본문 메인 상단 -->
	
		<div id="all">
			<div id="mytop">

				<h4 id="username">
					<strong>ooo님,</strong><br> <span>오늘도 꽃같은 날이예요</span>
				</h4>

				<div id="righttop">
					<div id="rightback">
						<dl>
							<dt>등급정보</dt>
							<dd id="grade">
								WHITE <a href="" id="grade"> </a>
							</dd>
						</dl>
						<dl>
							<dt>포인트</dt>
							<dd id="grade">
								1000 <a href="" id="point"> </a>
							</dd>
						</dl>
						<dl>
							<dt>나의구독</dt>
							<dd id="grade">
								0 <a href="" id="myinfo"></a>
							</dd>
						</dl>
					</div>
				</div>
			</div>



			<div id="topcenter">

				<h4 id="subject">
					<span id="osubject">주문 / 배송 조회</span> <span id="nsubject">(최근
						1개월)</span>
				</h4>


				<div id="center">
					<dl>
						<dt id="pay">0</dt>
						<dd id="pay">
							결제대기 <a href=""> </a>
						</dd>
					</dl>
					<dl>
						<dt id="pay">0</dt>
						<dd id="pay">
							결제완료 <a href=""> </a>
						</dd>
					</dl>
					<dl>
						<dt id="pay">0</dt>
						<dd id="pay">
							상품준비중<a href=""></a>
						</dd>
					</dl>
					<dl>
						<dt id="pay">0</dt>
						<dd id="pay">
							발송완료<a href=""></a>
						</dd>
					</dl>
				</div>
			</div>








			<!-- 본문 왼쪽 메뉴 -->
			<!-- 큰 메뉴 두 가지 한 번에 묶여 있음 -->
			<section class="menu">
				<div class="leftmenu">
					<h2>마이꾸까</h2>
					<ul class="menulist">
						<li class="list"><a href="">주문내역/배송조회</a></li>
						<li class="list"><a href="">나의 정기구독</a></li>
						<li class="list"><a href="">클래스 수강내역</a></li>
						<li class="list"><a href="">상품 리뷰</a></li>
					</ul>
				</div>

				<div class="leftmenu">
					<h2>개인정보 관리</h2>
					<ul class="menulist">
						<li class="list"><a href="">개인정보 수정</a></li>
						<li class="list"><a href="">회원등급</a></li>
						<li class="list"><a href="">포인트</a></li>
						<li class="list"><a href="">1:1 문의내역</a></li>
						<li class="list"><a href="">자주묻는질문</a></li>
					</ul>
				</div>
			</section>
		</div>

		<div id="omain">
			<div>
				<h3>나의 주문내역</h3>
				<dl>
					<dt>Flower Subscriptions</dt>
					<dd>2주에 한번, 소중한 나를 위한 행복으로 채워보세요!</dd>
					<dd>꾸까 꽃 정기구독</dd>
					<dd>
						<input id="obtn" type="button" value="보러가기">
					</dd>
				</dl>
			</div>
		</div>





	<!-- 본문 내용 -->

	<!-- 푸터 들어가는곳 -->
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
	<!-- 푸터 들어가는곳 -->
</body>
</html>