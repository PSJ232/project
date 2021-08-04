package action;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberAnniversaryService;
import svc.MemberService;
import vo.ActionForward;
import vo.AnniversaryBean;
import vo.MemberBean;

public class MemberUpdateFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberUpdateFormAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		
		// 멤버 정보 전달
		MemberService memberService = new MemberService();
		MemberBean memberDetail  = memberService.selectMember(m_id);
		request.setAttribute("memberDetail", memberDetail);
		
		// 구독 수 전달
		ArrayList<Integer> subscribeList = memberService.selectSubscribe(m_id);
		request.setAttribute("subscribeList", subscribeList);
		
		MemberAnniversaryService memberAnniversaryService = new MemberAnniversaryService();
		ArrayList<AnniversaryBean> annList = memberAnniversaryService.getAnnList(m_id);
		request.setAttribute("annList", annList);
		
		forward = new ActionForward();
		forward.setPath("./member/update.jsp");
		forward.setRedirect(false);
	
		return forward;
	}

}
