package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ItemDetailService;
import svc.ItemUpdateService;
import svc.MemberPointSumService;
import svc.OrderService;
import vo.ActionForward;
import vo.OrderBean;
import vo.OrderDetailBean;

public class OrderCancelAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderCancelAction");
		ActionForward forward = null;
		
		int o_id = Integer.parseInt(request.getParameter("o_id"));
		int num = 2; // 0:미확정, 1:구매확정, 2:취소, 3:반품
		OrderService orderService = new OrderService();
		boolean isOrderCancelSuccess = orderService.modifyOrderConfirm(o_id, num);
		OrderBean orderBean = orderService.getOrder(request.getParameter("o_id"));
		String m_id = orderBean.getM_id();
		int o_point = -orderBean.getO_point(); // 사용한 포인트 확인, 반환할 포인트!(음수처리)
		int o_gdiscount = orderBean.getO_gdiscount(); // 등급할인된 금액 확인
		int o_amount = orderBean.getO_amount(); // 총주문금액((상품원가 * 상품할인율 * 수량) + 편지) 확인
		
		int return_amount = o_amount - o_point - o_gdiscount; // 실제 취소되어 고객에게 반환할 금액! (미구현에 따른 미사용)
		
		MemberPointSumService memberPointSumService = new MemberPointSumService();
		memberPointSumService.sumPoint(m_id, o_point); // 포인트 반환
		
		OrderDetailBean orderdetailBean = orderService.getOrderDetail(o_id);
		int i_id = orderdetailBean.getI_id(); // 반납할 제품번호 확인
		int od_qty = -orderdetailBean.getOd_qty(); // 반납할 제품 수량 확인(음수처리)
		
		ItemUpdateService itemUpdateService = new ItemUpdateService();
		itemUpdateService.modifyInven(i_id, od_qty);
		
		
		// 취소한 주문에 따라 다른 주소 이동(일반 구매, 정기구독 구분)
		int i_category = Integer.parseInt(request.getParameter("i_category"));
		
		if (!isOrderCancelSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('주문취소가 되지않았습니다.');");
			out.println("history.back();");
			out.println("</script>");
		} else if(i_category != 3) {
			forward = new ActionForward();
			forward.setPath("OrderMypageDetailList.od");
			forward.setRedirect(true);
		} else if(i_category == 3) {
			forward = new ActionForward();
			forward.setPath("MypageSubscribe.od");
			forward.setRedirect(true);
		}
		
		
		return forward;
	}

}
