package action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.ActionForward;

public class MemberLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberLogoutAction");
		ActionForward forward = null;
		
		// 자동로그인 해제
		Cookie cookieId = new Cookie("m_id", null);
		cookieId.setMaxAge(0); // 쿠키삭제(엎어쓰기)
		response.addCookie(cookieId);
		System.out.println("쿠키삭제!!!");

		HttpSession session = request.getSession();
		session.invalidate();

		forward = new ActionForward();
		forward.setPath("./"); // 메인화면 미정
		forward.setRedirect(true);

		return forward;
	}

}
