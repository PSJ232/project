package action;


import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ClassDetailInsertService;
import vo.ActionForward;
import vo.ClassDetailBean;

public class ClassTimeAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		ClassDetailInsertService service = new ClassDetailInsertService();
		ClassDetailBean classDetailBean = (ClassDetailBean)request.getAttribute("classBean");
		String[] timeList = {};
		classDetailBean.setDate(classDetailBean.getDate());
		classDetailBean.setPlace(classDetailBean.getPlace());
		timeList = (String[])request.getAttribute("timeList");
		boolean isInsertSuccess = service.registArticle(classDetailBean, timeList);
		if(isInsertSuccess) {
			forward = new ActionForward();
			forward.setPath("./admin_layout/class_management/selectClassDetail.jsp");
			forward.setRedirect(false);
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}
	
}
