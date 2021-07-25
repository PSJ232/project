package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.CartService;
import svc.IdMakerService;
import svc.MemberPointSumService;
import svc.OrderService;
import vo.ActionForward;
import vo.OrderBean;
import vo.OrderDetailBean;

public class OrderInsertProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderInsertProAction");
		ActionForward forward = null;
		

		
		int iNum = Integer.parseInt(request.getParameter("iNum"));
		
		ArrayList<OrderDetailBean> orderDetailList = new ArrayList<OrderDetailBean>();
		OrderDetailBean orderDetailBean = null;
		
		for (int i = 0 ; i < iNum ; i++) {
			orderDetailBean = new OrderDetailBean();
//			orderDetailBean.setOd_id(od_id);
//			orderDetailBean.setO_id(Integer.parseInt(request.getParameter("o_id")));
			orderDetailBean.setL_id(Integer.parseInt(request.getParameter("l_id" + i)));
			orderDetailBean.setI_id(Integer.parseInt(request.getParameter("i_id" + i)));
			orderDetailBean.setOd_qty(Integer.parseInt(request.getParameter("od_qty" + i)));
			orderDetailBean.setOd_message(request.getParameter("od_message" + i));
			orderDetailBean.setM_id(request.getParameter("m_id"));
			orderDetailBean.setC_id(Integer.parseInt(request.getParameter("c_id" + i)));
			orderDetailBean.setOd_delivery_date(request.getParameter("od_delivery_date" + i));
			orderDetailList.add(orderDetailBean);
		}
		
		request.setAttribute("orderDetailList", orderDetailList);
		
		
		IdMakerService idMakerService = new IdMakerService(); // 번호생성 알고리즘 Service 
		int newId = idMakerService.newId("orders", "o_id", 1);
		String m_id = request.getParameter("m_id");
		int newPoint = - (Integer.parseInt(request.getParameter("o_point"))); // 사용포인트이므로 입력된값에 마이너스 처리
		
		//나누어진 주소 한줄로 조합
		String o_address = request.getParameter("address1") + "&" + request.getParameter("address2") + "&" + request.getParameter("address3"); // 나중에 다시 꺼내쓸때 split가능하도록 "|" 기준점 넣어줌
		OrderBean orderBean = new OrderBean();
		orderBean.setO_id(newId);
		orderBean.setM_id(m_id);
		orderBean.setO_sender(request.getParameter("o_sender"));
		orderBean.setO_address(o_address);
		orderBean.setO_receiver(request.getParameter("o_receiver"));
		orderBean.setO_phone(request.getParameter("o_phone"));
		orderBean.setO_amount(Integer.parseInt(request.getParameter("o_amount")));
		orderBean.setO_point(newPoint);
		//orderBean.setO_payment(Integer.parseInt(request.getParameter("o_payment")));
		orderBean.setO_payment(1); //테스트용 결제수단 임시 번호
		//o_rdate 는 sql구문 now()로 설정
		
		OrderService orderSerive = new OrderService();
		boolean isOrderSuccess = orderSerive.registOrder(orderBean);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(!isOrderSuccess) { // 주문등록 실패하면 (PointSum, OrderDetail) 진행하지 않음
			out.println("<script>");
			out.println("alert('주문 등록 실패!');");
			out.println("history.back();");
			out.println("</script>");
		} else { // 주문등록이 성공하면 주문번호를 들고 orderDetail을 저장하기위해 OrderDetailProService로 이동
			
			forward = new ActionForward();
			forward.setPath("OrderDetailPro.od?o_id=" + newId); 
			forward.setRedirect(false);
			
			
			// 주문완료된 상품을 장바구니에서 삭제
			CartService cartService = new CartService();
			boolean isDeleteSuccess = false; 
			for(OrderDetailBean odb : orderDetailList) {
				int c_id = odb.getC_id();
				isDeleteSuccess = cartService.dropItem(c_id);
				if(!isDeleteSuccess) {
					System.out.println("확인요망 : 장바구니 " + c_id + "가 삭제되지 않았습니다.");
				}
			}
			
			
			// 포인트계산서비스(MemberPOintSumService) 호출하여 DB에 계산결과 반영
			MemberPointSumService memberPointSumService = new MemberPointSumService();
			boolean isSumPointSuccess = memberPointSumService.sumPoint(m_id, newPoint);
		
			if(!isSumPointSuccess) {
				System.out.println("확인요망 : 포인트 계산 결과가 반영되지 않았습니다.");
			}
			
		}
		
		return forward;
	}

}
