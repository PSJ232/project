package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.CartListService;
import svc.ItemDetailService;
import vo.ActionForward;
import vo.CartBean;
import vo.ItemBean;
import vo.OrderDetailBean;

public class OrderLetterAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderLetterAction");
		ActionForward forward = null;

		int iNum = Integer.parseInt(request.getParameter("iNum")); // 장바구니 선택목록의 수

		ArrayList<OrderDetailBean> orderFormInfo = new ArrayList<OrderDetailBean>();
		OrderDetailBean ob = null;
		for (int i = 0; i < iNum; i++) { // 장바구니 상품 수 만큼 반복해서 파라미터 값 가져오기
			ob = new OrderDetailBean();
			ob.setC_id(Integer.parseInt(request.getParameter("c_id" + i)));
			ob.setI_id(Integer.parseInt(request.getParameter("i_id" + i)));
			ob.setOd_qty(Integer.parseInt(request.getParameter("c_qty" + i)));
			ob.setL_id(Integer.parseInt(request.getParameter("l_id" + i)));
			ob.setOd_message(request.getParameter("od_message" + i));

			orderFormInfo.add(ob); // Bean에 넣어서 ArraList에 저장
		}
		request.setAttribute("orderFormInfo", orderFormInfo); // letter.jsp에서 넘겨받은 정보를 request에 저장

		CartListService cartListService = new CartListService(); // 장바구니 선택 목록 가져오기
		ArrayList<CartBean> checkList = new ArrayList<CartBean>();
		CartBean cartDetail = null;
		for (int i = 0; i < iNum; i++) {
			if (request.getParameter("c_id" + i) != null) {
				int c_id = Integer.parseInt(request.getParameter("c_id" + i));

				cartDetail = new CartBean();
				cartDetail = cartListService.selectCart(c_id);
				checkList.add(cartDetail);
			}
		}
		request.setAttribute("checkList", checkList); // 장바구니 선택목록 리스트에 저장

		
		
		// 장바구니 안에 해당하는 아이템 목록 가져올 준비
		ItemDetailService itemDetailService = new ItemDetailService();
		ArrayList<ItemBean> itemList = new ArrayList<ItemBean>();
		ItemBean itemBean = null;
		for (CartBean cb : checkList) { // 장바구니 선택목록에 해당하는 아이템 목록 추려내기
			itemBean = itemDetailService.selectItem(cb.getI_id());
			itemList.add(itemBean);
		}
		request.setAttribute("itemList", itemList); // 아이템목록 리스트에 저장

		forward = new ActionForward();
		forward.setPath("OrderForm.od");
		forward.setRedirect(false);

		return forward;
	}

}
