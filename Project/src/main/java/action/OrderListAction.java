package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.OrderListService;
import vo.ActionForward;

public class OrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		OrderListService service = new OrderListService();
		
//		ArrayList<OrderBean> orderList = service.getOrderList();
		
		return forward;
	}

}
