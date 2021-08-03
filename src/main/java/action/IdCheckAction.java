package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.IdCheckService;
import vo.ActionForward;
import vo.MemberBean;

public class IdCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("IdCheckAction");
		ActionForward forward = null;
		String result = "";
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String m_id = request.getParameter("m_id");
		System.out.println("m_id : " + m_id );
		
		IdCheckService idCheckService = new IdCheckService();
		MemberBean memberBean =  idCheckService.checkMemberId(m_id);
		
		if(memberBean == null) {
			result = "사용 가능한 이메일 입니다.";
		} else {
			result = "이미 사용하고 있는 아이디 입니다.";
		}
		
		request.setAttribute("result", result);
		
		forward = new ActionForward();
		forward.setPath("./member/idCheck.jsp");
		forward.setRedirect(false);
		
		
		return forward;
	}

}
