package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ItemDetailService;
import svc.MemberDetailService;
import vo.ActionForward;
import vo.CartBean;
import vo.ItemBean;
import vo.MemberBean;

public class OrderInsertFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderInsertFormAction");
		ActionForward forward = null;
		
		/////////////////일단 편지지가 없을때 먼저 ...코드 작업 중
		ArrayList<CartBean> cartList = (ArrayList<CartBean>) request.getAttribute("cartList"); //장바구니(&단일상품)에서 가져온 상품목록
		ArrayList<ItemBean> itemList = (ArrayList<ItemBean>) request.getAttribute("itemList"); //장바구니(&단일상품)에 담긴 아이템디테일 목록(담긴순서동일)
		
		request.setAttribute("cartList", cartList); // 값을 계속 가져가기 위해 다시 저장 
		request.setAttribute("itemList", itemList); // 값을 계속 가져가기 위해 다시 저장 
		
		
		
//		int iNum = Integer.parseInt(request.getParameter("iNum"));
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		
		MemberDetailService memberDetailService = new MemberDetailService();
		MemberBean memberDetail  = memberDetailService.selectMember(m_id);
		request.setAttribute("memberDetail", memberDetail);
		
		
		forward = new ActionForward();
		forward.setPath("./order/insert.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
