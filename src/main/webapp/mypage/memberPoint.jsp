<%@page import="vo.ReviewBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/mypage_memberPoint.css"
	type="text/css" />
</head>
<body>

	<%
	String m_id = (String) session.getAttribute("m_id");
	MemberBean memberMypageDetail = (MemberBean) request.getAttribute("memberMypageDetail");
	ArrayList<ReviewBean> pbList = (ArrayList<ReviewBean>) request.getAttribute("pbList");
	String division = "";
	String record = "";
	%>

	<!-- 헤더 들어가는곳 -->

	<!-- 헤더 들어가는곳 -->

	<!-- 본문들어가는 곳 -->
	<!-- 본문 메인 상단 -->

	<section id="">

		<article id=""><%=m_id%>님,<br> 오늘도 꽃같은 날이예요
		</article>

		<article id="">
			등급 정보 : <a href="MemberMypageGradeDetail.me"><%=memberMypageDetail.getG_id()%>
			</a>ㅣ 포인트 : <a href="MemberMypagePointDetail.me"><%=memberMypageDetail.getM_point()%></a>ㅣ
			나의 구독 : <a href="">2</a>
		</article>

	</section>

	<!-- 본문 왼쪽 메뉴 -->
	<!-- 큰 메뉴 두 가지 한 번에 묶여 있음 -->
  <section id="">
	<div>
  	<h2>마이꾸까</h2>
  	<ul type="none">
  		<li><a href="OrderMypageDetailList.od">주문내역/배송조회</a></li>
  		<li><a href="MypageSubscribe.od">나의 정기구독</a></li>
  		<li><a href="MyClass.me">클래스 수강내역</a></li>
		<li><a href="ReviewInsertForm.rv">상품 리뷰</a></li>
  	</ul>
 	 </div>
 	 
 	 <div>
  	 <h2>개인정보 관리</h2>
  	<ul type="none">
		<li class="list"><a href="MemberUpdate.me">개인정보 수정</a></li>
		<li class="list"><a href="MemberMypageGradeDetail.me">회원등급</a></li>
		<li class="list"><a href="MemberMypagePointDetail.me">포인트</a></li>
		<li class="list"><a href="QnaInsert.qna">1:1 문의내역</a></li>
		<li class="list"><a href="QnaList.qna">QNA리스트</a></li>
		<li class="list"><a href="Faq.me">자주묻는질문</a></li>
  	</ul>
  	</div>
	</section>
	
	<!-- 본문 내용 -->
	<article class="memberPoint_article">
		<h3 class="memberPoint_h3">
			<span class="memberPoint_span">포인트</span>
		</h3>
		<div class="memberPoint_div">
			<dl class="memberPoint_dl">
				<dt class="memberPoint_dt">현재 사용가능한 적립금</dt>
				<dd class="memberPoint_dd">1,000원</dd>
			</dl>
			<div class="memberPoint_div2">
				<div class="memberPoint_div3">
					<div class="memberPoint_div4">
						<h4 class="memberPoint_h4">포인트 이용내역</h4>
					</div>
					<div class="memberPoint_div5">
						<div class="memberPoint_div6">
							<table border="1" class="memberPoint_table">
								<caption class="memberPoint_caption"></caption>
								<colgroup>
									<col width="25%">
									<col width="25%">
									<col>
									<col width="34%">
								</colgroup>
								<thead>
									<tr>
										<th><span class="memberPoint_span2">날짜</span></th>
										<th><span class="memberPoint_span2">구분</span></th>
										<th><span class="memberPoint_span2">내역</span></th>
										<th><span class="memberPoint_span2">적립금</span></th>
									</tr>
								</thead>
								<%
								for (int i = 0; i < pbList.size(); i++) {

									if (pbList.get(i).getR_point() == 200) {
										division = "적립";
									} else if (pbList.get(i).getR_point() == 300) {
										division = "적립";
									} else {
										division = "사용";
									}

									if (pbList.get(i).getR_point() == 200) {
										record = "리뷰 작성(사진 미포함)";
									} else if (pbList.get(i).getR_point() == 300) {
										record = "리뷰 작성(사진 포함)";
									} else {
										record = "포인트 사용";
									}
								%>
								<tbody>
								<tr>
									<td><span><%=pbList.get(i).getR_rdate()%></span></td>
									<td><span class="memberPoint_span3"><%=division%></span></td>
									<td><span class="memberPoit_span4"><%=record%></span></td>
									<td><span><%=pbList.get(i).getR_point()%></span></td>
								</tr>
								</tbody>
								<%
								}
								%>
								<tbody>
								<tr>
									<td><%=memberMypageDetail.getM_rdate()%></td>
									<td class="memberPoint_span3">적립</td>
									<td class="memberPoit_span4">회원 가입 감사 적립금</td>
									<td>1000</td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</article>


	<!-- 푸터 들어가는곳 -->

	<!-- 푸터 들어가는곳 -->
</body>
</html>

