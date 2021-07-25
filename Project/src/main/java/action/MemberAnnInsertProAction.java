package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.IdMakerService;
import svc.MemberAnniversaryService;
import vo.ActionForward;
import vo.AnniversaryBean;

public class MemberAnnInsertProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberAnnInsertProAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");
		
		IdMakerService idMakerService = new IdMakerService();
		int a_id = idMakerService.newId("anniversary", "a_id", 0);
		
		String a_date = request.getParameter("a_date");
		String a_name = request.getParameter("a_name");
		int a_repeat = Integer.parseInt(request.getParameter("a_repeat"));
		
		AnniversaryBean anniversaryBean = new AnniversaryBean();
		anniversaryBean.setA_id(a_id);
		anniversaryBean.setM_id(m_id);
		anniversaryBean.setA_date(a_date);
		anniversaryBean.setA_name(a_name);
		anniversaryBean.setA_repeat(a_repeat);
		
		MemberAnniversaryService memberAnniversaryService = new MemberAnniversaryService();
		boolean isInsertSuccess = memberAnniversaryService.registAnn(anniversaryBean);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(!isInsertSuccess) {
			out.println("<script>");
			out.println("alert('기념일 등록 실패!');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("opener.location.reload();");
			out.println("window.close();");
			out.println("</script>");
//			forward = new ActionForward();
//			forward.setPath("MemberAnnForm.me"); // 메인화면 주소 미정
//			forward.setRedirect(true);
		}
		
		return forward;
	}

}
