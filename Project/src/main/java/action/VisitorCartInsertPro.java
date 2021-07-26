package action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;

public class VisitorCartInsertPro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("VisitorCartInsertPro");
		ActionForward forward = null;
		
		String i_id = request.getParameter("i_id");
		
		Cookie cookieCart = new Cookie(i_id+"0", i_id);
		cookieCart = new Cookie(i_id+"1", request.getParameter("c_qty"));
		cookieCart = new Cookie(i_id+"2", request.getParameter("c_letter"));
		cookieCart = new Cookie(i_id+"3", request.getParameter("c_delivery_date"));
		
		cookieCart.setMaxAge(60*60*24*7); // 7일간 쿠키 보관
		response.addCookie(cookieCart);
		
		
		forward = new ActionForward();
		forward.setPath("Cart.cr"); 
		forward.setRedirect(false);
		
		
		return forward;
	}

}
