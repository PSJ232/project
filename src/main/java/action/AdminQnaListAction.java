package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.QnaService;
import vo.ActionForward;
import vo.QnaBean;

public class AdminQnaListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		ArrayList<QnaBean> qnaList = new ArrayList<QnaBean>();
		String activeTab = request.getParameter("activeTab");
		QnaService service = new QnaService();
		
		if(activeTab.equals("tab1")) {
			qnaList = service.getBeforeQnaList();
		}else {
			qnaList = service.getAfterClassList();
		}
		if(qnaList != null) {
			request.setAttribute("qnaList", qnaList);
			forward = new ActionForward();
			forward.setPath("./admin_layout/qna_management/get_qna_list.jsp");
			forward.setRedirect(false);
		}
		return forward;
	}

}
