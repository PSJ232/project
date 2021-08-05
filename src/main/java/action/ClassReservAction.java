package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ClassDetailViewService;
import svc.ClassReservService;
import vo.ActionForward;
import vo.ClassBean;

public class ClassReservAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		//플라워 클래스 리스트에서 받아온 f_id
		//int f_id = Integer.parseInt(request.getParameter("f_id"));
		int f_id = 2;

		ClassDetailViewService classDetailViewService = new ClassDetailViewService();
		ClassBean cb = classDetailViewService.getDetailContent(f_id);
		
		//ClassReserv.jsp로 넘겨주는 값
		request.setAttribute("cb", cb);
		
		//리턴값 설정
		forward = new ActionForward();
		forward.setPath("./reservation/classReserv.jsp");
		
		return forward;
	}

}