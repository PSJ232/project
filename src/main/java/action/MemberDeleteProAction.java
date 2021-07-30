package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberService;
import vo.ActionForward;

public class MemberDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberDeleteProAction");
		ActionForward forward = null;
		
		// 회원 삭제
		String m_pass = request.getParameter("m_pass");
		String m_id = request.getParameter("m_id");
		MemberService memberService = new MemberService();
		boolean isDeleteSuccess = memberService.dropMember(m_id, m_pass);
		
		// 성공 시 로그인 화면으로 복귀
		if(isDeleteSuccess) {
			HttpSession session = request.getSession();
			session.invalidate();// 로그아웃처리
			
			forward = new ActionForward();
			forward.setPath("./"); // 홈화면
			forward.setRedirect(true);
		} else {
			// 실패 시 script로 실패했음을 표시
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원정보 삭제 실패했습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		return forward;
	}

	
}
