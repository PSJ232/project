package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ClassDeleteService;
import vo.ActionForward;

public class ClassDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		ClassDeleteService service = new ClassDeleteService();
		int class_num = Integer.parseInt(request.getParameter("class_num"));
		boolean isDeleteSuccess = service.deleteClass(class_num);
		if(isDeleteSuccess) {
			forward = new ActionForward();
			forward.setPath("ClassList.ad");
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
