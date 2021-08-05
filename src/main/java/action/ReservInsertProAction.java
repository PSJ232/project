package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		HttpSession session = request.getSession();
		rb.setM_id((String)session.getAttribute("m_id"));

		rb.setR_payment(request.getParameter("r_payment"));
		rb.setFd_id(Integer.parseInt(request.getParameter("fd_id")));
		rb.setR_num(Integer.parseInt(request.getParameter("r_num")));
		rb.setR_amount(Integer.parseInt(request.getParameter("total_fee")));
		
		ReservInsertProService reservInsertProService = new ReservInsertProService();	
		boolean isInsertSuccess = reservInsertProService.insertReserv(rb);

		ReservSelectIdService reservSelectIdService = new ReservSelectIdService();
		int r_id = reservSelectIdService.getrId(rb);
		
		
		//등급할인 금액
		float grade_discount = Float.parseFloat(request.getParameter("grade_discount"));
		//사용 포인트
		int point_discount = Integer.parseInt(request.getParameter("point_discount"));
		
		System.out.println("grade_discount: " + grade_discount);
		System.out.println("point_discount: " + point_discount);
		
		if(isInsertSuccess) {
			System.out.println("reservBean insert 성공");
			rb.setR_id(r_id);
			System.out.println(rb.getM_id());
			request.setAttribute("reservBean", rb);
			request.setAttribute("grade_discount", grade_discount);
			request.setAttribute("point_discount", point_discount);
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
