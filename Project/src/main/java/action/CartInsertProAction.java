package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.CartInsertProService;
import svc.IdMakerService;
import vo.ActionForward;
import vo.CartBean;

public class CartInsertProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		int i_id = Integer.parseInt(request.getParameter("i_id"));
		
//		수량일
//		편지추가
		
		IdMakerService idMakerService = new IdMakerService();
		int newId = idMakerService.newId("cart", "c_id");
		
		CartBean cartBean = new CartBean();
		cartBean.setC_id(newId);
		cartBean.setM_id(m_id);
		cartBean.setI_id(i_id);
		cartBean.setC_qty(Integer.parseInt(request.getParameter("c_qty")));
		
		CartInsertProService cartInsertProService = new CartInsertProService();
		boolean isInsertSuccess = cartInsertProService.putCart(cartBean);
		
		if(!isInsertSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('장바구니 담기 실패!');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("./order/cart.jsp"); 
			forward.setRedirect(true);
		}
 
		
		return forward;
	}

}
