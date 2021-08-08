package action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.OrderService;
import vo.ActionForward;
import vo.PageInfo;

public class AdminOrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		OrderService service = new OrderService();
		// 페이징 처리를 위한 변수 선언
		int page = 1;	// 현재 페이지번호
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		request.setAttribute("page", page);
		HashMap<String, Integer> orderCount = service.getOrderCount();
		request.setAttribute("orderCount", orderCount);
		forward.setPath("./admin_layout/order_management/orderList.jsp");
		return forward;
	}

}
