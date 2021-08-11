<%@page import="vo.PageInfo"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HashMap<String,Integer> qnaCount = (HashMap<String,Integer>)request.getAttribute("qnaCount");
	int currentPage = (int)request.getAttribute("page");
	String tab = "";
	if(request.getAttribute("tab") != null){
		tab = (String)request.getAttribute("tab");
	}
	System.out.println("curTab: " + tab);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 문의 목록</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="./css/admin.css">
<link rel="stylesheet" href="./css/admin_qna.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script>
	var curTab = "tab1";
	$(function() {
		
		$('.admin_header_subtitle').text("문의 목록");
		// tab operation
		$('.tabmenu').click(function() {
			var currentPage = <%=currentPage%>;
			var activeTab = $(this).attr('data-tab');
			if(curTab == "tab1" && activeTab == "tab2"){
				currentPage = 1;
				curTab = "tab2";
				$('#pageList').empty();
			}else if(curTab == "tab2" && activeTab == "tab1"){
				currentPage = 1;
				curTab = "tab1";
				$('#pageList').empty();
			}
			console.log(curTab);
			$('.tabmenu').css('background-color', '#fff');
			$(this).css('background-color', '#FFDF24');
			$.ajax("GetQnaList.ad",{
				type: "GET",
				data: {
					'activeTab': activeTab,
					'page': currentPage
				},
				dataType: "json",
				success:function(data){ 
					
					$('#tabcontent').empty();
					var result = data.result;
					for(var i=0; i < result.length; i++){
						for(var j=0; j < result[i].length; j++){
							$('#tabcontent').append("<tr><td>"+result[i][j].q_id+"</td><td width='200'>"+result[i][j].m_id+"</td><td width='250'><a href='QnaDetail.ad?q_id="+result[i][j].q_id+"'>"+result[i][j].q_subject+"</a></td width='150'><td>"+result[i][j].q_rdate+"</td></tr>");
						}
					}
					var pages = data.page[0];
					if(pages.maxPage == 1){
						
					}
					if(pages.maxPage != 1){
						if(pages.page <= 1){
							$('#pageList').append("<input class='page_btn' type='button' value='<<'> ");
						}else {
							$('#pageList').append("<input class='page_btn' type='button' value='<<' onclick='location.href=\"QnaList.ad?page="+ (pages.page-1) +"\"'> ");
						}
						for(var i = pages.startPage; i <= pages.endPage; i++){
							if(i == pages.page){
								$('#pageList').append("<span id='selected_page_num'> "+i+"</span>");
							}else {
								$('#pageList').append("<a id='page_num' href='QnaList.ad?page="+i+"&tab="+curTab+"'> " + i + " ");
							}
						}
						if(pages.page >= pages.maxPage){
							$('#pageList').append("<input class='page_btn' type='button' value='>>'>");
						}else {
							$('#pageList').append("<input class='page_btn' type='button' value='>>' onclick='location.href=\"QnaList.ad?page="+ (pages.page + 1) +"&tab="+curTab+"\"'>");
						}
						
					}
					

				},
				error:function(request,status,error){
			        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			       },
				async:false
				
			});	//getJSON
		});
		$('#'+curTab).click();
	});
</script>
</head>
<body>
<!-- 	<header> -->
	<jsp:include page="/inc/adminHeader.jsp"></jsp:include>
<!-- 	</header> -->
<!-- 	<nav> -->
	<jsp:include page="/inc/navigation.jsp"></jsp:include>
<!-- 	</nav> -->
	<div class="container">
<!-- 		<fieldset> -->
<!-- 			<legend>문의 현황</legend> -->
			<fieldset id="qna_status">
				<legend>답변현황</legend>
				<h1><span class="span">전체</span> <%=qnaCount.get("문의개수") %>건</h1>
				<h1><span class="span">미답변</span> <%=qnaCount.get("미답변") %>건</h1>
				<h1><span class="span">답변완료</span> <%=qnaCount.get("답변완료") %>건</h1> 
			</fieldset>
<!-- 		</fieldset> -->
		<ul id="qna_tab">
			<li data-tab="tab1" class='tabmenu' id="tab1">미답변</li>
			<li data-tab="tab2" class='tabmenu' id="tab2">답변완료</li>
		</ul>
		<table border=1>
			<thead>
				<tr>
				<th>순번</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일시</th>
				</tr>
			</thead>
			<tbody id="tabcontent">
			
			</tbody>
		</table>
		<section id="pageList">
		</section>
	</div>
	<footer>
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>