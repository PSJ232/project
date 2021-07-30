package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.OrderService;
import vo.ActionForward;

public class AdminInsertTrackingNumProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		OrderService service = new OrderService();
		System.out.println("od_id: " + request.getParameter("od_id"));
		System.out.println("num: " + request.getParameter("tracking_num"));
		boolean isInsertSuccess = service.InsertTrackingNum(Integer.parseInt(request.getParameter("od_id")), request.getParameter("tracking_num"));
		if(isInsertSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('운송장 등록 완료!');");
			out.println("window.close()");
			out.println("</script>");
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('운송장 등록 실패!');");
			out.println("history.back();");
			out.println("</script>");
		}
		return forward;
	}

}
