package action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ClassDetailInsertService;
import vo.ActionForward;
import vo.ClassDetailBean;

public class TimeAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		ClassDetailInsertService service = new ClassDetailInsertService();
		ClassDetailBean classDetailBean = new ClassDetailBean();
		String[] timeList = {};
		classDetailBean.setDate(request.getParameter("date"));
		classDetailBean.setPlace(request.getParameter("place"));
		System.out.println(request.getParameter("place"));
		timeList = request.getParameterValues("timeList");
		boolean isInsertSuccess = service.registArticle(classDetailBean, timeList);
		if(isInsertSuccess) {
			
		}else {
			forward = new ActionForward();
			forward.setPath("./admin_layout/class_management/selectClassDetail.jsp");
			forward.setRedirect(false);
		}
		return forward;
	}
	
}
