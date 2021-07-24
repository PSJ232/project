package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ReviewStatusService;
import vo.ActionForward;
import vo.ItemBean;
import vo.OrderBean;

public class ReviewInsertFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewInsertFormAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		
		ReviewStatusService reviewStatusService = new ReviewStatusService();
		ArrayList<OrderBean> nonOrderArrayList = reviewStatusService.reviewNonStatusOrderList(m_id);
		ArrayList<OrderBean> orderArrayList = reviewStatusService.reviewStatusOrderList(m_id);
		ArrayList<ItemBean> nonItemArrayList = reviewStatusService.reviewNonStatusItemList(m_id);
		ArrayList<ItemBean> itemArrayList = reviewStatusService.reviewStatusItemList(m_id);
		ArrayList<Integer> nonOdList = reviewStatusService.reviewNonStatusOdList(m_id);
		ArrayList<Integer> odList = reviewStatusService.reviewStatusOdList(m_id);

		request.setAttribute("nonOrderArrayList", nonOrderArrayList);
		request.setAttribute("orderArrayList", orderArrayList);
		request.setAttribute("nonItemArrayList", nonItemArrayList);
		request.setAttribute("itemArrayList", itemArrayList);
		request.setAttribute("nonOdList", nonOdList);
		request.setAttribute("odList", odList);
		
		
//		command : /ReviewFormAction.rv
		forward = new ActionForward();
		forward.setPath("./mypage/reviewBefore.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}
