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
//장바구니에서 구매 시 연결되는 Action
public class OrderCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderCartAction");
		ActionForward forward = null;

		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id"); // 세션에서 m_id 가져오기

		CartListService cartListService = new CartListService(); // 장바구니 목록 가져오기
		ArrayList<CartBean> cartList = cartListService.selectCart(m_id);

		// 장바구니 안에 해당하는 아이템 목록 가져올 준비
		ItemDetailService itemDetailService = new ItemDetailService();
		ArrayList<ItemBean> itemList = new ArrayList<ItemBean>();
		ItemBean itemBean = null;
		int letterCheck = 0;
		for (CartBean cb : cartList) { // 장바구니 목록에 해당하는 아이템 목록 추려내기
			itemBean = itemDetailService.selectItem(cb.getI_id());
			letterCheck += cb.getC_letter();
			itemList.add(itemBean);
		}

		if (letterCheck > 0) { // 추가 상품으로 편지가 선택되었으면 letter.jsp로 이동
			request.setAttribute("cartList", cartList);
			request.setAttribute("itemList", itemList);

			forward = new ActionForward();
			forward.setPath("./order/letter.jsp");
			forward.setRedirect(false);

			return forward;

		} else { // 추가상품 편지가 없으면 OrderForm.od로 이동

			request.setAttribute("cartList", cartList);
			request.setAttribute("itemList", itemList);

			forward = new ActionForward();
			forward.setPath("OrderForm.od");
			forward.setRedirect(false);

			return forward;

		}

	}

}
