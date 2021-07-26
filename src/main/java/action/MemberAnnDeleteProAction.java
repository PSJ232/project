package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberAnniversaryService;
import vo.ActionForward;

public class MemberAnnDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberAnnDeleteProAction");
		ActionForward forward = null;

		int a_id = Integer.parseInt(request.getParameter("a_id"));

		MemberAnniversaryService memberAnniversaryService = new MemberAnniversaryService();
		boolean isDeleteSuccess = memberAnniversaryService.dropAnn(a_id);

		if (!isDeleteSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('기념일 삭제 실패!');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("MemberUpdate.me"); // 메인화면 주소 미정
			forward.setRedirect(true);
		}

		return forward;
	}

}
