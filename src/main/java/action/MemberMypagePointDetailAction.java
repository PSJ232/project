package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberService;
import vo.ActionForward;
import vo.MemberBean;
import vo.ReviewBean;

public class MemberMypagePointDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberMypagePointDetailAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		
		MemberService memberService = new MemberService();
		
		// 멤버 정보
		MemberBean memberMypageDetail = memberService.selectMember(m_id);
		request.setAttribute("memberMypageDetail", memberMypageDetail);
		
		// 포인트 내역 정보
		ArrayList<ReviewBean> pbList = memberService.selectMemberPointList("m_id");
		request.setAttribute("pbList", pbList);
		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./mypage/memberPoint.jsp");
		
		return forward;
	}

}
