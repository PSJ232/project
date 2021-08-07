package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReviewListService;
import vo.ActionForward;
import vo.PageInfo;
import vo.ReviewBean;

public class AdminReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		ReviewListService service = new ReviewListService();
		int page = 1;	
		int limit = 10;	
		int listCount = service.getListCount();
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int maxPage = (int)((double)listCount / limit + 0.9);
		
		int pageLimit = 10; 
		int startPage = ((int)((double)page / pageLimit + 0.9) - 1) * pageLimit + 1;
		
		int endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		String filter = "";
		if(request.getParameter("filter") != null) {
			filter = request.getParameter("filter");
		}
		ArrayList<ReviewBean> reviewList = service.getReviewList(page, limit, filter);
		PageInfo pageInfo = new PageInfo(page, listCount, maxPage, startPage, endPage);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("reviewList", reviewList);
		forward.setPath("./admin_layout/review_management/review_list.jsp");
		return forward;
	}

}
