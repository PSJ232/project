package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ItemDetailService;
import vo.ActionForward;
import vo.CartBean;
import vo.ItemBean;

public class VisitorCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("VisitorCartAction");
		ActionForward forward = null;
		
		int c_id = 99999988; // 비회원구매 임의숫자, 장바구니주문의 번호와 구분을 위한 의미없음
		String m_id = "visitor"; // 비회원
		String c_delivery_date = request.getParameter("c_delivery_date"); //상품 배송 요청일
		int i_id = Integer.parseInt(request.getParameter("i_id")); // 상품번호
		int c_qty = Integer.parseInt(request.getParameter("c_qty")); // 상품 수량
		int c_letter = Integer.parseInt(request.getParameter("c_letter")); //편지지 선택 여부
		
		CartBean cartDetail = new CartBean();
		cartDetail.setC_id(c_id);
		cartDetail.setM_id(m_id);
		cartDetail.setC_delivery_date(c_delivery_date);
		cartDetail.setI_id(i_id);
		cartDetail.setC_qty(c_qty);
		cartDetail.setC_letter(c_letter);
		request.setAttribute("cartDetail", cartDetail);
		
		ItemDetailService itemDetailService = new ItemDetailService();
		ItemBean itemDetail = itemDetailService.selectItem(i_id);
		request.setAttribute("itemDetail", itemDetail);
		
		forward = new ActionForward();
		forward.setPath("./order/visitorCart.jsp"); // 메인화면 주소 미정, 임시주소
		forward.setRedirect(false);
		
		return forward;
	}

}
