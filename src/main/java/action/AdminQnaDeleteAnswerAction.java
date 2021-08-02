package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.QnaService;
import vo.ActionForward;

public class AdminQnaDeleteAnswerAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		QnaService service = new QnaService();
		System.out.println(request.getParameter("q_id"));
		boolean isDeleteSuccess = service.deleteAnswer(Integer.parseInt(request.getParameter("q_id")), Integer.parseInt(request.getParameter("q_re_ref")));
		if(isDeleteSuccess) {
			forward = new ActionForward();
			forward.setPath("QnaList.ad");
			forward.setRedirect(true);
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
