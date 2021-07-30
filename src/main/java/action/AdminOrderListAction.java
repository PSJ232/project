package action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.OrderService;
import vo.ActionForward;

public class AdminOrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		OrderService service = new OrderService();
		HashMap<String, Integer> orderCount = service.getOrderCount();
		request.setAttribute("orderCount", orderCount);
		forward.setPath("./admin_layout/order_management/orderList.jsp");
		return forward;
	}

}
