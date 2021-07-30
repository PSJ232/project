package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ItemDetailService;
import svc.OrderService;
import vo.ActionForward;
import vo.ItemBean;
import vo.OrderBean;
import vo.OrderDetailBean;

public class VisitorPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("VisitorPageAction");
		ActionForward forward = null;
		
		String o_sender = request.getParameter("o_sender");
		int o_id = Integer.parseInt(request.getParameter("o_id"));
		
		OrderService orderService = new OrderService();
		OrderBean visitorOrder = orderService.checkOrder(o_sender, o_id);
		request.setAttribute("visitorOrder", visitorOrder);
		
		OrderDetailBean orderDetail = orderService.getOrderDetail(o_id);
		request.setAttribute("orderDetail", orderDetail);
		
		ItemDetailService itemDetailService = new ItemDetailService();
		ItemBean itemDetail = itemDetailService.selectItem(orderDetail.getI_id());
		request.setAttribute("itemDetail", itemDetail);
		
		
		if(visitorOrder == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('주문내역이 없습니다.');");
			out.print("history.back();");
			out.print("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("./member/visitorPage.jsp"); // 메인화면 주소 미정, 임시주소
			forward.setRedirect(false);
		}
		
		return forward;
	}

}
