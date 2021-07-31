package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ItemDetailService;
import vo.ActionForward;
import vo.CartBean;
import vo.ItemBean;

public class VisitorCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("VisitorCartAction");
		ActionForward forward = null;
		
		int i_id = Integer.parseInt(request.getParameter("i_id")); // 상품번호
		int c_qty = Integer.parseInt(request.getParameter("c_qty")); // 상품 수량
		int c_letter = Integer.parseInt(request.getParameter("c_letter")); //편지지 선택 여부
		String c_delivery_date = request.getParameter("c_delivery_date"); //상품 배송 요청일
		
		CartBean cartDetail = new CartBean();
		cartDetail.setC_id(88888888);
		cartDetail.setI_id(i_id);
		cartDetail.setM_id("visitor"); // 비회원
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
