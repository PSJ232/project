package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.CartListService;
import svc.ItemDetailService;
import vo.ActionForward;
import vo.CartBean;
import vo.ItemBean;

public class OrderCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderCartAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		
		CartListService cartListService = new CartListService();
		ArrayList<CartBean> cartList = cartListService.selectCart(m_id);
		
		request.setAttribute("cartList", cartList);
		
		ArrayList<ItemBean> itemList = new ArrayList<ItemBean>();
		ItemDetailService itemDetailService = new ItemDetailService();
		ItemBean ib = null;
		for(CartBean cb : cartList) {
			ib = itemDetailService.selectItem(cb.getI_id());
			itemList.add(ib);
		}
		
		request.setAttribute("itemList", itemList);
		
		forward = new ActionForward();
		forward.setPath("./order/letter.jsp"); 
		forward.setRedirect(false);
		
		return forward;
	}

}
