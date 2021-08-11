<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="vo.ItemBean"%>
<%@page import="svc.ItemDetailService"%>
<%@page import="vo.CartBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사계 | 주문/결제</title>
<link rel="stylesheet" href="./css/letter.css" type="text/css" />
<link rel="stylesheet" href="css/style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<%
ArrayList<CartBean> checkList = (ArrayList<CartBean>) request.getAttribute("checkList"); //장바구니에서 가져온 목록
ArrayList<ItemBean> itemList = (ArrayList<ItemBean>) request.getAttribute("itemList"); //장바구니에 담긴 아이템의 목록(위 장바구니 ArrayList와 순서동일)
Calendar cal = Calendar.getInstance();
String sub_name = "";
int sub_option = 1;
if (request.getParameter("sub_option") != null) { // 정기구독 옵션정보가 있을 경우
	sub_option = Integer.parseInt(request.getParameter("sub_option"));
}
switch (sub_option) {
case 2:
	sub_name = "1개월동안 X 2주마다";
	break;
case 4:
	sub_name = "2개월동안 X 2주마다";
	break;
case 12:
	sub_name = "6개월동안 X 2주마다";
	break;
case 24:
	sub_name = "12개월동안 X 2주마다";
	break;
}
%>
<body>

	<!-- header -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- header -->

	<div class="letter_div">
		<h2 class="letter_h2">주문/결제</h2>
		<div class="letter_div3">
			<div class="letter_div4">
				<form action="OrderLetter.od" id="letter_frm" method="post" onsubmit="return content_empty_check()">
				<div class="letter_div5">
					<div class="letter_div6">
						<h5 class="letter_h5">
							<span class="letter_span">
								편지 작성
								<b class="letter_b">(<%=request.getParameter("letterCount")%>)</b>
							</span>
							<span class="letter_span2"></span> <!-- 이거뭐지?????  -->
						</h5>
						<div class="letter_div7">
							<div class="letter_div8">
								<article class="letter_article">
									<div class="letter_div9">
									
										<%
										int i; // for문 돌때 각각의 주문구분번호 부여
										for (i = 0; i < checkList.size(); i++) { // 장바구니와 아이템의 ArrayList에서 필요 정보 반복 추출
											String i_img = itemList.get(i).getI_img(); //상품 이미지
											String i_name = itemList.get(i).getI_name(); //상품 이름
											String delivery_date = checkList.get(i).getC_delivery_date(); //상품 배송 요청일
											int c_letter = checkList.get(i).getC_letter(); //편지지 선택 여부
											int i_id = itemList.get(i).getI_id(); //상품 번호
											int c_qty = checkList.get(i).getC_qty(); //상품 수량
											int c_id = checkList.get(i).getC_id(); //장바구니 번호

											cal.setTime(Date.valueOf(checkList.get(i).getC_delivery_date())); // 요일
											int dNum = cal.get(Calendar.DAY_OF_WEEK);
											String day = "";
											switch (dNum) {
												case 1:
													day = "일요일";
													break;
												case 2:
													day = "월요일";
													break;
												case 3:
													day = "화요일";
													break
													;
												case 4:
													day = "수요일";
													break;
												case 5:
													day = "목요일";
													break;
												case 6:
													day = "금요일";
													break;
												case 7:
													day = "토요일";
													break;
											}

										if (c_letter == 1) { //편지 선택함
										%>
										<span class="letter_span20"></span> <!--이건 또 뭐지??  -->
										<img src="./admin_layout/upload/<%=i_img%>" class="letter_img">
										<span class="letter_span3"></span> <!--이건 또 뭐지??  -->
										<div class="letter_div10">
											<span class="letter_span4"></span> <!--이건 또 뭐지??  -->
											<span class="letter_span5"><%=i_name%></span>
											
											<span class="letter_span6">
												<span class="letter_span7">
												<%
												if (sub_name.equals("")) {
												%>
												
												<span class="letter_span8">수령일 : <%=day%>, <%=delivery_date%></span><br>
												<%
												} else {
												%> <!-- 정기구독 경유 접속시 표시 --> 
												<span class="letter_span8">첫 구독일 : <%=day%>, <%=delivery_date%></span><br> 
												<span class="letter_span8">구독내용 : <%=sub_name%></span><br> 
												<%
												}
												%> 
												<span class="letter_span9">추가상품 : 편지</span>
												</span><br>
											</span><br>
										
										</div>
									</div>

									<div class="letter_div11">
										<div class="letter_div12">
											<ul class="letter_ul">
												<li class="letter_li letter_div13<%=i%>" id="letter_div13<%=i%>" data-tab="tab-1<%=i%>">
													<label class="letter_label">
														<input type="radio" class="letter_input" name="l_id<%=i%>" value=1> 
														<span class="letter_span10"> 
															<b></b> <!-- 이건뭐지? -->
														</span> 
														<span class="letter_span11">감사</span>
													</label>
												</li>
												<li class="letter_li letter_div13<%=i%>" id="letter_div13<%=i%>" data-tab="tab-2<%=i%>">
													<label class="letter_label">
														<input type="radio" class="letter_input" name="l_id<%=i%>" value=2> 
														<span class="letter_span12"> 
															<b></b> <!-- 이건뭐지? -->
														</span> 
														<span class="letter_span11">응원</span>
													</label>
												</li>
												<li class="letter_li letter_div13<%=i%>" id="letter_div13<%=i%>" data-tab="tab-3<%=i%>">
													<label class="letter_label">
														<input type="radio" class="letter_input" name="l_id<%=i%>" value=3> 
														<span class="letter_span13"> 
															<b></b> <!-- 이건뭐지? -->
														</span> 
														<span class="letter_span11">사랑</span>
													</label>
												</li>
												<li class="letter_li current letter_div13<%=i%>" id="letter_div13<%=i%>" data-tab="tab-4<%=i%>">
													<label class="letter_label">
														<input type="radio" class="letter_input" name="l_id<%=i%>" value=4 checked> 
														<span class="letter_span14">
															<b></b><!-- 이건뭐지? -->
														</span>
														<span class="letter_span11">직접쓰기</span>
													</label>
												</li>
											</ul>
										</div>
										<div id="tab-1<%=i%>" class="letter_div13 letter_div13<%=i%>">
											<div class="letter_div14">
												<span class="letter_span15"> 
													<img src="https://kukka-2-media-123.s3.amazonaws.com/static/kukkart_new/img/kukka/letter_thank_cover.png" class="letter_img2">
												</span> 
												<strong class="letter_strong">앞면</strong>
												<div class="letter_div15">
													<div class="letter_div16">
														<div class="letter_div17">
															<div class="letter_div18">
																<span class="letter_span16"> 고마운 마음,<br>
																	잊지않고 오래오래 기억할게요.
																</span>
															</div>
														</div>
													</div>
													<strong class="letter_strong">안쪽면(감사메시지)</strong>
												</div>
											</div>
										</div>
										
										<div id="tab-2<%=i%>" class="letter_div13 letter_div13<%=i%>">
											<div class="letter_div14">
												<span class="letter_span15">
													<img src="https://kukka-2-media-123.s3.amazonaws.com/static/kukkart_new/img/kukka/letter_cheer_cover.png" class="letter_img2">
												</span> 
												<strong class="letter_strong">앞면</strong>
												<div class="letter_div15">
													<div class="letter_div16">
														<div class="letter_div17">
															<div class="letter_div18">
																<span class="letter_span16"> 당신의 꽃길을 응원해요.<br>
																		앞으로도 우리 꽃길만 걸어요.
																</span>
															</div>
														</div>
													</div>
													<strong class="letter_strong">안쪽면(응원메시지)</strong>
												</div>
											</div>
										</div>
										
										<div id="tab-3<%=i%>" class="letter_div13 letter_div13<%=i%>">
											<div class="letter_div14">
												<span class="letter_span15"> 
													<img src="https://kukka-2-media-123.s3.amazonaws.com/static/kukkart_new/img/kukka/letter_love_cover.png" class="letter_img2">
												</span> 
												<strong class="letter_strong">앞면</strong>
												<div class="letter_div15">
													<div class="letter_div16">
														<div class="letter_div17">
															<div class="letter_div18">
																<span class="letter_span16"> 당신이 매일 행복했으면 좋겠어요.<br>진심을 담은<br>
																이 순간을 기억해주세요.
																</span>
															</div>
														</div>
													</div>
													<strong class="letter_strong">안쪽면(사랑메시지)</strong>
												</div>
											</div>
										</div>
										
										<div id="tab-4<%=i%>" class="letter_div13 current letter_div13<%=i%>">
											<div class="letter_div14">
												<span class="letter_span15"> 
													<img src="https://kukka-2-media-123.s3.amazonaws.com/static/kukkart_new/img/kukka/letter_write_cover.png" class="letter_img2">
												</span> 
												<strong class="letter_strong">앞면</strong>
												<div class="letter_div15">
													<div class="letter_div16">
														<div class="letter_div17">
															<div class="letter_div18">
																<textarea class="letter_textarea" id="od_message<%=i%>" maxlength="160" name="od_message<%=i%>" placeholder="내용을 입력해주세요:)"></textarea>
																<%-- <input type="text" class="letter_textarea" name="od_message<%=i%>" placeholder="내용을 입력해주세요:)" > --%>	
															</div>
														</div>
													</div>
													<strong class="letter_strong">안쪽면(직접입력)</strong>
												</div>
											</div>
										</div>
										<p class="letter_p letter_div13<%=i%> current">
											<span class="letter_span18">- 최대8줄, 한줄당 최대 20자까지 인쇄됩니다.(공백포함)</span> 
											<span class="letter_span18">- 이모티콘은 편지 내용에 포함되지않습니다.</span>
											<span class="letter_span18">- 붙여넣기 사용시 편지가 입력 되지 않습니다.</span>
										</p>
										
										<input type="hidden" name="c_id<%=i%>" value="<%=c_id%>"> 
										<input type="hidden" name="i_id<%=i%>" value="<%=i_id%>"> 
										<input type="hidden" name="c_qty<%=i%>" value="<%=c_qty%>">
										<input type="hidden" name="od_delivery_date<%=i%>" value="<%=delivery_date%>"> 
										<input type="hidden" name="sub_option" value="<%=sub_option%>"><br>

										<%
										} else { //편지 선택안함
										%>

										<input type="hidden" name="l_id<%=i%>" value="0">
										<!-- 선택안함기본값 -->
										<input type="hidden" name="c_id<%=i%>" value="<%=c_id%>">
										<input type="hidden" name="i_id<%=i%>" value="<%=i_id%>">
										<input type="hidden" name="c_qty<%=i%>" value="<%=c_qty%>">
										<input type="hidden" name="od_delivery_date<%=i%>" value="<%=delivery_date%>"> 
										<input type="hidden" name="od_message<%=i%>" value=""> 
										<input type="hidden" name="sub_option" value="<%=sub_option%>">
										<%} %>
										
										<div class=letter_bottom_space>
										</div>
										<%}	%>
									</div>
									<br>
								</article>
							</div>
						</div>
					</div>
				</div>

				<input type="hidden" name="iNum" value="<%=i%>">
				<!-- 주문페이지에서 getParameter를 몇번 반복할지 참조가 되는 값 -->
				<div class="letter_div19">
				<div class="letter_div20">
				<div class="letter_div21">
				<div class="letter_div22">
				<input type="submit" class="letter_input2" value="작성완료">
				</div>
				</div>
				</div>
				</div>
				</form>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- footer -->
	
	
	<script type="text/javascript">
		$(document).ready(function() { // 편지지 선택하면 화면변경
			$('ul.letter_ul li').click(function() {
				var tab_id = $(this).attr('data-tab');
				var letter_div13_id = $(this).attr('id');
		
				$('.' + letter_div13_id).removeClass('current');
		
				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
				
				if(tab_id.indexOf('tab-4')){
					$('.letter_p.current.' + letter_div13_id).removeClass('current');
				} else {
					$('.letter_p.' + letter_div13_id).addClass('current');
				}
				
			});
		
		});
		
		function content_empty_check(){
			var i = 0;
			while($('#od_message'+i).val()!=null){ // while문 중지를 위한 문법
				if($('.current.letter_div13'+i+' #od_message'+i).val()==""){ // 편지 내용이 비었는지 판별
					alert(i+1+"번 편지 내용이 비어있습니다.");
					return false;
				}
				i++;
			}
			
			return true;
		}
	</script>
</body>
</html>