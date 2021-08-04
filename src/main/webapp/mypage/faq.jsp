<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/mypage_faq.css">
<link rel="stylesheet" href="./css/utility.css">
<link rel="stylesheet" href="./css/style.css">
</head>
<body>

	<jsp:include page="../inc/header.jsp" ></jsp:include>

	<div id="container">
		<div class="faq_container">
			<div class="faq_layout_top">
				<h2 class="faq_title">자주묻는 질문</h2>
				<button class="btn_wide btn_yellow">1:1문의하기</button>
			</div>
			
			<div class="faq_layout_bottom">
				<ul class="faq_list_layout"><!-- is_active(visibility : none, visible)  -->
					<li class="faq_list"><a class="faq_list_link is_clicked" href="#faq_faq" onclick='return false;'>FAQ</a></li>
					<li class="faq_list"><a class="faq_list_link" href="#faq_item" onclick='return false;'>상품</a></li>
					<li class="faq_list"><a class="faq_list_link" href="#faq_order" onclick='return false;'>주문/결제</a></li>
					<li class="faq_list"><a class="faq_list_link" href="#faq_subscribe" onclick='return false;'>정기구독</a></li>
					<li class="faq_list"><a class="faq_list_link" href="#faq_delivery" onclick='return false;'>배송</a></li>
					<li class="faq_list"><a class="faq_list_link" href="#faq_quick" onclick='return false;'>새벽배송</a></li>
					<li class="faq_list"><a class="faq_list_link" href="#faq_class" onclick='return false;'>클래스</a></li>
					<li class="faq_list"><a class="faq_list_link" href="#faq_etc" onclick='return false;'>기타</a></li>
				</ul>
				
				<div id="faq_board">
					<ul id="faq_faq" class="faq_board_box is_active">
						<li class="faq_board_item">
							<span class="faq_question">정기구독 날짜를 변경할 수 있나요?</span>
							<div class="faq_answer">[MY PAGE] > [정기 구독] > 해당 정기 구독의 상세보기에서 직접 변경할 수 있어요. 단, ‘발송 준비중’ 상태가 되면 조정이 어렵습니다. 2주 간격으로 배송일이 설정되지 않으면, 같은 디자인의 꽃을 받아보실 수도 있으니 고객센터 (1661-1031)로 상담 부탁드려요.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">배송 시간을 지정하고 싶어요</span>
							<div class="faq_answer">택배 상품의 경우 택배로 배송이 이루어지기 때문에, 배송 당일 정확한 시간 안내는 어려운 점 양해 부탁드립니다. 당일 배송 상품은 퀵으로 배송하여 수령 시간대 지정이 가능하니 주문 시 확인 부탁드립니다.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">꽃 상태가 좋지 않아요</span>
							<div class="faq_answer">사계는 항상 싱싱하고 예쁜 꽃을 보내드리기 위해 모든 과정에서 노력하고 있지만, 부득이하게 배송 과정에서 꽃이 상처 나거나 시들 수 있어요. 꽃의 상태를 사진으로 찍어서 상품 리뷰가 아닌 1:1 문의 게시판으로 등록해주시면 더 신속하게 친절히 상담해 드릴게요.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">플라워 클래스 날짜를 변경하고 싶어요</span>
							<div class="faq_answer">클래스 시작 4일 전부터는 일절 변경이 불가해요. (ex. 월요일 수업 시작이라면, 전 주 목요일부터 변경 불가) 5일 전이라면 1:1 문의 또는 해당 지점에 변경 문의 부탁드려요.</div>
						</li>
					</ul>
					<ul id="faq_item" class="faq_board_box">
						<li class="faq_board_item">
							<span class="faq_question">꽃 상태가 좋지 않아요</span>
							<div class="faq_answer">사계는 항상 싱싱하고 예쁜 꽃을 보내드리기 위해 모든 과정에서 노력하고 있지만, 부득이하게 배송 과정에서 꽃이 상처 나거나 시들 수 있어요. 꽃의 상태를 사진으로 찍어서 상품 리뷰가 아닌 1:1 문의 게시판으로 등록해주시면 더 신속하고 친절히 상담 도와드릴게요.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">꽃다발을 같은 구성의 꽃바구니로 변경하고 싶어요</span>
							<div class="faq_answer">저희 사계에서는 홈페이지 내의 구성 이외에 꽃을 추가하거나 형태나 포장을 변경하여 보내드리지 않고 있습니다.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">꽃 길이를 더 길게 받아보고 싶어요</span>
							<div class="faq_answer">저희 사계에서는 직접 제작한 박스 길이에 맞춰 단단히 고정해 전해드리기 위해 줄기를 더 길게 제작해 전해드리기는 어렵습니다. 택배로 꽃을 보내드리는 상품 특성 상 파손 위험을 줄이기 위해 가장 이쁜 모습으로 단단히 고정해 전해드릴 수 있는 줄기 길이로 전해드리고 있는 점 참고해주세요.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">카드에 이름이 써 있지 않은 꽃의 이름이 궁금해요</span>
							<div class="faq_answer">궁금하신 꽃의 사진을 1:1문의에 올려주시면, 신속하고 친절히 답변드릴게요.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">홈페이지에 없는 다른 꽃을 주문할 수 있나요?</span>
							<div class="faq_answer">사계 홈페이지에 없는 꽃, 다른 구성으로는 주문이 어려워요. 사계 오프라인 쇼룸(광화문점, 잠실점, 월계점, 구로점)에서는 원하는 구성으로 구입이 가능하니, 쇼룸으로 문의 주셔도 좋아요.</div>
						</li>
					</ul>
					<ul id="faq_order" class="faq_board_box">
						<li class="faq_board_item">
							<span class="faq_question">아직 상품을 받지 않았는데 주문을 취소하고 싶어요.</span>
							<div class="faq_answer">‘발송 대기’ 상태인 주문 건은 발송 전 [MY PAGE] > [주문내역]에서 직접 취소가 가능해요. 하지만 ‘발송 준비중’ 단계로 넘어간 주문 건은 취소가 불가하며, 1대1문의 혹은 사계 고객센터(1661-1031)로 연락 주시면 다시 한 번 확인해 드릴게요.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">배송정보(배송일)을 잘못 입력해서 정상적으로 배송이 되지 않았어요.</span>
							<div class="faq_answer">배송지 기재 혹은 배송일 선택을 잘못 하셔서 정상적으로 배송이 이뤄지지 못한 경우, 재배송 및 환불 사유가 되지 않습니다. 주문서 작성 시 꼭 다시 한번 확인 부탁드릴게요.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">주문 후 입금했는데, 아직 입금 대기중이에요</span>
							<div class="faq_answer">입금 확인은 오전 11시, 오후 2시 이후에 수기로 이루어집니다. 익일 배송(예약)꽃은 선택하신 배송일 전날 오후 2시 전까지 입금 확인이 되어야 발송이 가능하니 해당 시간 이전에 입금 부탁드려요</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">전화로 주문할 수 있나요?</span>
							<div class="faq_answer">사계 홈페이지에서 판매 중인 상품으로 전화 주문을 도와드릴 수 있으나, 카드결제가 불가능하며 쿠폰 및 포인트 사용/적립은 되지 않아요. 사계 고객센터(1661-1031)로 연락 부탁드려요.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">결제 수단에는 어떤 것들이 있나요?</span>
							<div class="faq_answer">자동 결제 상품은 신용카드 결제만 가능합니다. 그 외 사계의 모든 상품은 신용카드, 무통장 입금, 휴대폰 결제, 페이팔, 카카오페이, 스마일페이로 결제하실 수 있어요.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">무통장 입금 계좌번호가 어떻게 되나요?</span>
							<div class="faq_answer">[계좌번호 : 기업은행 123-123123-12-123 예금주 : (주)사계] 결제시 기입해주신 입금자 성함과 실제 입금자 성함이 같아야 입금 확인이 되며, 당일 배송 꽃은 주문 후 30분 이내, 익일 배송(예약) 꽃은 선택하신 날짜 전날 오후 2시 전까지 입금확인이 되어야 발송할 수 있어요.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">회원가입하지 않고 주문할 수 있나요?</span>
							<div class="faq_answer">인증번호를 받을 수 있는 국내 전화번호가 있다면 비회원으로도 주문이 가능합니다.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">외국인이나 해외 거주자도 주문 가능한가요?</span>
							<div class="faq_answer">국내에서 개통된 휴대전화가 있다면, 외국인이나 해외거주자도 주문하실 수 있습니다.</div>
						</li>
					</ul>
					<ul id="faq_subscribe" class="faq_board_box">
						<li class="faq_board_item">
							<span class="faq_question">정기구독을 잠시 중지하고 싶어요</span>
							<div class="faq_answer">1:1 문의 게시판 또는 kukka 고객센터(1661-1031)로 연락 주시면, 구독 중지를 도와드릴게요.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">정기구독을 해지하고 싶습니다.</span>
							<div class="faq_answer">[MY PAGE] > [주문내역] > [상세보기] > [서비스해지]를 통해 신청해주세요. 중도 해지 시, 사은품 금액의 차액과 ‘1회권 이용금액’ 기준으로 이미 받으신 꽃의 횟수만큼 차감 후 환불 됩니다.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">정기구독 상품을 변경할 수 있나요?</span>
							<div class="faq_answer">상품 변경은 어려우며, 주문 취소 후 원하시는 상품으로 재주문을 부탁드릴게요.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">자동 결제는 언제 진행되나요?</span>
							<div class="faq_answer">꽃을 받으신 날 기준 다음주 월~화요일에 다음 회차의 선결제가 이루어집니다. 이후 목요일에 결제 실패자 대상으로 재시도가 이루어집니다.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">정기구독-자동결제 상품이 빨리 결제되었어요.</span>
							<div class="faq_answer">정기결제 상품은 횟수를 정하지 않고 해지 시까지 꽃을 정기 배송받으시는 분들을 위한 상품입니다. 꽃을 수령하시고 차주(다음 주) 월~화요일에 다음 회차의 정기 선결제가 이루어집니다.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">정기구독 종류는 어떻게 되나요?</span>
							<div class="faq_answer">사이즈 별로 S,L,XL 네 가지 상품으로 구성되어 있습니다. 구독 간격은 2주 단위로 1,2,6개월간 받으실 꽃을 선결제로 먼저 구매해주시는 [개월 구독권]상품과 고객님께서 직접 해지해주실때 까지 결제와 배송이 반복되는 [정기결제]상픔으로 구성되어 있습니다.
							</div>
						</li>
					</ul>
					<ul id="faq_delivery" class="faq_board_box">
						<li class="faq_board_item">
							<span class="faq_question">배송 일정 변경을 할 수 있나요?</span>
							<div class="faq_answer">
								주문 완료 후 선택하신 배송일에 수령을 하지 못 하신다면, 마이페이지에서 수령일을 변경할 수 있어요! (단, [발송 대기] 상태에서만 변경 가능합니다)<br>
								[MY PAGE] - [주문 내역] - [상세 보기] - [배송일 변경]<br>
								다만 주말(토, 일) 또는 공휴일, 전날이 공휴일인 경우에는 배송이 불가하며, 상품에 따라 꽃이 준비되는 날짜가 다르기 때문에 선택하실 수 있는 배송일이 제한적일 수 있는 점 양해 부탁드려요.
							</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">배송지 번경 방법이 궁금해요.</span>
							<div class="faq_answer">
								1. 일반 상품, [MY PAGE] - [주문 내역] - [배송지 변경]에서 배송지를 변경할 수 있어요! 다만, 생화 특성 상 [상품 준비] 단계에서는 주문 변경 및 취소가 어렵습니다.<br>
								2. 정기구독 상품, 위 방법 또는 [MY PAGE] - [정기구독] - [상세 보기] - [배송주소 변경]에서 가능하시며, 배송 주소 변경 내역은 다음 회차 발송부터 적용됩니다.
							</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">어떻게 꽃이 배송되나요?</span>
							<div class="faq_answer">생화는 오아시스(플로럴 폼)에 꽂거나 기타 물처리를 통해 신선하게 유지되도록 포장하여 보내드려요. 꽃다발의 모든 상품은 선물하실 수 있게 개별 포장 후 kukka 전용 박스에 담아 안전하게 배송됩니다.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">배송 전 꽃 사진을 받아보고 싶어요.</span>
							<div class="faq_answer">상품 상세 사진과 동일한 구성으로 전해드리고 있습니다. 배송전 꽃 사진은 전해드리지 않고 있어요. 구성이 변경될 시 고객님께 따로 안내 드리고 있습니다.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">지정한 배송일에 꽃이 도착하지 않았어요.</span>
							<div class="faq_answer">택배 특성상, 물량이 많은 명절 또는 연휴에는 배송이 1~2일 지연될 수 있어요. 배송이 지연되어 꽃 상태가 좋지 않다면, 꽃의 상태를 사진으로 찍어서 1:1 문의 게시판으로 보내주시면 친절히 상담해드리겠습니다.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">꽃이 많이 시들어서 배송 왔어요.</span>
							<div class="faq_answer">
								kukka는 항상 싱싱하고 예쁜 꽃을 보내드리기 위해 모든 과정에서 노력하고 있으나, 부득이하게 배송 과정에서 꽃이 상처나거나 시들 수 있어요. 꽃의 상태를 사진으로 찍어서 1:1 문의 게시판으로 보내주시면 친절히 상담해드리겠습니다.
							</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">배송 불가능한 지역이 있나요?</span>
							<div class="faq_answer">
								‘당일 배송’ 과 '새벽 배송'은 서울 모든 지역, 경기 일부 지역만 가능해요. 자세한 지역은 상품 상세 페이지의 '배송 안내'에서 확인 가능하십니다. 그 외 상품은 주문 시 선택한 날짜에 우체국 택배를 통해 받아 보실 수 있어요. 제주도 및 도서 산간 지역은 1~2일 늦어질 수 있는 점 양해 부탁드려요.
							</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">월요일에 수령하고 싶은데, 월요일 수령은 안되나요?</span>
							<div class="faq_answer">
								일요일 택배사 휴무로 발송을 할 수가 없어 수령일은 화요일부터 지정 가능합니다. 대신 당일배송 탭의 상품을 퀵 배송으로는 받아보실 수 있습니다.
							</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">주문 시, 원하는 배송일을 선택할 수 없어요.</span>
							<div class="faq_answer">
								설, 추석 등 택배사의 물량이 많아 정상적인 배송이 불가능하거나 주말(토, 일) 또는 공휴일 당일과 익일 경우에는 배송이 불가하며, 상품에 따라 꽃이 준비되는 날짜가 다르기 때문에 선택하실 수 있는 배송일이 제한적일 수 있는 점 양해 부탁드려요.
							</div>
						</li>
					</ul>
					<ul id="faq_quick" class="faq_board_box">
						<li class="faq_board_item">
							<span class="faq_question">언제든 새벽배송으로 꽃을 받을 수 있나요?</span>
							<div class="faq_answer">새벽 기온이 낮은 겨울철에는 꽃이 얼어 배송될 위험이 있어 운영되지 않으며 봄 부터 가을까지만 새벽배송으로 받아보실 수 있습니다.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">추가 배송비 없이 새벽 배송을 이용할 수 있나요?</span>
							<div class="faq_answer">네. 새벽배송 가능 지역이라면 추가 배송비 없이 서비스를 이용하실 수 있습니다. 새벽배송 불가 지역의 경우 일반 택배로 보내드리는 점 양해 부탁드려요.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">새벽배송 가능 지역은 어떻게 되나요?</span>
							<div class="faq_answer">새벽배송은 서울/인천/경기 일부지역만 가능하십니다. 주문 결제시 주소를 등록해주시면 배송가능 여부를 확인하실 수 있습니다.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">어떤 상품들이 새벽 배송 가능 상품인가요?</span>
							<div class="faq_answer">kukka 새벽배송은 [당일배송]상품을 제외하고 모두 가능합니다.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">새벽배송 상품은 배송추적이 가능한가요?</span>
							<div class="faq_answer">새벽배송 상품은 전날 저녁 출고되어 당일 오전 8시 이전에 배송되기때문에 따로 배송 추척은 불가능한 점 양해 부탁드립니다.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">배송을 받지 못했어요.</span>
							<div class="faq_answer">배송 관련한 문의는 1대1문의 혹은 고객센터(1661-1031)로 전화주시면 빠르게 상담 도와드릴게요. 부정확한 주소와 공동현관 비밀번호 미기재로 인한 미배송과 분실은 재배송 및 환불 대상이 아닙니다. 다시 한 번 확인해주세요.</div>
						</li>
					</ul>
					<ul id="faq_class" class="faq_board_box">
						<li class="faq_board_item">
							<span class="faq_question">플라워 클래스 날짜를 변경하고 싶어요.</span>
							<div class="faq_answer">클래스 시작 4일 전부터는 일절 변경이 불가해요. 4일 전이라면 1:1 문의 또는 해당 지점에 변경 문의 부탁드려요.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">클래스에 불참했을 경우 어떻게 되나요?</span>
							<div class="faq_answer">
								참석하지 못하시는 분들은 미리 알려주시면 수업에 사용되는 꽃과 소재를 챙겨 드려요.<br>
								- 2일 내 수업이 진행되는 쇼룸에서 픽업 가능<br>
								- 수업 재료 택배로 수령 불가능<br>
								- 보강 불가<br>
							</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">클래스 진행시에 재로비 혹은 준비물이 있을까요?</span>
							<div class="faq_answer">클래스 당일 꽃가위와 앞치마는 준비가 되어있어요. 편하게 방문해주세요. 클래스 비용은 재료비가 모두 포함된 금액입니다.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">클래스에서 사용했던 꽃 종류를 알고 싶어요.</span>
							<div class="faq_answer">수강하셨던 지점(광화문점, 월계점, 잠실점, 구로점)에 전화주시면 바로 확인해드릴게요.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">클래스 신청한 사람과 실제 수강생의 정보가 달라도 수업 참여가 가능한가요?</span>
							<div class="faq_answer">가능합니다. 수업 전 수업을 받으시는 kukka 쇼룸으로 연락 주시면 감사드릴게요.</div>
						</li>
					</ul>
					<ul id="faq_etc" class="faq_board_box">
						<li class="faq_board_item">
							<span class="faq_question">ID와 비밀번호를 잊어버렸어요.</span>
							<div class="faq_answer">로그인 페이지에서 아이디/비밀번호 찾기를 통해 확인하실 수 있어요</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">회원 탈퇴는 어떻게 하나요?</span>
							<div class="faq_answer">[MY PAGE] > [회원 탈퇴]에서 하실 수 있어요. 현재는 PC버전에서만 가능합니다.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">회원 탈퇴 후 동일한 이메일로 재가입이 가능한가요?</span>
							<div class="faq_answer">동일한 이메일로는 재가입이 불가합니다.</div>
						</li>
						<li class="faq_board_item">
							<span class="faq_question">비회원 주문 조회는 어떻게 하나요?</span>
							<div class="faq_answer">홈페이지 상단의 [로그인] - [비회원으로 구매하셨나요?]에서 조회하실 수 있어요.</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../inc/footer.jsp"></jsp:include>

	
	<script type="text/javascript">
		$(document).ready(function(){
			$('.faq_list_link').click(function(){
				$('.faq_list_link').removeClass('is_clicked');
				$(this).addClass('is_clicked');
				
				let address = $(this).attr('href').substring(1);
				$('#faq_board').find('ul').removeClass('is_active');
				document.getElementById(address).classList.add('is_active');
			});

			$('.faq_board_item').click(function(){
				$(this).find('div').addClass('is_active');
			});
		});
	</script>
</body>
</html>