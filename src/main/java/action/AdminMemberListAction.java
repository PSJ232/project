package action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ChartService;
import vo.ActionForward;

public class AdminMemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HashMap<String, Integer> memberData = new HashMap<String, Integer>();
		ChartService service = new ChartService();
		memberData = service.getMemberData();
		request.setAttribute("memberData", memberData);
		forward = new ActionForward();
		forward.setPath("./admin_layout/member_management/memberList.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
