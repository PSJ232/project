package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberService;
import svc.OrderStatusService;
import svc.SubscribeStatusService;
import vo.ActionForward;
import vo.ItemBean;
import vo.MemberBean;
import vo.OrderBean;
import vo.OrderDetailBean;

public class MypageSbscribeListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MypageSbscribeListAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		
		// 마이페이지 멤버 정보 호출
		MemberService memberService = new MemberService();
		MemberBean memberMypageDetail = memberService.selectMember(m_id);
		request.setAttribute("memberMypageDetail", memberMypageDetail);	
		
		// 구독 내역 정보
		ArrayList<Integer> subscribeList = memberService.selectSubscribe(m_id);
		request.setAttribute("subscribeList", subscribeList);
		
		// 주문 내역(취소x) : non~ || 취소 내역 : ~ 
		SubscribeStatusService subscribeStatusService = new SubscribeStatusService();
		ArrayList<OrderBean> nonOrderArrayList = subscribeStatusService.subscribeNonStatusOrderList(m_id);
		ArrayList<OrderBean> orderArrayList = subscribeStatusService.subscribeStatusOrderList(m_id);
		ArrayList<ItemBean> nonItemArrayList = subscribeStatusService.subscribeNonStatusItemList(m_id);
		ArrayList<ItemBean> itemArrayList = subscribeStatusService.subscribeStatusItemList(m_id);
		ArrayList<OrderDetailBean> nonOrderDetailArrayList = subscribeStatusService.subscribeNonStatusOrderDetailList(m_id);
		ArrayList<OrderDetailBean> orderDetailArrayList = subscribeStatusService.subscribeStatusOrderDetailList(m_id);
	
		request.setAttribute("nonOrderArrayList", nonOrderArrayList);
		request.setAttribute("orderArrayList", orderArrayList);
		request.setAttribute("nonItemArrayList", nonItemArrayList);
		request.setAttribute("itemArrayList", itemArrayList);
		request.setAttribute("nonOrderDetailArrayList", nonOrderDetailArrayList);
		request.setAttribute("orderDetailArrayList", orderDetailArrayList);
		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./mypage/subscribe.jsp");
		return forward;
	}

}
