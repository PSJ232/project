package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.CartService;
import svc.IdMakerService;
import vo.ActionForward;
import vo.CartBean;

public class CartInsertProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CartInsertProAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		int i_id = Integer.parseInt(request.getParameter("i_id"));
		
		IdMakerService idMakerService = new IdMakerService();
		int newId = idMakerService.newId("cart", "c_id"); // 번호생성(MAX+1)
		
		CartBean cartBean = new CartBean();
		cartBean.setC_id(newId);
		cartBean.setM_id(m_id);
		cartBean.setI_id(i_id);
		cartBean.setC_qty(Integer.parseInt(request.getParameter("c_qty")));
		cartBean.setC_letter(Integer.parseInt(request.getParameter("c_letter")));
		cartBean.setC_delivery_date(request.getParameter("c_delivery_date"));
		if(request.getParameter("sub_option") != null) {
			cartBean.setSub_option(Integer.parseInt(request.getParameter("sub_option")));
		}
		
		CartService cartService = new CartService();
		boolean isInsertSuccess = cartService.putCart(cartBean);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(!isInsertSuccess) {
			out.println("<script>");
			out.println("alert('장바구니 담기 실패!');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("window.open('../project/order/cart_popup.jsp', 'cart', 'width=500, height=220, top=300, left=300');");
			out.println("history.back();");
			out.println("</script>");
			
			//팝업창으로 대신하기때문에 직접 경로를 이동하지 않음
//			forward = new ActionForward();
//			forward.setPath("Cart.cr"); 
//			forward.setRedirect(false);
		}
		
		return forward;
	}

}
