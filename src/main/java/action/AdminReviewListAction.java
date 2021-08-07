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
		int page = 1;	// 현재 페이지번호
		int limit = 10;	// 한 페이지에 표시할 게시물 개수
		int listCount = service.getListCount();
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		// 페이지 계산작업 수행
		int maxPage = (int)((double)listCount / limit + 0.9);
		
		// 현재 페이지에서 보여줄 시작 페이지 번호
		int pageLimit = 10; // 한페이지의 총 페이지 수
		int startPage = ((int)((double)page / pageLimit + 0.9) - 1) * pageLimit + 1;
		
		// 현재페이지에서 보여줄 마지막 페이지번호
		int endPage = startPage + pageLimit - 1;
		
		// 마지막 페이지가 현재 페이지에서 표시할 최대 페이지수보다 클 경우
		// 마지막 페이지번호를 마지막 페이지번호로 대체
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
