package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.CartDetailService;
import vo.ActionForward;
import vo.CartBean;

public class CartUpdateFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		
		CartDetailService cartDetailService = new CartDetailService();
		CartBean cartDetail = cartDetailService.selectCart(m_id);
		
		request.setAttribute("cartDetail", cartDetail);
		
		
		forward = new ActionForward();
		forward.setPath("./order/cart.jsp"); 
		forward.setRedirect(false);
		
		return forward;
	}

}
