package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import svc.IdMakerService;
import svc.ReservInsertProService;
import svc.ReservSelectIdService;
import vo.ActionForward;
import vo.ReservBean;

public class ReservInsertProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReservInsertProAction - execute");
		ActionForward forward = null;
		
		ReservBean rb = new ReservBean();
		rb.setF_id(Integer.parseInt(request.getParameter("f_id")));
//		rb.setM_id(request.getParameter("m_id"));
		rb.setM_id("hye304@naver.com");
		rb.setR_payment(request.getParameter("r_payment"));
		rb.setFd_id(Integer.parseInt(request.getParameter("fd_id")));
		rb.setR_num(Integer.parseInt(request.getParameter("r_num")));
//		rb.setR_amount(0);
		
		ReservInsertProService reservInsertProService = new ReservInsertProService();	
		boolean isInsertSuccess = reservInsertProService.insertReserv(rb);

		ReservSelectIdService reservSelectIdService = new ReservSelectIdService();
		int r_id = reservSelectIdService.getrId(rb);
		
		if(isInsertSuccess) {
			rb.setR_id(r_id);
			System.out.println("reservBean insert 성공");
			System.out.println(rb.getM_id());
			request.setAttribute("reservBean", rb);
			System.out.println("@@@@@@@@" + rb.getR_id());
			forward = new ActionForward();
			//결제페이지로 이동
			forward.setPath("/ReservPay.ad");
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
