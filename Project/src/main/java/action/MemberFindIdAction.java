package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberDetailService;
import vo.ActionForward;

public class MemberFindIdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberFindIdAction");
		ActionForward forward = null;
		
		String m_phone = request.getParameter("phone1") + request.getParameter("phone2") + request.getParameter("phone3");
		MemberDetailService memberDetailService = new MemberDetailService();
		String myId = memberDetailService.selectId(m_phone);
		
		
		if(myId == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('입력하신 정보와 일치하는 ID(이메일)가 존재하지 않습니다.');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			request.setAttribute("m_id", myId);
			forward = new ActionForward();
			forward.setPath("./member/findedId.jsp");
			forward.setRedirect(false);
		}
		return forward;
	}

}
