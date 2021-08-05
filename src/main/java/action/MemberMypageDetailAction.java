package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberService;
import vo.ActionForward;
import vo.MemberBean;
import vo.OrderBean;

public class MemberMypageDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberMypageDetailAction");
		ActionForward forward = null;
		
		String command = request.getServletPath();
		System.out.println("command : " + command);
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		System.out.println(m_id);
		
		MemberService memberService = new MemberService();
		MemberBean memberMypageDetail = memberService.selectMember(m_id);
		request.setAttribute("memberMypageDetail", memberMypageDetail);
		
		ArrayList<Integer> subscribeList = memberService.selectSubscribe(m_id);
		request.setAttribute("subscribeList", subscribeList);
		
		if(m_id == null) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("MemberLogin.me");
		} else if(command.equals("/MemberMypageDetail.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./mypage/mypage.jsp");
		} else if(command.equals("/MemberMypageGradeDetail.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./mypage/memberGrade.jsp");
		} else if(command.equals("/ReviewInsert.rv")) {
			forward = new ActionForward();
			forward.setPath("./mypage/review.jsp");
			forward.setRedirect(false);
		} else if(command.equals("/ReviewDelete.rv")) {
			forward = new ActionForward();
			forward.setPath("./mypage/reviewDelete.jsp");
			forward.setRedirect(false);
		} else if(command.equals("/QnaInsert.qna")) {
			forward = new ActionForward();
			forward.setPath("./mypage/qnaInsert.jsp");
			forward.setRedirect(false);
		} else if(command.equals("/MyClass.me")) {
			forward = new ActionForward();
			forward.setPath("./mypage/class.jsp");
		} else if(command.equals("/UpdateMyInfo.me")) {
			forward = new ActionForward();
			forward.setPath("./member/update.jsp");
			forward.setRedirect(false);
		}
		
		return forward;
	}

}
