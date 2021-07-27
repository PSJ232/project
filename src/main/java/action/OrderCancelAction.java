package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.OrderService;
import vo.ActionForward;

public class OrderCancelAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderCancelAction");
		ActionForward forward = null;
		
		int o_id = Integer.parseInt(request.getParameter("o_id"));
		int num = 2; // 0:미확정, 1:구매확정, 2:취소, 3:반품
		OrderService orderService = new OrderService();
		boolean isOrderCancelSuccess = orderService.modifyOrderConfirm(o_id, num);
		
		if (!isOrderCancelSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('주문취소가 되지않았습니다.');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("OrderMypageDetailList.od");
			forward.setRedirect(true);
		}
		
		
		return forward;
	}

}
