package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.IdMakerService;
import svc.MemberService;
import svc.OrderService;
import vo.ActionForward;
import vo.MemberBean;
import vo.OrderBean;
import vo.OrderDetailBean;

public class OrderDetailProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderDetailProAction");

		ActionForward forward = null;

		ArrayList<OrderDetailBean> orderDetailList = (ArrayList<OrderDetailBean>) request.getAttribute("orderDetailList");
		
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");
		
		OrderService orderService = new OrderService();
		IdMakerService idMakerService = new IdMakerService();
		int o_id = Integer.parseInt(request.getParameter("o_id"));
		int od_id = 0;
		boolean isOrderdetailSuccess = false;
		for (OrderDetailBean odb : orderDetailList) {
			od_id = idMakerService.newId("orders_detail", "od_id"); // od_id 생성
			odb.setOd_id(od_id);
			odb.setO_id(o_id);
			isOrderdetailSuccess = orderService.registOrderDetail(odb);
		}
		
		OrderBean orderDetail = orderService.getOrder(request.getParameter("o_id"));		
		request.setAttribute("orderDetail", orderDetail);
		
		MemberService memberService = new MemberService();
		MemberBean memberDetail = memberService.selectMember(m_id);
		request.setAttribute("memberDetail", memberDetail);
		

		if (!isOrderdetailSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('주문상세 등록 실패!');");
			out.println("history.back();");
			out.println("</script>");
			
		} else {
			forward = new ActionForward();
			forward.setPath("Receipt.od");
			forward.setRedirect(false);
		}

		return forward;
	}

}
