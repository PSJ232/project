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
//장바구니에 담긴 상품 리스트 보여주는 Action
public class CartViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CartViewAction");
		ActionForward forward = null;

		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");

		CartListService cartListService = new CartListService();
		ArrayList<CartBean> cartList = cartListService.selectCart(m_id);

		request.setAttribute("cartList", cartList);

		ArrayList<ItemBean> itemList = new ArrayList<ItemBean>();
		ItemDetailService itemDetailService = new ItemDetailService();
		ItemBean itemBean = null;
		for (CartBean cb : cartList) {
			itemBean = itemDetailService.selectItem(cb.getI_id());
			itemList.add(itemBean);
		}

		request.setAttribute("itemList", itemList);

		forward = new ActionForward();
		forward.setPath("./order/cart.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
