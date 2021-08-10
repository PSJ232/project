package action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import svc.ClassReservService;
import vo.ActionForward;
import vo.ClassBean;

public class ReservClassPlaceAction{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReservClassPlaceAction -execute()");
		ActionForward forward = null;

		String f_subject = request.getParameter("f_subject");
		String f_cdate = request.getParameter("f_cdate");
		System.out.println("f_subject"+f_subject);
		System.out.println("f_cdate"+f_cdate);
		ClassReservService classReservService = new ClassReservService();
		
		//1. 전달 받은 f_subject로 f_place, f_id들 받아서 배열로 저장 후 전달
		JSONArray placeList = classReservService.getPlaceNFidList(f_subject, f_cdate);
		System.out.println(placeList);
		Gson gson = new Gson();
		String jsonOutput = gson.toJson(placeList);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonOutput);
	}

}
