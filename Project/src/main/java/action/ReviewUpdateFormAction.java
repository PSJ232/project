package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReviewDetailService;
import vo.ActionForward;
import vo.ReviewBean;

public class ReviewUpdateFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewUpdateFormAction");
		ActionForward forward = null;
		
		int od_id = Integer.parseInt(request.getParameter("od_id"));
		
		ReviewDetailService reviewDetailService = new ReviewDetailService();
		ReviewBean rb = reviewDetailService.selectReview(od_id);
		
		request.setAttribute("rb", rb);
		
		forward = new ActionForward();
		forward.setPath("./mypage/reviewUpdate.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
