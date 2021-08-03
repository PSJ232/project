package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminQnaInsertService;
import vo.ActionForward;
import vo.QnaBean;

public class AdminQnaWriteAnswerAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		AdminQnaInsertService service = new AdminQnaInsertService();
		QnaBean qnaBean = new QnaBean();
		qnaBean.setM_id(request.getParameter("m_id"));
		qnaBean.setO_id(Integer.parseInt(request.getParameter("o_id")));
		qnaBean.setQ_subject(request.getParameter("q_subject"));
		qnaBean.setQ_content(request.getParameter("q_content"));
		qnaBean.setQ_id(Integer.parseInt(request.getParameter("q_id")));
		boolean isWriteSuccess = service.qnaWrite(qnaBean);
		if(isWriteSuccess) {
			forward = new ActionForward();
			forward.setPath("QnaList.ad");
			forward.setRedirect(true);
		}
		return forward;
	}

}
