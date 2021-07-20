package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ItemDetailService;
import svc.MemberDetailService;
import vo.ActionForward;
import vo.ItemBean;
import vo.MemberBean;

public class OrderInsertFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderInsertFormAction");
		ActionForward forward = null;
		
		
		int iNum = Integer.parseInt(request.getParameter("iNum"));
		int i_id = 0;
		
		
		/////////////////////////////////////////여기 작업중
		//letter.jsp에서 arraylist(장바구니,아이템)setAttri를 하면 여기서 확인이 가능할까?
		request.getParameter("l_id" + iNum);
		request.getParameter("c_id" + iNum);
		request.getParameter("c_qty" + iNum);
		
		for(int i = 0; i < iNum; i++) {
			i_id = Integer.parseInt(request.getParameter("i_id" + iNum));
			
			
			
			
			ItemDetailService itemdetailService = new ItemDetailService();
			ItemBean itemDetail = itemdetailService.selectItem(i_id);
			request.setAttribute("itemDetail", itemDetail);
			
		}
		
		
		
		
		
		
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
