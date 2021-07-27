package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberMypageDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberMypageDetailAction");
		ActionForward forward = null;
		
		String command = request.getServletPath();
		System.out.println("command : " + command);
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		
		MemberService memberService = new MemberService();
		MemberBean memberMypageDetail = memberService.selectMember(m_id);
		request.setAttribute("memberMypageDetail", memberMypageDetail);
		
		if(command.equals("/MemberMypageDetail.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./mypage/mypage.jsp");
		} else if(command.equals("/MemberMypageGradeDetail.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./mypage/memberGrade.jsp");
		} else if(command.equals("/MemberMypageFAQList.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./mypage/FAQList.jsp");
		}
		
		return forward;
	}

}
