package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReservDeleteService;
import vo.ActionForward;

public class ReservMiddleCancleAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReservMiddleCancleAction - execute");
		ActionForward forward = null;
		boolean isDeleted = false;
		int r_id = Integer.parseInt(request.getParameter("imp_uid"));
		int f_id = Integer.parseInt(request.getParameter("merchant_uid"));
		
		System.out.println(r_id);

		ReservDeleteService reservDeleteService = new ReservDeleteService();
		isDeleted = reservDeleteService.deleteReserv(r_id);
		
		if(isDeleted) {
			forward = new ActionForward();
			forward.setPath("ClassReserv.od"); //f_id값 넣어서 상품 예약 페이지(결제페이지 ㄴㄴ)로 이동
			forward.setRedirect(true);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('결제를 취소하였습니다');");
			out.print("history.back();");
			out.print("</script>");
		}
		return forward;
	}

}
