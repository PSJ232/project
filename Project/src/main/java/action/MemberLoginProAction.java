package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberLoginProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberLoginProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberLoginProAction");
		ActionForward forward = null;
		HttpSession session = request.getSession();
		
		MemberBean memberBean = new MemberBean();
		
		memberBean.setM_id(request.getParameter("m_id"));
		memberBean.setM_pass(request.getParameter("m_pass"));
		
		MemberLoginProService memberLoginProService = new MemberLoginProService();
		boolean isLoginSuccess = memberLoginProService.checkMember(memberBean);
		
		if(!isLoginSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('로그인 실패!');");
			out.print("history.back();");
			out.print("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("./"); // 메인화면 주소 미정, 임시주소
			forward.setRedirect(true);
			session.setAttribute("m_id", request.getParameter("m_id"));
		}
		
		// 포워딩 정보가 저장된 ActionForward 객체 리턴
		return forward;
	}

}
