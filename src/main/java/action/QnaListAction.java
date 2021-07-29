package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.QnaService;
import vo.ActionForward;
import vo.QnaBean;

public class QnaListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("=====================================================");
		System.out.println("QnaListAction - execute()");

		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		
		QnaService qnaService = new QnaService();
		ArrayList<QnaBean> qnaList = new ArrayList<QnaBean>();
		qnaList = qnaService.getQnaList(m_id);

		request.setAttribute("qnaList", qnaList);
		
		forward = new ActionForward();
		forward.setPath("./mypage/qnaList.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
