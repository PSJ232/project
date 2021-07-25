package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReviewDeleteProService;
import vo.ActionForward;

public class ReviewDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewDeleteProAction");
		ActionForward forward = null;
		
		int od_id = Integer.parseInt(request.getParameter("od_id"));
		
		ReviewDeleteProService reviewDeleteProService = new ReviewDeleteProService();
		boolean isDeleteSuccess = reviewDeleteProService.dropReview(od_id);
		
		if(isDeleteSuccess) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/ReviewInsertForm.rv");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('리뷰 삭제에 실패했습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		
		return forward;
	}

}
