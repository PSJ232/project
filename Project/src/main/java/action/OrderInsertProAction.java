package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.IdMakerService;
import svc.OrderInsertProService;
import vo.ActionForward;
import vo.OrderBean;

public class OrderInsertProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderInsertProAction");
		ActionForward forward = null;
		
		IdMakerService idMakerService = new IdMakerService(); // 번호생성 알고리즘 서비스 
		int newId = idMakerService.newId("orders", "o_id");
		
		String o_address = request.getParameter("address1") + " " + request.getParameter("address2") + " " + request.getParameter("address3");
		OrderBean orderBean = new OrderBean();
		orderBean.setO_id(newId);// 주문번호 알고리즘
		orderBean.setM_id(request.getParameter("m_id"));
		orderBean.setO_sender(request.getParameter("o_sender"));
		orderBean.setO_address(o_address);
		orderBean.setO_receiver(request.getParameter("o_receiver"));
		orderBean.setO_phone(request.getParameter("o_phone"));
		//orderBean.setO_delivery_date(request.getParameter("o_delivery_date"));
		orderBean.setO_delivery_date("2021-12-31"); //테스트용 임시 데이터
		orderBean.setO_amount(Integer.parseInt(request.getParameter("o_amount")));
		orderBean.setO_point(Integer.parseInt(request.getParameter("o_point")));
		//orderBean.setO_payment(Integer.parseInt(request.getParameter("o_payment")));
		orderBean.setO_payment(1); //테스트용 임시 데이터
		
		//o_invoice 기본값 "주문접수" sql구문에서 설정
		//o_confirm 기본값 0 sql구문에서 설정
		//o_rdate 는 sql구문 now()로 설정
		
		OrderInsertProService orderInsertProSerive = new OrderInsertProService();
		boolean isOrderSuccess = orderInsertProSerive.registOrder(orderBean);
		
		if(!isOrderSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('주문 등록 실패!');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("/Project");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
