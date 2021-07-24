package action;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberAnniversaryService;
import svc.MemberDetailService;
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
		
		MemberDetailService memberDetailService = new MemberDetailService();
		MemberBean memberDetail  = memberDetailService.selectMember(m_id);
		request.setAttribute("memberDetail", memberDetail);
		
		MemberAnniversaryService memberAnniversaryService = new MemberAnniversaryService();
		ArrayList<AnniversaryBean> annList = memberAnniversaryService.getAnnList(m_id);
		request.setAttribute("annList", annList);
		
		forward = new ActionForward();
		forward.setPath("./member/update.jsp");
		forward.setRedirect(false);
	
		return forward;
	}

}
