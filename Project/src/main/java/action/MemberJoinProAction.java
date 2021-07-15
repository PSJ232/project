package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberJoinProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberJoinProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
		String m_birth = request.getParameter("year") + "-" + request.getParameter("month") + "-" + request.getParameter("day");
		
		MemberBean memberBean = new MemberBean();
		
		memberBean.setM_id(request.getParameter("m_id"));
		memberBean.setM_pass(request.getParameter("m_pass"));
		memberBean.setM_name(request.getParameter("m_name"));
		memberBean.setM_phone(request.getParameter("m_phone"));
		memberBean.setM_birth(m_birth);
		memberBean.setM_gender(Integer.parseInt(request.getParameter("m_gender")));
		memberBean.setM_agree(request.getParameter("m_agree"));
		
		MemberJoinProService memberJoinProService = new MemberJoinProService();
		
		boolean isJoinSuccess = memberJoinProService.registMember(memberBean);
		
		if(!isJoinSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원 가입 실패!');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("MemberLogin.me"); // 메인화면 주소 미정
			forward.setRedirect(true);
		}
		
		// 포워딩 정보가 저장된 ActionForward 객체 리턴
		return forward;
	}

}
