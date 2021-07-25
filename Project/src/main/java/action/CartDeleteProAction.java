package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.CartService;
import vo.ActionForward;

public class CartDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CartDeleteProAction");
		ActionForward forward = null;

		int c_id = Integer.parseInt(request.getParameter("c_id"));

		CartService cartService = new CartService();
		boolean isItemDeleteSuccess = cartService.dropItem(c_id);

		if (!isItemDeleteSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('장바구니 삭제 실패!');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("Cart.cr");
			forward.setRedirect(true); // 삭제 후 정보가지고 갈 필요없음
		}

		return forward;
	}

}
