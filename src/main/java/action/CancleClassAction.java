package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MypageClassService;
import vo.ActionForward;

public class CancleClassAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CancleClassAction - execute");
		ActionForward forward = null;
		boolean isCancleSuccess = false;
		int r_id = Integer.parseInt(request.getParameter("r_id"));
		System.out.println("r_id - "+ r_id);
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");
		System.out.println("m_id - "+ m_id);
		MypageClassService mypageClassService = new MypageClassService();
		isCancleSuccess = mypageClassService.cancleClass(r_id);
		
		if(isCancleSuccess) {
			forward = new ActionForward();
			forward.setPath("./reservation/cancle_info.jsp");
			forward.setRedirect(false);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('다시 시도하세요');");
			out.print("history.back();");
			out.print("</script>");
		}
		return forward;
	}

}
