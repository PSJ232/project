package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

import svc.ClassReservService;
import vo.ActionForward;

public class ReservClassTimeAction{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReservClassTimeAction - execute");
		
		int f_id = Integer.parseInt(request.getParameter("f_id"));
		
		ClassReservService classReservService = new ClassReservService();
		ArrayList<Integer> reservTimeList = classReservService.getTimeList(f_id);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String gson = new Gson().toJson(reservTimeList);
		response.getWriter().write(gson);
	}

}
