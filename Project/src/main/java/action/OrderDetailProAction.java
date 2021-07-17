package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.IdMakerService;
import svc.OrderDetailProService;
import vo.ActionForward;
import vo.OrderDetailBean;

public class OrderDetailProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderDetailProAction");
		
		ActionForward forward = null;
		
		IdMakerService idMakerService = new IdMakerService();
		int od_id = idMakerService.newId("orders_detail", "od_id");
		
		OrderDetailBean orderDetailBean = new OrderDetailBean();

		orderDetailBean.setOd_id(od_id);
		orderDetailBean.setO_id(Integer.parseInt(request.getParameter("o_id")));
		orderDetailBean.setI_id(Integer.parseInt(request.getParameter("i_id")));
		orderDetailBean.setL_id(Integer.parseInt(request.getParameter("l_id")));
		orderDetailBean.setOd_qty(Integer.parseInt(request.getParameter("od_qty")));
		orderDetailBean.setOd_message(request.getParameter("od_message"));
		
		
		OrderDetailProService orderDetailProService = new OrderDetailProService();
		boolean isOrderdetailSuccess = orderDetailProService.registOrderDetail(orderDetailBean);
		
		if(!isOrderdetailSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('주문상세 등록 실패!');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("/Project"); //임시 이동 페이지, 나중에 mypage로 이동해야됨
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
