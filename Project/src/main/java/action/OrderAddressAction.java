package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.OrderListService;
import vo.ActionForward;
import vo.OrderBean;

public class OrderAddressAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderAddressAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id"); // 회원 정보 추출
		
		OrderListService orderListService = new OrderListService();
		ArrayList<OrderBean> orderList = orderListService.getOrderList(m_id); // 주소 추출을 위해 회원정보로 주문내역 리스트 저장
		request.setAttribute("orderList", orderList);
		
		
		forward = new ActionForward();
		forward.setPath("./order/addressList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
