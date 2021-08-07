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
		
		IdMakerService idMakerService = new IdMakerService(); // 번호생성 알고리즘 Service 
		int r_id = idMakerService.newId("reservation", "r_id", 1);
		rb.setR_id(r_id);
		System.out.println("reservation 아이디 :"+r_id);
		ReservInsertProService reservInsertProService = new ReservInsertProService();	
		boolean isInsertSuccess = reservInsertProService.insertReserv(rb);
		
		//등급할인 금액
		float grade_discount = Float.parseFloat(request.getParameter("grade_discount"));
		//사용 포인트
		int point_discount;
		if(request.getParameter("point_discount").equals("")) {
			point_discount = 0;
		} else {
			point_discount = Integer.parseInt(request.getParameter("point_discount"));
		}
		
		
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
			forward.setPath("/MemberMypageDetail.me");
//			forward.setPath("/ReservPay.od");
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
