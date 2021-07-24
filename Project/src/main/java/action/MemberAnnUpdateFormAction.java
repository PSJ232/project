package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberAnniversaryService;
import vo.ActionForward;
import vo.AnniversaryBean;

public class MemberAnnUpdateFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberAnnUpdateFormAction");
		ActionForward forward = null;
		
		int a_id = Integer.parseInt(request.getParameter("a_id"));
		
		MemberAnniversaryService memberAnniversaryService = new MemberAnniversaryService();
		AnniversaryBean annDetail = memberAnniversaryService.getAnn(a_id);
		
		request.setAttribute("annDetail", annDetail);
		
		forward = new ActionForward();
		forward.setPath("MemberAnnForm.me");
		forward.setRedirect(false);
		
		return forward;
	}

}
