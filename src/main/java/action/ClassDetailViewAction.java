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
		request.setAttribute("classBean", classBean);
		ClassDetailSelectTimelistService time_service = new ClassDetailSelectTimelistService();
		
		if(command.equals("/ClassModifyForm.ad")) {
			// 가지고있던 timeList 값 반환
			ArrayList<Time> selectableTimeList = time_service.getSelectableTimeList(classBean.getClass_place(), classBean.getClass_date());
			request.setAttribute("selectableTimeList", selectableTimeList);
			forward.setPath("./admin_layout/class_management/classModifyForm.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/ClassDetailView.ad")) {
			ArrayList<Time> selectedTimeList = time_service.getSelectedTimeList(classBean.getClass_id());
			request.setAttribute("selectedTimeList", selectedTimeList);
			forward.setPath("./admin_layout/class_management/classDetail.jsp");
			forward.setRedirect(false);
		}
		
		return forward;
	}

}
