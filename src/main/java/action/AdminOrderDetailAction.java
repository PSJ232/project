package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.OrderService;
import vo.ActionForward;
import vo.OrderBean;
import vo.OrderDetailBean;

public class AdminOrderDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		OrderService service = new OrderService();
		int o_id = Integer.parseInt(request.getParameter("o_id"));
		OrderBean orderBean = service.getOrder(o_id);
		ArrayList<OrderDetailBean> orderDetailList = service.getOrderDetail(o_id);
		request.setAttribute("orderBean", orderBean);
		request.setAttribute("orderDetailList", orderDetailList);
		forward = new ActionForward();
		forward.setPath("./admin_layout/order_management/orderDetail.jsp");
		return forward;
	}

}
