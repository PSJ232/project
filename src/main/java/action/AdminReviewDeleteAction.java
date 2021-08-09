package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminDeleteReviewService;
import vo.ActionForward;

public class AdminReviewDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		AdminDeleteReviewService service = new AdminDeleteReviewService();
		
		boolean isDeleteSuccess = service.deleteAdminReview(Integer.parseInt(request.getParameter("r_id")));
		if(isDeleteSuccess) {
			forward = new ActionForward();
			forward.setPath("ReviewList.ad");
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
