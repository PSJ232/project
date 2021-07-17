package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberUpdateProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
		String m_birth = request.getParameter("year") + "-" + request.getParameter("month") + "-" + request.getParameter("day");
		
		MemberBean memberBean = new MemberBean();
		
		String m_pass = request.getParameter("m_pass"); // 비밀번호 수정란에 입력이 없으면 기존 비밀번호 유지
		if(m_pass == "") {
			memberBean.setM_pass(request.getParameter("m_pass_origin"));
		} else {
			memberBean.setM_pass(request.getParameter("m_pass"));
		}
		
		memberBean.setM_id(request.getParameter("m_id"));
		memberBean.setM_name(request.getParameter("m_name"));
		memberBean.setM_phone(request.getParameter("m_phone"));
		memberBean.setM_birth(m_birth);
		memberBean.setM_gender(Integer.parseInt(request.getParameter("m_gender")));
		memberBean.setM_agree(request.getParameter("m_agree"));
		
		MemberUpdateProService memberUpdateProService = new MemberUpdateProService();
		boolean isUpdateSuccess = memberUpdateProService.modifyMember(memberBean);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(!isUpdateSuccess) {
			
			out.println("<script>");
			out.println("alert('회원 수정 실패!');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("MemberUpdate.me");
			forward.setRedirect(true);
		}

		
		return forward;
	}

}
