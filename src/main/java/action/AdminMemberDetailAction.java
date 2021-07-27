package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminMemberDetailService;
import svc.AdminOrderSearchService;
import svc.ReviewListService;
import vo.ActionForward;
import vo.MemberBean;
import vo.OrderBean;
import vo.DetailBean;

public class AdminMemberDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		AdminMemberDetailService service = new AdminMemberDetailService();
		String m_id = request.getParameter("m_id");
		MemberBean memberBean = service.getMemberDetail(m_id);
		AdminOrderSearchService o_service = new AdminOrderSearchService();
		ArrayList<DetailBean> orderList = o_service.getMemberOrders(m_id);
		ReviewListService r_service = new ReviewListService();
		ArrayList<DetailBean> reviewList = r_service.getMemberReviewList(m_id);
		
		request.setAttribute("memberBean", memberBean);
		request.setAttribute("orderList", orderList);
		request.setAttribute("reviewList", reviewList);
		
		forward = new ActionForward();
		forward.setPath("./admin_layout/member_management/memberDetail.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
