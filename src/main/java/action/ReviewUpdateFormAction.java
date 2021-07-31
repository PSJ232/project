package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberService;
import svc.ReviewDetailService;
import vo.ActionForward;
import vo.MemberBean;
import vo.ReviewBean;

public class ReviewUpdateFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewUpdateFormAction");
		ActionForward forward = null;
		
		// 회원 정보 
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		
		MemberService memberService = new MemberService();
		MemberBean memberMypageDetail = memberService.selectMember(m_id);
		request.setAttribute("memberMypageDetail", memberMypageDetail);
		
		// 리뷰 정보
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
