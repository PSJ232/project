package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;
import vo.CartBean;

public class VisitorJoinViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("VisitorJoinViewAction");
		ActionForward forward = null;
		
		String m_id = "visitor"; // 비회원
		int i_id = Integer.parseInt(request.getParameter("i_id")); // 상품번호
		int c_qty = Integer.parseInt(request.getParameter("c_qty")); // 상품 수량
		int c_letter = Integer.parseInt(request.getParameter("c_letter")); //편지지 선택 여부
		String c_delivery_date = request.getParameter("c_delivery_date"); //상품 배송 요청일
		
		CartBean cartDetail = new CartBean();
		cartDetail.setC_id(88888888);
		cartDetail.setI_id(i_id);
		cartDetail.setM_id(m_id);
		cartDetail.setC_qty(c_qty);
		cartDetail.setC_letter(c_letter);
		cartDetail.setC_delivery_date(c_delivery_date);
		request.setAttribute("cartDetail", cartDetail);
		
		forward = new ActionForward();
		forward.setPath("./member/login.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
