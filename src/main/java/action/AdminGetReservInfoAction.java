package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ClassDetailListService;

public class AdminGetReservInfoAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String place = request.getParameter("place");
		String time = request.getParameter("time");
		String date = request.getParameter("date");
		ClassDetailListService service = new ClassDetailListService();
		PrintWriter out;
		try {
			out = response.getWriter();
			out.write(service.getReservInfo(place, time, date));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
