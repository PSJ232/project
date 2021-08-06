package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminMemberDetailService;
import svc.AdminMemberSearchService;
import svc.AdminOrderSearchService;
import vo.PageInfo;

public class AdminSearchAction {
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String command = request.getServletPath();
		String search_val = request.getParameter("search_val");
		String filter = request.getParameter("filter");

		// 페이징 처리를 위한 변수 선언
		int page = 1;	// 현재 페이지번호
		int limit = 10;	// 한 페이지에 표시할 게시물 개수
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		
		if(command.equals("/OrderSearch.ad")) {
			AdminOrderSearchService service = new AdminOrderSearchService();
			PrintWriter out;
			try {
				out = response.getWriter();
				out.write(service.getJSON(search_val, filter, page, limit));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberSearch.ad")) {
			AdminMemberSearchService service = new AdminMemberSearchService();
			PrintWriter out;
			try {
				out = response.getWriter();
				out.write(service.getJSON(search_val, filter, page, limit));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else if(command.equals("/getReviewContent.ad")) {
			
			int r_id = Integer.parseInt(request.getParameter("r_id"));
			AdminMemberDetailService service = new AdminMemberDetailService();
			PrintWriter out;
			try {
				out = response.getWriter();
				out.write(service.getJSON(r_id));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
