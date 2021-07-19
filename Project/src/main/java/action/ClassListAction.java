package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ClassDetailListService;
import svc.ClassListService;
import vo.ActionForward;
import vo.ClassBean;
import vo.ClassDetailBean;

public class ClassListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		ArrayList<ClassBean> classList = new ArrayList<ClassBean>();
		ClassListService service = new ClassListService();
		classList = service.getClassList();
		ClassDetailListService detail_service = new ClassDetailListService();
		ArrayList<ClassDetailBean> classDetailList = detail_service.getDetailList();
		if(classList != null) {
			request.setAttribute("classDetailList", classDetailList);
			request.setAttribute("classList", classList);
			forward = new ActionForward();
			forward.setPath("./admin_layout/class_management/classList.jsp");
			forward.setRedirect(false);
		}
		return forward;
	}

}
