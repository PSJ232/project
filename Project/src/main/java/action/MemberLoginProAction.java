package action;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberService;
import vo.ActionForward;

public class MemberLoginProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberLoginProAction");
		ActionForward forward = null;
		
		String m_id = request.getParameter("m_id");
		String m_pass = request.getParameter("m_pass");
		String autoLogin = request.getParameter("autoLogin");
		
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
			
			if(autoLogin != null) { // 자동로그인이 체크 되어있으면 쿠키에 저장
				Cookie cookieId = new Cookie("m_id", m_id);
				cookieId.setMaxAge(60*60*24*30); // 30일간 쿠키 보관
				response.addCookie(cookieId);
				System.out.println("쿠키생성!!!");
			}
			
			forward = new ActionForward();
			forward.setPath("./"); // 메인화면 주소 미정, 임시주소
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
