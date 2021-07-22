package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		int iNum = Integer.parseInt(request.getParameter("iNum"));

		CartListService cartListService = new CartListService(); // 장바구니 선택 목록 가져오기
		ArrayList<CartBean> checkList = new ArrayList<CartBean>();
		CartBean cartDetail = null;
		for(int i = 0 ; i < iNum ; i++) {
			if(request.getParameter("c_id" + i) != null) {
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
		int letterCount = 0;
		for (CartBean cb : checkList) { // 장바구니 선택목록에 해당하는 아이템 목록 추려내기
			itemBean = itemDetailService.selectItem(cb.getI_id());
			letterCount += cb.getC_letter();
			itemList.add(itemBean);
		}
		
		request.setAttribute("itemList", itemList); // 아이템목록 리스트에 저장

		if (letterCount > 0) { // 추가 상품으로 편지가 선택되었으면 letter.jsp로 이동

			forward = new ActionForward();
			forward.setPath("./order/letter.jsp?letterCount=" + letterCount);
			forward.setRedirect(false);

		} else { // 추가상품 편지가 없으면 OrderForm.od로 이동

			forward = new ActionForward();
			forward.setPath("OrderForm.od");
			forward.setRedirect(false);
		}

		return forward;
	}

}
