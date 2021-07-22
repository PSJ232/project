package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.CartDeleteProSerivce;
import svc.IdMakerService;
import vo.ActionForward;

public class CartDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CartDeleteProAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		int i_id = Integer.parseInt(request.getParameter("i_id"));
		
		IdMakerService idMakerService = new IdMakerService();
		int newId = idMakerService.newId("cart", "c_id"); 
		
		CartDeleteProSerivce cartDeleteProSerivce = new CartDeleteProSerivce();
		boolean isDeleteSuccess = cartDeleteProSerivce.dropCart(m_id, i_id);
		
		if(!isDeleteSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('장바구니 삭제 실패!');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("Cart.cr"); 
			forward.setRedirect(false);
		}
		
		
		
		
		
		
		return forward;
	}

}
