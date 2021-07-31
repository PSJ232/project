package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ItemDetailService;
import vo.ActionForward;
import vo.CartBean;
import vo.ItemBean;
//정기구독 주문시 연결되는 Action
public class OrderSubAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderSubAction");
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id"); // 회원아이디

		// 단일 상품이지만 코드의 범용성을 높이기 위해 다중상품과 똑같이 ArrayList에 넣는 작업 실시
		int i_id = Integer.parseInt(request.getParameter("i_id")); // 상품아아디
		int c_qty = Integer.parseInt(request.getParameter("c_qty")); // 상품수량
		int c_letter = Integer.parseInt(request.getParameter("c_letter")); // 편지 추가 여부
		String c_delivery_date = request.getParameter("c_delivery_date"); // 배송 요청일

		CartBean cartDetail = new CartBean(); // 넘겨받은 값을 저장할 CartBean
		
		cartDetail.setC_id(77777777); // 바로 구매는 장바구니 번호가 없으므로 구분을 위해 임의의 숫자사용
		cartDetail.setI_id(i_id);
		cartDetail.setM_id(m_id);
		cartDetail.setC_qty(c_qty);
		cartDetail.setC_letter(c_letter);
		cartDetail.setC_delivery_date(c_delivery_date);

		ArrayList<CartBean> checkList = new ArrayList<CartBean>();
		checkList.add(cartDetail);

		request.setAttribute("checkList", checkList); // 장바구니 선택목록 리스트에 저장

		ArrayList<ItemBean> itemList = new ArrayList<ItemBean>();
		ItemDetailService itemDetailService = new ItemDetailService();
		ItemBean itemBean = itemDetailService.selectItem(i_id);
		itemList.add(itemBean);

		request.setAttribute("itemList", itemList); // 아이템목록 리스트에 저장

		if (c_letter == 1) { // 추가상품으로 편지가 선택되었으면 letter.jsp로 이동

			forward = new ActionForward();
			forward.setPath("./order/letter.jsp?letterCount=1"); // 작성 편지수(1) 가지고 감 (단일상품이므로 1 고정값)
			forward.setRedirect(false);

		} else { // 추가상품 편지가 없으면 OrderForm.od로 이동

			forward = new ActionForward();
			forward.setPath("OrderForm.od");
			forward.setRedirect(false);

		}
		
		return forward;
	}

}
