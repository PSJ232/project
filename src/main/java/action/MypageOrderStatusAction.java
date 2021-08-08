package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberService;
import vo.ActionForward;
import vo.MemberBean;
import vo.OrderBean;

public class MypageOrderStatusAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MypageOrderStatusAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		
		// 멤버 정보
		MemberService memberService = new MemberService();
		MemberBean memberMypageDetail = memberService.selectMember(m_id);
		request.setAttribute("memberMypageDetail", memberMypageDetail);
		
		// 구독 수
		ArrayList<Integer> subscribeList = memberService.selectSubscribe(m_id);
		request.setAttribute("subscribeList", subscribeList);
		
		// 주문 내역 
		// 		=> 결재 완료
		ArrayList<Integer> purchaseCount = memberService.selectPurchaseCount(m_id);
		request.setAttribute("purchaseCount", purchaseCount);
		// 		=> 상품 준비중
		ArrayList<Integer> makingCount = memberService.selectMakingCount(m_id);
		request.setAttribute("makingCount", makingCount);
		// 		=> 발송 완료
		ArrayList<Integer> sendCount = memberService.selectSendCount(m_id);
		request.setAttribute("sendCount", sendCount);

		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./mypage/mypage.jsp");
		
		return forward;
	}

}
