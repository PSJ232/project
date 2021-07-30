package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberDeleteFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberDeleteFormAction");
		ActionForward forward = null;

		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");
		
		MemberService memberService = new MemberService();
		MemberBean memberBean = memberService.selectMember(m_id);
		
		request.setAttribute("memberBean", memberBean);

		forward = new ActionForward();
		forward.setPath("./member/delete.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
