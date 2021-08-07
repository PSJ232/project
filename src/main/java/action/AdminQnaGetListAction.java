package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.google.gson.Gson;

import svc.QnaService;
import vo.ActionForward;
import vo.PageInfo;
import vo.QnaBean;

public class AdminQnaGetListAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		JSONArray qnaList = new JSONArray();
		String activeTab = request.getParameter("activeTab");
		QnaService service = new QnaService();
		int listCount = service.getListCount();
		int page = 1;	
		int limit = 10;	
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int maxPage = (int)((double)listCount / limit + 0.9);
		
		int pageLimit = 10; 
		int startPage = ((int)((double)page / pageLimit + 0.9) - 1) * pageLimit + 1;
		
		int endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pageInfo = new PageInfo(page, listCount, maxPage, startPage, endPage);
		String pageJson = new Gson().toJson(pageInfo);
		PrintWriter out;
		if(activeTab.equals("tab1")) {
			String json = new Gson().toJson(service.getBeforeQnaList(page, limit));
			json = "{\"result\":["+json+"],\"page\":["+ pageJson +"]}";
			try {
				out = response.getWriter();
				out.write(json);
			} catch (IOException e) {
				e.printStackTrace();
				}
		}else {
			String json = new Gson().toJson(service.getAfterQnaList(page, limit));
			json = "{\"result\":["+json+"]}";
			try {
				out = response.getWriter();
				out.write(json);
			} catch (IOException e) {
				e.printStackTrace();
				}
		}
	}

}
