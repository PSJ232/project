package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberService;
import svc.QnaService;
import vo.ActionForward;
import vo.MemberBean;
import vo.QnaBean;

public class QnaListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("QnaListAction");

		ActionForward forward = null;

		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");
		
		MemberService memberService = new MemberService();
		MemberBean memberMypageDetail = memberService.selectMember(m_id);
		request.setAttribute("memberMypageDetail", memberMypageDetail);

		QnaService qnaService = new QnaService();
		ArrayList<QnaBean> qnaList = qnaService.getQnaList(m_id);
		request.setAttribute("qnaList", qnaList);

		forward = new ActionForward();
		forward.setPath("./mypage/qnaList.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
