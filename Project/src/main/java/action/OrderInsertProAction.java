package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.IdMakerService;
import svc.MemberPointSumService;
import svc.OrderInsertProService;
import vo.ActionForward;
import vo.OrderBean;

public class OrderInsertProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderInsertProAction");
		ActionForward forward = null;
		
		IdMakerService idMakerService = new IdMakerService(); // 번호생성 알고리즘 Service 
		int newId = idMakerService.newId("orders", "o_id");
		String m_id = request.getParameter("m_id");
		int newPoint = - (Integer.parseInt(request.getParameter("o_point"))); // 사용포인트이므로 입력된값에 마이너스 처리
		
		//나누어진 주소 한줄로 조합
		String o_address = request.getParameter("address1") + " " + request.getParameter("address2") + " " + request.getParameter("address3");
		OrderBean orderBean = new OrderBean();
		orderBean.setO_id(newId);
		orderBean.setM_id(m_id);
		orderBean.setO_sender(request.getParameter("o_sender"));
		orderBean.setO_address(o_address);
		orderBean.setO_receiver(request.getParameter("o_receiver"));
		orderBean.setO_phone(request.getParameter("o_phone"));
		//orderBean.setO_delivery_date(request.getParameter("o_delivery_date"));
		orderBean.setO_delivery_date("2021-12-31");//테스트용 임시 데이터
		orderBean.setO_amount(Integer.parseInt(request.getParameter("o_amount")));
		orderBean.setO_point(newPoint);
		//orderBean.setO_payment(Integer.parseInt(request.getParameter("o_payment")));
		orderBean.setO_payment(1); //테스트용 임시 데이터
		
		//o_invoice 기본값 "주문접수" sql구문에서 설정
		//o_confirm 기본값 0 sql구문에서 설정
		//o_rdate 는 sql구문 now()로 설정
		
	
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		OrderInsertProService orderInsertProSerive = new OrderInsertProService();
		boolean isOrderSuccess = orderInsertProSerive.registOrder(orderBean);
		
		if(!isOrderSuccess) { // 주문등록 실패하면 (PointSum, OrderDetail) 진행하지 않음
			out.println("<script>");
			out.println("alert('주문 등록 실패!');");
			out.println("history.back();");
			out.println("</script>");
		} else { // 주문등록이 성공하면 포인트계산서비스(MemberPOintSumService) 호출하여 DB에 계산결과 반영
			MemberPointSumService memberPointSumService = new MemberPointSumService();
			boolean isSumPointSuccess = memberPointSumService.sumPoint(m_id, newPoint);
		
			if(!isSumPointSuccess) {
				out.println("<script>");
				out.println("alert('포인트 등록(계산) 실패!');");
				out.println("history.back();");
				out.println("</script>");
			} else { // 포인트계산 결과가 member테이블에 정상적으로 저장이 되면, 
				forward = new ActionForward();
				forward.setPath("OrderDetailPro.od?o_id=" + newId); //주문번호를 들고 orderDetail을 저장하기위해 OrderDetailProService로 이동
				forward.setRedirect(false);
			}
			
		}
		
		return forward;
	}

}
