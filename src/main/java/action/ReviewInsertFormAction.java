package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberService;
import svc.ReviewStatusService;
import vo.ActionForward;
import vo.ItemBean;
import vo.MemberBean;
import vo.OrderBean;
import vo.OrderDetailBean;

public class ReviewInsertFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewInsertFormAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		
		if(m_id == null) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("MemberLogin.me");
		} else {
			// 멤버 정보 전달
			MemberService memberService = new MemberService();
			MemberBean memberMypageDetail = memberService.selectMember(m_id);
			request.setAttribute("memberMypageDetail", memberMypageDetail);
			
			// 구독 수 전달
			ArrayList<Integer> subscribeList = memberService.selectSubscribe(m_id);
			request.setAttribute("subscribeList", subscribeList);
			
			// 기존의 리뷰 정보 출력을 위해 불러오는 파일들
			// 리뷰 미작성 : non~  || 리뷰 작성 : ~
			ReviewStatusService reviewStatusService = new ReviewStatusService();
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
			
			forward = new ActionForward();
			forward.setPath("./mypage/reviewBefore.jsp");
			forward.setRedirect(false);
		}

		return forward;

	}
	
}
