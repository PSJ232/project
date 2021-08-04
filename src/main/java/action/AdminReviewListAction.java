package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReviewListService;
import vo.ActionForward;
import vo.ReviewBean;

public class AdminReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		ReviewListService service = new ReviewListService();
		ArrayList<ReviewBean> reviewList = service.getReviewList();
		request.setAttribute("reviewList", reviewList);
		forward.setPath("./admin_layout/review_management/review_list.jsp");
		return forward;
	}

}
