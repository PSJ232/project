<%@page import="java.time.LocalDate"%>
<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/mypage_memberGrade.css"
	type="text/css" />
</head>
<body>

	<%
	MemberBean memberMypageDetail = (MemberBean) request.getAttribute("memberMypageDetail");
	String m_id = (String) session.getAttribute("m_id");

	String realGrade = "";
	switch (memberMypageDetail.getG_id()) {
	case 3:
		realGrade = "BLACK";
		break;
	case 2:
		realGrade = "RED";
		break;
	case 1:
		realGrade = "GREEN";
		break;
	case 0:
		realGrade = "WHITE";
		break;
	}
	%>

	<!-- 헤더 들어가는곳 -->

	<!-- 헤더 들어가는곳 -->

	<!-- 본문들어가는 곳 -->
	<!-- 본문 메인 상단 -->

	<section id="">

		<article id=""><%=m_id%>님,<br> 오늘도 꽃같은 날이예요
		</article>

		<article id="">
			등급 정보 : <a href=""><%=realGrade%> </a>ㅣ 포인트 : <a href=""><%=memberMypageDetail.getM_point()%></a>ㅣ
			나의 구독 : <a href="">2</a>
		</article>

	</section>

	<!-- 본문 왼쪽 메뉴 -->
	<!-- 큰 메뉴 두 가지 한 번에 묶여 있음 -->
	<section id="">
		<div>
			<h2>마이꾸까</h2>
			<ul type="none">
				<li><a href="OrderMypageDetail.od">주문내역/배송조회</a></li>
				<li><a href="">나의 정기구독</a></li>
				<li><a href="">클래스 수강내역</a></li>
				<li><a href="ReviewInsertForm.rv">상품 리뷰</a></li>
			</ul>
		</div>

		<div>
			<h2>개인정보 관리</h2>
			<ul type="none">
				<li><a href="MemberUpdate.me">개인정보 수정</a></li>
				<li><a href="MemberMypageGradeDetail.me">회원등급</a></li>
				<li><a href="MemberMypagePointDetail.me">포인트</a></li>
				<li><a href="../QnaInsert.qna">1:1 문의내역</a></li>
				<li><a href="">자주묻는질문</a></li>
			</ul>
		</div>
	</section>

	<!-- 본문 내용 -->
	<article class="memberGrade_article">
		<h3 class="memberGrade_title">
			<span class="memberGrade_span">회원등급</span>
		</h3>
		<div class="memberGrade_div">
			<div class="memberGrade_div_level">
				<dl class="memberGrade_dl">
					<dd class="memberGrade_dd">
						<strong class="memberGrade_strong"><%=realGrade%></strong>
					</dd>
					<dd class="memberGrade_dd2">
						<strong class="memberGrade_strong2"> <%=m_id%>님의 <%=LocalDate.now().getMonthValue()%>월
							회원 등급은 <%=realGrade%>입니다.<br>
						</strong><span class="memberGrade_span2"> <%=LocalDate.now().getMonthValue() + 1%>월
							예상 등급은 <%=realGrade%>입니다.
						</span>
					</dd>
				</dl>
				<p class="memberGrade_p">
					<strong class="memberGrade_strong3">100,000원 추가 구매시,</strong> <span
						class="memberGrade_span3">GREEN등급으로 승급이 가능합니다 :)</span>

				</p>
				<p class="memberGrade_p2">
					<span class="memberGrade_span4"> ·최근 6개월간의 총 구매내역을 반영하여
						[발송완료] 기준으로 등급이 산정됩니다.</span><br> <span class="memberGrade_span4">·등급
						산정에 클래스 이용 내역은 반영되지 않습니다.</span><br> <span class="memberGrade_span4">·매월
						1일 새로운 등급이 부여됩니다.</span><br>
				</p>
			</div>
			<div class="memberGrade_div2">
				<div class="memberGrade_div3">
					<div class="memberGrade_div4">
						<h4 class="memberGrade_h4">등급별 혜택 안내</h4>
						<div class="memberGrade_div5">
							<table class="memberGrade_table">
								<caption class="memberGrade_caption"></caption>
								<colgroup>
									<col class="memberGrade_col" width="16%">
									<col class="memberGrade_col2" width="21%">
									<col class="memberGrade_col2" width="21%">
									<col class="memberGrade_col2" width="21%">
									<col class="memberGrade_col2" width="21%">
								</colgroup>
								<tbody>
									<tr>
										<th><span class="memberGrade_span8">회원등급</span></th>
										<td><span class="memberGrade_dt">WHITE</span></td>
										<td><span class="memberGrade_dt2">GREEN</span></td>
										<td><span class="memberGrade_dt3">RED</span></td>
										<td><span class="memberGrade_dt4">BLACK</span></td>
									</tr>
									<tr>
										<th><span class="memberGrade_span8">등급 조건<br>(구매
												금액)
										</span></th>
										<td><span class="memberGrade_span8">회원 가입 시</span></td>
										<td><span class="memberGrade_span8">10만 원 이상</span></td>
										<td><span class="memberGrade_span8">40만 원 이상</span></td>
										<td><span class="memberGrade_span8">70만 원 이상</span></td>
									</tr>
									<tr>
										<th><span class="memberGrade_span8">승급 시 혜택</span></th>
										<td><span class="memberGrade_span8">1,000포인트 적립</span></td>
										<td><span class="memberGrade_span8">3,000포인트 적립</span></td>
										<td><span class="memberGrade_span8">5,000포인트 적립</span></td>
										<td><span class="memberGrade_span8">10,000포인트 적립</span></td>
									</tr>
									<tr>
										<th><span class="memberGrade_span8">상시 혜택</span></th>
										<td><span class="memberGrade_span8"></span></td>
										<td><span class="memberGrade_span8">2% 상시 할인</span></td>
										<td><span class="memberGrade_span8">2% 상시 할인</span></td>
										<td><span class="memberGrade_span8">5% 상시 할인</span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="memberGrade_div3">
				<div class="memberGrade_div4">
					<ol class="memberGrade_ol">
						<li class="memberGrade_li">
							<dl class="memberGrade_dl2">
								<dt class="memberGrade_dt">WHITE</dt>
								<dd class="memberGrade_dd3">
									<span class="memberGrade_span5">1,000포인트 적립</span> <span
										class="memberGrade_span6">회원 가입 시</span>
								</dd>
							</dl>
						</li>
						<li class="memberGrade_li">
							<dl class="memberGrade_dl2">
								<dt class="memberGrade_dt2">GREEN</dt>
								<dd class="memberGrade_dd3">
									<span class="memberGrade_span5">3,000포인트 적립</span> <span
										class="memberGrade_span7">2% 상시 할인</span> <span
										class="memberGrade_span6">구매금액 10만 원 이상</span>
								</dd>
							</dl>
						</li>
						<li class="memberGrade_li">
							<dl class="memberGrade_dl2">
								<dt class="memberGrade_dt3">RED</dt>
								<dd class="memberGrade_dd3">
									<span class="memberGrade_span5">5,000포인트 적립</span> <span
										class="memberGrade_span7">2% 상시 할인</span> <span
										class="memberGrade_span6">구매금액 40만 원 이상</span>
								</dd>
							</dl>
						</li>
						<li class="memberGrade_li">
							<dl class="memberGrade_dl2">
								<dt class="memberGrade_dt4">BLACK</dt>
								<dd class="memberGrade_dd3">
									<span class="memberGrade_span5">10,000포인트 적립</span> <span
										class="memberGrade_span7">5% 상시 할인</span> <span
										class="memberGrade_span6">구매금액 70만 원 이상</span>
								</dd>
							</dl>
						</li>
					</ol>
				</div>
			</div>
		</div>
	</article>

	<!-- 푸터 들어가는곳 -->

	<!-- 푸터 들어가는곳 -->
</body>
</html>