package action;

import java.io.PrintWriter;
import java.util.ArrayList;

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

		ArrayList<OrderDetailBean> orderDetailList = (ArrayList<OrderDetailBean>) request.getAttribute("orderDetailList");

		OrderDetailProService orderDetailProService = new OrderDetailProService();
		IdMakerService idMakerService = new IdMakerService();
		int od_id = 0;
		boolean isOrderdetailSuccess = false;
		for (OrderDetailBean odb : orderDetailList) {
			od_id = idMakerService.newId("orders_detail", "od_id"); // od_id 생성
			odb.setOd_id(od_id);
			odb.setO_id(Integer.parseInt(request.getParameter("o_id")));
			isOrderdetailSuccess = orderDetailProService.registOrderDetail(odb);
		}

		if (!isOrderdetailSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('주문상세 등록 실패!');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("/Project"); // 임시 이동 페이지, 나중에 mypage로 이동해야됨
			forward.setRedirect(true);
		}

		return forward;
	}

}
