package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ClassInsertService;
import vo.ActionForward;

public class ClassInsertFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ClassInsertFormAction - execute");
		ActionForward forward = new ActionForward();
		ClassInsertService service = new ClassInsertService();
		service.deleteNull();
		forward.setPath("./admin_layout/class_management/classManagementInsert.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
