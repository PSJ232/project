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
import vo.OrderDetailBean;

public class OrderLetterAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderLetterAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");

		int iNum = Integer.parseInt(request.getParameter("iNum")); // 선택된 상품의 수
		
		int c_letter = 0; // 바로구매 기능을 위한 편지지 포함 여부 확인 변수
		if (Integer.parseInt(request.getParameter("l_id0")) > 0) { // l_id 정보를 이용해 c_letter값 설정
			c_letter += 1;
		}

		ArrayList<OrderDetailBean> orderFormInfo = new ArrayList<OrderDetailBean>();
		OrderDetailBean ob = null;
		for (int i = 0; i < iNum; i++) { // 장바구니 상품 수 만큼 반복해서 파라미터 값 가져오기
			ob = new OrderDetailBean();
			ob.setC_id(Integer.parseInt(request.getParameter("c_id" + i)));
			ob.setI_id(Integer.parseInt(request.getParameter("i_id" + i)));
			ob.setOd_qty(Integer.parseInt(request.getParameter("c_qty" + i)));
			ob.setL_id(Integer.parseInt(request.getParameter("l_id" + i)));
			ob.setOd_message(request.getParameter("od_message" + i));
			ob.setOd_delivery_date(request.getParameter("od_delivery_date" + i));

			orderFormInfo.add(ob); // Bean에 넣어서 ArraList에 저장
		}
		request.setAttribute("orderFormInfo", orderFormInfo); // letter.jsp에서 넘겨받은 정보를 request에 저장

		ArrayList<CartBean> checkList = new ArrayList<CartBean>();
		CartBean cartDetail = null;

		if(iNum > 1) { // 선택된 상품의 수가 1을 초과할 경우 장바구니에서 조회
		
			CartListService cartListService = new CartListService(); // 장바구니 선택 목록 가져오기
			for (int i = 0; i < iNum; i++) {
				if (request.getParameter("c_id" + i) != null) {
					int c_id = Integer.parseInt(request.getParameter("c_id" + i));
					cartDetail = new CartBean();
					cartDetail = cartListService.selectCart(c_id);
					checkList.add(cartDetail);
				}
			}
		} else {
			cartDetail = new CartBean();
			cartDetail.setC_id(99999999);// 바로 구매는 장바구니 번호가 없으므로 null오류를 없애기 위해 임의의 숫자입력
			cartDetail.setI_id(Integer.parseInt(request.getParameter("i_id0")));
			cartDetail.setM_id(m_id);
			cartDetail.setC_qty(Integer.parseInt(request.getParameter("c_qty0")));
			cartDetail.setC_letter(c_letter);
			cartDetail.setC_delivery_date(request.getParameter("od_delivery_date0"));
			checkList.add(cartDetail);
			
		}
		request.setAttribute("checkList", checkList); // 선택목록 리스트에 저장
		
		
		// 선택목록(장바구니) 안에 해당하는 아이템 목록 가져올 준비
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
