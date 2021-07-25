package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.CartService;
import svc.ItemDetailService;
import vo.ActionForward;
import vo.CartBean;
import vo.ItemBean;

public class CartUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CartUpdateProAction");
		ActionForward forward = null;

		int c_id = Integer.parseInt(request.getParameter("c_id")); // 장바구니 상품번호

		CartService cartService = new CartService();
		boolean isUpdateSuccess = false;

		if (request.getParameter("letter") != null) { // 편지 삭제에 대한 요청인지 확인하고 맞으면 편지 업데이트
			int c_letter = Integer.parseInt(request.getParameter("letter"));

			isUpdateSuccess = cartService.modifyLetter(c_id, c_letter);

		} else { // 아니면 수량 변경에 대한 요청이므로 수량 업데이트

			int add = Integer.parseInt(request.getParameter("add")); // +1 또는 -1 수정

			CartBean cartBean = cartService.selectCart(c_id);

			int c_qty = cartBean.getC_qty();
			int i_id = cartBean.getI_id();

			ItemDetailService itemDetailService = new ItemDetailService();
			ItemBean itemBean = itemDetailService.selectItem(i_id);
			int i_inven = itemBean.getI_inven(); // 아이템 재고현황

			if (c_qty == 1 && add != -1) { // 수량이 1 일때 -1계산이 안되도록
				c_qty = c_qty + add;
			} else if (c_qty > 1 && c_qty <= i_inven) { // 1~재고까지 수정가능
				c_qty = c_qty + add;
			}

			isUpdateSuccess = cartService.modifyCart(c_id, c_qty);

		}

		if (!isUpdateSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('장바구니 수정 실패!');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("Cart.cr");
			forward.setRedirect(true); // 수정 후 정보가지고 갈 필요없음
		}

		return forward;
	}
}
