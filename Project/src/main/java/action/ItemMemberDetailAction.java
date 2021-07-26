package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ItemDetailService;
import svc.ReviewListService;
import vo.ActionForward;
import vo.ItemBean;
import vo.ReviewBean;

public class ItemMemberDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ItemMemberDetailAction");
		ActionForward forward = null;
		
		int i_id = Integer.parseInt(request.getParameter("i_id"));
		
		ItemDetailService itemDetailService = new ItemDetailService();
		ItemBean itemDetail = itemDetailService.selectItem(i_id);
		
		ReviewListService reviewListService = new ReviewListService();
		ArrayList<ReviewBean> rbList = reviewListService.selectReviewList(i_id);
		
		request.setAttribute("itemDetail", itemDetail);
		request.setAttribute("rbList", rbList);

		forward = new ActionForward();
		forward.setPath("./memberPage/itemDetail.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
