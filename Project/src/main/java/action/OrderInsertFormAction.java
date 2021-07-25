package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberService;
import vo.ActionForward;
import vo.MemberBean;

public class OrderInsertFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderInsertFormAction");
		ActionForward forward = null;

		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id"); // 회원 정보 추출
		
		MemberService memberService = new MemberService();
		MemberBean memberDetail  = memberService.selectMember(m_id);
		request.setAttribute("memberDetail", memberDetail); // 회원 정보 디테일 저장
		
		int g_id = memberDetail.getG_id();
		float g_discount = memberService.getGradeDetail(g_id);
		request.setAttribute("g_discount", g_discount);
		
		forward = new ActionForward();
		forward.setPath("./order/insert.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
