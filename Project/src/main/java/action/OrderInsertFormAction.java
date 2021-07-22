package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberDetailService;
import vo.ActionForward;
import vo.MemberBean;

public class OrderInsertFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderInsertFormAction");
		ActionForward forward = null;

		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id"); // 회원 정보 추출
		
		MemberDetailService memberDetailService = new MemberDetailService();
		MemberBean memberDetail  = memberDetailService.selectMember(m_id);
		request.setAttribute("memberDetail", memberDetail); // 회원 정보 디테일 저장
		
		
		forward = new ActionForward();
		forward.setPath("./order/insert.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
