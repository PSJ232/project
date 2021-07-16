package action;

import java.sql.Time;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ClassDetailSelectTimelistService;
import vo.ActionForward;

public class ClassDetailSelectTimelistAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		ClassDetailSelectTimelistService service = new ClassDetailSelectTimelistService();
		ArrayList<Time> timeList = service.getTimeList(request.getParameter("place"), request.getParameter("date"));
		
		request.setAttribute("timeList", timeList);
		forward.setPath("admin_layout/class_management/timeSelect.jsp");
		
		return forward;
	}

}
