package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ClassReservService;
import vo.ActionForward;
import vo.ClassBean;

public class ReservClassPlaceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;

		String f_subject = request.getParameter("f_subject");
		String f_place = request.getParameter("z");
		System.out.println("f_subject"+f_subject);
		System.out.println("f_place"+f_place);
		
		ClassReservService classReservService = new ClassReservService();
		
		//1. 전달 받은 f_subject로 f_place값들 받아서 배열로 저장 후 전달
		ArrayList<String> placeList = classReservService.getPlaceList(f_subject);
		for(String str: placeList) {
			System.out.println(str);
		}
		
		request.setAttribute("placeList", placeList);
		request.setAttribute("f_subject", f_subject);
		request.setAttribute("f_place", f_place);
		
		forward = new ActionForward();
		forward.setPath("./reservation/classReservPlaceList.jsp");
		
		return forward;
	}

}
