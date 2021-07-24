package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberAnniversaryService;
import vo.ActionForward;
import vo.AnniversaryBean;

public class MemberAnnUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberAnnUpdateProAction");
		ActionForward forward = null;
		
		
		
		int a_id = Integer.parseInt(request.getParameter("a_id"));
		String a_date = request.getParameter("a_date");
		String a_name = request.getParameter("a_name");
		int a_repeat = Integer.parseInt(request.getParameter("a_repeat"));

		AnniversaryBean anniversaryBean = new AnniversaryBean();
		anniversaryBean.setA_id(a_id);
		anniversaryBean.setA_date(a_date);
		anniversaryBean.setA_name(a_name);
		anniversaryBean.setA_repeat(a_repeat);
		
		MemberAnniversaryService memberAnniversaryService = new MemberAnniversaryService();
		boolean isUpdateSuccess = memberAnniversaryService.modifyAnn(anniversaryBean);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (!isUpdateSuccess) {
			out.println("<script>");
			out.println("alert('기념일 수정 실패!');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("window.close();");
			out.println("</script>");
			
//			forward = new ActionForward();
//			forward.setPath("MemberUpdate.me"); // 메인화면 주소 미정
//			forward.setRedirect(true);
		}

		return forward;
	}
}