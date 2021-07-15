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
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		String i_id = request.getParameter("i_id");
		
		MemberDetailService memberDetailService = new MemberDetailService();
		MemberBean memberDetail  = memberDetailService.selectMember(m_id);
		request.setAttribute("memberDetail", memberDetail);
		
		ItemDetailService itemdetailService = new ItemDetailService();
		ItemBean itemDetail = itemdetailService.selectItem(i_id);
		
		
		
		return forward;
	}

}
