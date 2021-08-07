package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.OrderService;
import vo.ActionForward;

public class PurchaseConfirmAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("PurchaseConfirmAction");
		ActionForward forward = null;
		int od_id = Integer.parseInt(request.getParameter("od_id"));
		System.out.println(od_id);
		
		OrderService orderService = new OrderService();
		boolean isUpdateSuccess = orderService.confirmPurchase(od_id);
		
		if(isUpdateSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('구매가 확정되었습니다.');");
			out.println("opener.location.reload()");
			out.println("window.close()");
			out.println("</script>");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('구매 확정이 실패했습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		
		
		return forward;
	}

}
