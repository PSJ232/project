package action;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ClassDetailInsertService;
import vo.ActionForward;
import vo.ClassDetailBean;

public class ClassTimeAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ClassTimeAddAction");
		ActionForward forward = null;
		ClassDetailInsertService service = new ClassDetailInsertService();
		ClassDetailBean classDetailBean = (ClassDetailBean)request.getAttribute("detailBean");
		String[] timeList = {};
		classDetailBean.setDate(classDetailBean.getDate());
		classDetailBean.setPlace(classDetailBean.getPlace());
		timeList = (String[])request.getAttribute("timeList");
		System.out.println(classDetailBean.getDate());
		for(int i = 0; i < timeList.length; i++) {
			System.out.println(timeList[i]);
		}
		boolean isInsertSuccess = service.registArticle(classDetailBean, timeList);
		if(isInsertSuccess) {
			forward = new ActionForward();
			forward.setPath("ClassList.ad");
			forward.setRedirect(true);
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
