package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminMemberDetailService;
import vo.ActionForward;
import vo.MemberBean;
import vo.OrderBean;

public class AdminMemberDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		AdminMemberDetailService service = new AdminMemberDetailService();
		String m_id = request.getParameter("m_id");
		MemberBean memberBean = service.getMemberDetail(m_id);
		ArrayList<OrderBean> orderList = service.getMemberOrders(m_id);
		System.out.println(orderList.toString());
		
		request.setAttribute("memberBean", memberBean);
		request.setAttribute("orderList", orderList);
		
		forward = new ActionForward();
		forward.setPath("./admin_layout/member_management/memberDetail.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
