package action;

import java.io.PrintWriter;
import java.sql.Time;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import svc.ReservClassNumService;
import vo.ActionForward;
import vo.ClassDetailBean;

public class ReservClassNumAction{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReservClassNumAction - execute");
//		ActionForward forward = null;
		int f_maxmem = 0;
		int fd_id = 0;
		int currentNum = 0;
		int remainNum = 0;
		
		String fc_date = request.getParameter("fc_date");
		String f_place = request.getParameter("f_place");
		String fd_time = request.getParameter("fd_time").trim();
		int f_id = Integer.parseInt(request.getParameter("f_id"));
		
		//한강의 수강가능 인원수
		ReservClassNumService reservClassNumService = new ReservClassNumService();
		f_maxmem = reservClassNumService.getMaxNum(f_id);
		
		//f_id 구하기
		ClassDetailBean cdb = new ClassDetailBean();
		cdb.setDate(fc_date);
		cdb.setPlace(f_place);
		
		System.out.println("fc_date : " + fc_date);
		System.out.println("f_place : " + f_place);
		System.out.println("fd_time : " + fd_time);
		fd_id = reservClassNumService.getClassDetailId(cdb, fd_time); 
		
		//수강중인 인원 
		currentNum = reservClassNumService.getCurrentNum(fd_id);
		
		remainNum = f_maxmem - currentNum;
		System.out.println("f_maxmem : " + f_maxmem);
		System.out.println("fd_id : " +fd_id);
		System.out.println("currentNum : " +currentNum);
		System.out.println("remainNum : " + remainNum);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String gson = new Gson().toJson(remainNum);
		response.getWriter().write(gson);
		
	}

}
