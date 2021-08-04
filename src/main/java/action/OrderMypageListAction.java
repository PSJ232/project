package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberService;
import svc.OrderService;
import svc.OrderStatusService;
import vo.ActionForward;
import vo.ItemBean;
import vo.MemberBean;
import vo.OrderBean;
import vo.OrderDetailBean;

public class OrderMypageListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderMypagelListAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		
		// 마이페이지 멤버 정보 호출
		MemberService memberService = new MemberService();
		MemberBean memberMypageDetail = memberService.selectMember(m_id);
		request.setAttribute("memberMypageDetail", memberMypageDetail);
		
		// 마이페이지 정기구독 정보 호출
		ArrayList<Integer> subscribeList = memberService.selectSubscribe(m_id);
		request.setAttribute("subscribeList", subscribeList);
		
		
		// 주문 내역(취소x) : non~ || 취소 내역 : ~ 
		OrderStatusService orderStatusService = new OrderStatusService();
		ArrayList<OrderBean> nonOrderArrayList = orderStatusService.orderNonStatusOrderList(m_id);
		ArrayList<OrderBean> orderArrayList = orderStatusService.orderStatusOrderList(m_id);
		ArrayList<ItemBean> nonItemArrayList = orderStatusService.orderNonStatusItemList(m_id);
		ArrayList<ItemBean> itemArrayList = orderStatusService.orderStatusItemList(m_id);
		ArrayList<OrderDetailBean> nonOrderDetailArrayList = orderStatusService.orderNonStatusOrderDetailList(m_id);
		ArrayList<OrderDetailBean> orderDetailArrayList = orderStatusService.orderStatusOrderDetailList(m_id);
		
		request.setAttribute("nonOrderArrayList", nonOrderArrayList);
		request.setAttribute("orderArrayList", orderArrayList);
		request.setAttribute("nonItemArrayList", nonItemArrayList);
		request.setAttribute("itemArrayList", itemArrayList);
		request.setAttribute("nonOrderDetailArrayList", nonOrderDetailArrayList);
		request.setAttribute("orderDetailArrayList", orderDetailArrayList);
		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./mypage/orderHistory.jsp");
		
		return forward;
	}

}
