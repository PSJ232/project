package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ItemListService;
import svc.OrderService;
import vo.ActionForward;
import vo.ItemBean;
import vo.OrderBean;
import vo.OrderDetailBean;

public class QnaOrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("QnaOrderListAction");

		ActionForward forward = null;

		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");

		OrderService orderService = new OrderService();
		ArrayList<OrderBean> orderList = orderService.getOrderList(m_id);
		request.setAttribute("orderList", orderList);
		
		ArrayList<OrderDetailBean> orderDetailList = orderService.getOrderDetailList(m_id);
		request.setAttribute("orderDetailList", orderDetailList);
		
		
		ItemListService itemListService = new ItemListService();
		ArrayList<ItemBean> itemList = itemListService.getItemList();
		request.setAttribute("itemList", itemList);
		
		

		forward = new ActionForward();
		forward.setPath("./mypage/searchOrder.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
