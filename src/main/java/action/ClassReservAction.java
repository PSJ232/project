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
		
//		String f_subject = request.getParameter("f_subject");
		String f_subject = "flower";  
//		String f_place = request.getParameter("f_place");
		String f_place = "서면";
		//회원쪽 class 페이지 만드시면 
		//f_subject, f_place값중에 맨 첫번쨰 값 넘겨주시고 위의 변수초기화식으로 바꿔주세요~
		
		ClassReservService classReservService = new ClassReservService();

		//1. 전달 받은 f_place 값으로 f_id조회후 
		int f_id = classReservService.getClassId(f_place, f_subject);
		
		//2. f_id값으로 ClassBean 객체 담아서 setAttribute
		ClassDetailViewService classDetailViewService = new ClassDetailViewService();
		ClassBean cb = classDetailViewService.getDetailContent(f_id);
		
		request.setAttribute("classDetail", cb);
		forward = new ActionForward();
		forward.setPath("./admin_layout/class_member/classReserv.jsp");

		
		
		
		return forward;
	}

}
