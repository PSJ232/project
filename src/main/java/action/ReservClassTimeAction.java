package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ClassReservService;
import vo.ActionForward;

public class ReservClassTimeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReservClassTimeAction - execute");
		ActionForward forward = null;
		
		int f_id = Integer.parseInt(request.getParameter("f_id"));
		
		ClassReservService classReservService = new ClassReservService();
		ArrayList<Integer> reservTimeList = classReservService.getTimeList(f_id);
		
		request.setAttribute("reservTimeList", reservTimeList);
		
		forward = new ActionForward();
		forward.setPath("./admin_layout/class_member/classReservTimeList.jsp");
		
		return forward;
	}

}
