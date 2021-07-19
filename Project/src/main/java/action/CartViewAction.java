package action;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.CartListService;
import vo.ActionForward;
import vo.CartBean;


public class CartViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CartViewAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		
		CartListService cartListService = new CartListService();
		ArrayList<CartBean> cartList = cartListService.selectCart(m_id);
		
		request.setAttribute("cartList", cartList);
		
		
		forward = new ActionForward();
		forward.setPath("./order/cart.jsp"); 
		forward.setRedirect(false);
		
		return forward;
	}

}
