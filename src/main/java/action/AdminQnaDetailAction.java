package action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminQnaDetailService;
import vo.ActionForward;
import vo.QnaBean;

public class AdminQnaDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		AdminQnaDetailService service = new AdminQnaDetailService();
		QnaBean qnaBean = service.getQnaDetail(Integer.parseInt(request.getParameter("q_id")));
		String command = request.getServletPath();
		request.setAttribute("qnaBean", qnaBean);
		if(command.equals("/QnaDetail.ad")) {
			forward = new ActionForward();
			forward.setPath("./admin_layout/qna_management/qna_detail.jsp");
		}else if(command.equals("/WriteAnswer.ad")) {
			forward = new ActionForward();
			forward.setPath("./admin_layout/qna_management/qna_answer_form.jsp");
		}
		return forward;
	}

}
