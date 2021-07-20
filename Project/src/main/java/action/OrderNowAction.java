package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ItemDetailService;
import vo.ActionForward;
import vo.CartBean;
import vo.ItemBean;
//바로구매 시 연결되는 Action
public class OrderNowAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderNowAction");
		ActionForward forward = null;

		// 단일 상품이지만 코드의 범용성을 높이기 위해 다중상품과 똑같이 ArrayList에 넣는 작업 실시

		int i_id = Integer.parseInt(request.getParameter("i_id")); // 상품아아디
		int c_qty = Integer.parseInt(request.getParameter("c_qty")); // 상품수량
		int c_letter = Integer.parseInt(request.getParameter("c_letter")); // 편지 추가 여부
		String c_delivery_date = request.getParameter("c_delivery_date"); // 배송 요청일

		CartBean cartBean = new CartBean(); // 넘겨받은 값을 저장할 CartBean
		cartBean.setI_id(i_id);
		cartBean.setC_qty(c_qty);
		cartBean.setC_letter(c_letter);
		cartBean.setC_delivery_date(c_delivery_date);

		ArrayList<CartBean> cartList = new ArrayList<CartBean>();
		cartList.add(cartBean);

		ArrayList<ItemBean> itemList = new ArrayList<ItemBean>();
		ItemDetailService itemDetailService = new ItemDetailService();
		ItemBean itemBean = itemDetailService.selectItem(i_id);
		itemList.add(itemBean);

		if (c_letter == 1) { // 추가상품으로 편지가 선택되었으면 letter.jsp로 이동

			request.setAttribute("cartList", cartList);
			request.setAttribute("itemList", itemList);
			forward = new ActionForward();
			forward.setPath("./order/letter.jsp?letterCount=1"); // 작성해야 될 편지지 수량(1) 가지고 감
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
