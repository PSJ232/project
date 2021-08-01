<%@page import="vo.OrderBean"%>
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
<%
// String m_id = (String) session.getAttribute("m_id");
%>


<!-- 헤더 들어가는곳 -->
<!-- <header> -->
<%-- 	<jsp:include page="../inc/header.jsp"></jsp:include> --%>
<!-- </header> -->
<!-- 헤더 들어가는곳 -->

<body>
	
	<div class="mypage_all">
		<div class="mypage_top">
			<div class="mypage_banner">

				<h4 id="mypage_user_name">
					<strong>ooo 님,</strong><br> <span>오늘도 꽃같은 날이예요</span>
				</h4>

				<div class="mypage_top_right_c">
					<div id="mypage_top_right_i">
						<dl id="mypage_top_dl">
							<dt id="mypage_top_dt">등급정보</dt>
							<dd id="mypage_top_dd">
								white<a href="MemberMypageGradeDetail.me" id="grade"> </a>
							</dd>
						</dl>
						<dl id="mypage_top_dl">
							<dt id="mypage_top_dt">포인트</dt>
							<dd id="mypage_top_dd">
								0 <a href="MemberMypagePointDetail.me" id="point"> </a>
							</dd>
						</dl>
						<dl id="mypage_top_dl">
							<dt id="mypage_top_dt">나의구독</dt>
							<dd id="mypage_top_dd">
								2 <a href="" id="myinfo"></a>
							</dd>
						</dl>
					</div>
				</div>
			</div>
		</div>
	
	
	
	
	
	
	
	
	<div class="qna_insert_all">
		<div id="qna_insert_i">
			<h1 id="qna_insert_title">
				1:1문의 작성
				<spen id="qna_insert_title_spen">꾸까 고객센터 1661-1031</spen>
			</h1>
			
			<form action="QnaInsertPro.qna" method="post" name="qnaForm" enctype="multipart/form-data">
				<label id="qna_insert_th">
				 <input id="qna_insert_inp" type="hidden" name="m_id" value=""></label>
				<%-- 		<%m_id%>  --%>
				<label id="qna_insert_th"> 주문 상품 선택
				<input id="qna_insert_order_td" type="text" name="o_id" id="oid" readonly>
				<input id="qna_insert_order_btn" type="button" value="주문 조회" onclick=""></label><br>
				<!-- 			"window.open('QnaOrderList.qna','qnaOrderList','width=450,height=500')" -->
				<label id="qna_insert_th">제목 
				<input id="qna_insert_subject_td" type="text" name="q_subject" placeholder="제목을 입력해주세요."></label><br> 
				<label id="qna_insert_th"> 내용<br> 
				<textarea id="qna_insert_contents_td" cols="70" rows="15" name="q_content" placeholder="내용을 작성해주세요:)"></textarea></label> <br>
				<p id="qna_insert_p">- 게시판 성격에 맞지 않는 글의 경우, 게시가 중단될 수 있습니다.</p>
				<br>
				<h3>사진 첨부</h3>
				<div id="qna_insert_ul">
					<input id="qna_insert_li" type="text" name="q_text"> 
					<label class="input-file-button" for="qna_insert_li_inp"> 사진첨부</label>
					<input id="qna_insert_li_inp" type="file" name="q_img" value="사진 첨부">
					
					<input id="qna_insert_li" type="text" name="q_text2"> 
					<label class="input-file-button" for="qna_insert_li_inp"> 사진첨부</label>
					<input id="qna_insert_li_inp" type="file" name="q_img2" value="사진 첨부">
					
					<input id="qna_insert_li" type="text" name="q_text3"> 
					<label class="input-file-button" for="qna_insert_li_inp"> 사진첨부</label>
					<input id="qna_insert_li_inp" type="file" name="q_img3" value="사진 첨부">
				</div>
				<br>
					<p id="qna_insert_p2">- ( 5mb, 3장 첨부가능 )</p>
				<br> 
				<input id="qna_insert_submit" type="submit" value="등록하기">
			</form>
		</div>
	</div>




		<section class="mypage_left_section">
			<div id="mypage_left_menu">
				<h2 id="mypage_left_title">마이꾸까</h2>
				<ul id="mypage_menu_list">
					<li id="mypage_list"><a id="mypage_list_a"
						href="OrderMypageDetailList.od">주문내역/배송조회</a></li>
					<li id="mypage_list"><a id="mypage_list_a" href="">나의 정기구독</a></li>
					<li id="mypage_list"><a id="mypage_list_a" href="">클래스
							수강내역</a></li>
					<li id="mypage_list"><a id="mypage_list_a"
						href="ReviewInsertForm.rv">상품 리뷰</a></li>
				</ul>
			</div>

			<div id="mypage_left_menu">
				<h2 id="mypage_left_title">개인정보 관리</h2>
				<ul id="mypage_menu_list">
					<li id="mypage_list"><a id="mypage_list_a"
						href="MemberUpdate.me">개인정보 수정</a></li>
					<li id="mypage_list"><a id="mypage_list_a"
						href="MemberMypageGradeDetail.me">회원등급</a></li>
					<li id="mypage_list"><a id="mypage_list_a"
						href="MemberMypagePointDetail.me">포인트</a></li>
					<li id="mypage_list"><a id="mypage_list_a"
						href="QnaInsert.qna">1:1 문의내역</a></li>
					<li id="mypage_list"><a id="mypage_list_a"
						href="MemberMypageFAQList.me">자주묻는질문</a></li>
				</ul>
			</div>
		</section>

	</div>




	<!-- 푸터 들어가는곳 -->
<!-- 	<footer> -->
<%-- 		<jsp:include page="/inc/footer.jsp"></jsp:include> --%>
<!-- 	</footer> -->
	<!-- 푸터 들어가는곳 -->


</body>
</html>