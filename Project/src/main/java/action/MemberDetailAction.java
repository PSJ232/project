package action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberDetailService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		
		MemberDetailService memberDetailService = new MemberDetailService();
				
		MemberBean memberDetail  = memberDetailService.selectMember(m_id);
		
		request.setAttribute("memberDetail", memberDetail);
		
		forward = new ActionForward();
		forward.setPath("./member/update.jsp");
		forward.setRedirect(false);
	
		return forward;
	}

}
