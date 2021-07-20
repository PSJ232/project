package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ReviewStatusService;
import vo.ActionForward;
import vo.OrderBean;

public class ReviewInsertFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewInsertFormAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		
		ReviewStatusService reviewStatusService = new ReviewStatusService();
		ArrayList<OrderBean> nonArrayList = reviewStatusService.reviewNonStatus(m_id);
		ArrayList<OrderBean> arrayList = reviewStatusService.revieStatus(m_id);
//		ArrayList<OrderBean> rb2 = new ReviewStatusService("m_id");
		
		request.setAttribute("nonArrayList", nonArrayList);
		request.setAttribute("arraList", arrayList);
		
		forward = new ActionForward();
		forward.setPath("./mypage/reviewBefore.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}
