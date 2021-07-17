package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.IdMakerService;
import vo.ActionForward;
import vo.OrderDetailBean;

public class OrderDetailProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderDetailProAction");
		
		ActionForward forward = null;
		
		IdMakerService idMakerService = new IdMakerService();
		int od_id = idMakerService.newId("orderDetailBean", "od_id");
		
		OrderDetailBean orderDetailBean = new OrderDetailBean();

		orderDetailBean.setOd_id(od_id);
		orderDetailBean.setO_id(Integer.parseInt(request.getParameter("o_id")));
		orderDetailBean.setI_id(Integer.parseInt(request.getParameter("i_id")));
		orderDetailBean.setL_id(Integer.parseInt(request.getParameter("l_id")));
		orderDetailBean.setOd_qty(Integer.parseInt(request.getParameter("od_qty")));
		orderDetailBean.setOd_message(request.getParameter("od_message"));
		
		
		return forward;
	}

}
