package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberLoginProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberLoginProAction");
		ActionForward forward = null;
		
		String m_id = request.getParameter("m_id");
		String m_pass = request.getParameter("m_pass");
		
		MemberService memberService = new MemberService();
		boolean isLoginSuccess = memberService.checkMember(m_id, m_pass);
		
		if(!isLoginSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('로그인 실패!');");
			out.print("history.back();");
			out.print("</script>");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("m_id", m_id);
			
			forward = new ActionForward();
			forward.setPath("./"); // 메인화면 주소 미정, 임시주소
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
