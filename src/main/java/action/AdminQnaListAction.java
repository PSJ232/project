package action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.QnaService;
import vo.ActionForward;
import vo.PageInfo;

public class AdminQnaListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		QnaService service = new QnaService();
		int page = 1;	
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		request.setAttribute("page", page);
		
		HashMap<String, Integer> qnaCount = service.getQnaCount();
		request.setAttribute("qnaCount", qnaCount);
		forward.setPath("./admin_layout/qna_management/qna_list.jsp");
		return forward;
	}

}
