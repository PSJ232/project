package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminMemberSearchService;
import svc.AdminOrderSearchService;

public class AdminSearchAction {
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String command = request.getServletPath();
		String search_val = request.getParameter("search_val");
		String filter = request.getParameter("filter");
		
		if(command.equals("/OrderSearch.ad")) {
			AdminOrderSearchService service = new AdminOrderSearchService();
			PrintWriter out;
			try {
				out = response.getWriter();
				out.write(service.getJSON(search_val, filter));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberSearch.ad")) {
			AdminMemberSearchService service = new AdminMemberSearchService();
			PrintWriter out;
			try {
				out = response.getWriter();
				out.write(service.getJSON(search_val, filter));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
