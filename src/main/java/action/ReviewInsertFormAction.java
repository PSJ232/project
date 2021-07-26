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
import vo.OrderDetailBean;

public class ReviewInsertFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewInsertFormAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		
		ReviewStatusService reviewStatusService = new ReviewStatusService();
		
		// 정보 출력을 위해 불러오는 파일들
		// 리뷰 미작성 : non~  || 리뷰 작성 : ~
		ArrayList<OrderBean> nonOrderArrayList = reviewStatusService.reviewNonStatusOrderList(m_id);
		ArrayList<OrderBean> orderArrayList = reviewStatusService.reviewStatusOrderList(m_id);
		ArrayList<ItemBean> nonItemArrayList = reviewStatusService.reviewNonStatusItemList(m_id);
		ArrayList<ItemBean> itemArrayList = reviewStatusService.reviewStatusItemList(m_id);
		ArrayList<OrderDetailBean> nonOrderDetailArrayList = reviewStatusService.reviewNonStatusOrderDetailList(m_id);
		ArrayList<OrderDetailBean> orderDetailArrayList = reviewStatusService.reviewStatusOrderDetailList(m_id);
		
		// review와 orders_detail 비교해 가져온 삭제된 리뷰 목록
		ArrayList<Integer> deleteOdList = reviewStatusService.reviewDeleteOdList(m_id);
		
		

		request.setAttribute("nonOrderArrayList", nonOrderArrayList);
		request.setAttribute("orderArrayList", orderArrayList);
		request.setAttribute("nonItemArrayList", nonItemArrayList);
		request.setAttribute("itemArrayList", itemArrayList);
		request.setAttribute("deleteOdList", deleteOdList);
		request.setAttribute("nonOrderDetailArrayList", nonOrderDetailArrayList);
		request.setAttribute("orderDetailArrayList", orderDetailArrayList);
		
		
//		command : /ReviewFormAction.rv
		forward = new ActionForward();
		forward.setPath("./mypage/reviewBefore.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}
