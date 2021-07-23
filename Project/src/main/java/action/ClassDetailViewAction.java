package action;

import java.sql.Time;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ClassDetailSelectTimelistService;
import svc.ClassDetailViewService;
import vo.ActionForward;
import vo.ClassBean;

public class ClassDetailViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		int class_num = Integer.parseInt(request.getParameter("class_num"));
		String command = request.getServletPath();
		ClassDetailViewService service = new ClassDetailViewService();
		ClassBean classBean = service.getDetailContent(class_num);
		ArrayList<Time> timeList = service.getTimeList(class_num, classBean.getClass_place());
		ClassDetailSelectTimelistService timeService = new ClassDetailSelectTimelistService();
		request.setAttribute("classBean", classBean);
		request.setAttribute("timeList", timeList);
		
		if(command.equals("/ClassModifyForm.ad")) {
			ArrayList<Time> selectableTimeList = timeService.getTimeList(classBean.getClass_place(), classBean.getClass_date());
			request.setAttribute("selectableTimeList", selectableTimeList);
			forward.setPath("./admin_layout/class_management/classModify.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/ClassDetailView.ad")) {
			
			forward.setPath("./admin_layout/class_management/classDetail.jsp");
			forward.setRedirect(false);
		}
		
		return forward;
	}

}
