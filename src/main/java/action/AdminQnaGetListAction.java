package action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.QnaService;
import vo.ActionForward;

public class AdminQnaGetListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		QnaService service = new QnaService();
		HashMap<String, Integer> qnaCount = service.getQnaCount();
		request.setAttribute("qnaCount", qnaCount);
		forward.setPath("./admin_layout/qna_management/qna_list.jsp");
		return forward;
	}

}
