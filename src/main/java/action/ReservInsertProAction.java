package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import svc.ClassReservService;
import svc.IdMakerService;
import svc.MemberService;
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
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		String r_payment = request.getParameter("r_payment");
		
		rb.setF_id(Integer.parseInt(request.getParameter("f_id")));
		rb.setM_id(m_id);
		rb.setR_payment(r_payment);
		rb.setFd_id(Integer.parseInt(request.getParameter("fd_id")));
		rb.setR_num(Integer.parseInt(request.getParameter("r_num")));
		rb.setR_amount(Integer.parseInt(request.getParameter("total_fee")));
		
		//회원 이름 
		MemberService memberService = new MemberService();
		String name = memberService.getName(m_id);
		//예약 id생성
		IdMakerService idMakerService = new IdMakerService(); // 번호생성 알고리즘 Service 
		int r_id = idMakerService.newId("reservation", "r_id", 1);
		rb.setR_id(r_id);
		
		//최종 인원 확인
		ClassReservService classReservService = new ClassReservService();
		boolean isFull = classReservService.numCheck(Integer.parseInt(request.getParameter("f_id")), Integer.parseInt(request.getParameter("r_num")));
		System.out.println("isFull: " + isFull);
		
		System.out.println("reservation 아이디 :"+r_id);
		ReservInsertProService reservInsertProService = new ReservInsertProService();	
		boolean isInsertSuccess = reservInsertProService.insertReserv(rb);
		
//		//등급할인 금액
//		float grade_discount = Float.parseFloat(request.getParameter("grade_discount"));
		//사용 포인트
		int point_discount;
		if(request.getParameter("point_discount").equals("")) {
			point_discount = 0;
		} else {
			point_discount = Integer.parseInt(request.getParameter("point_discount"));
			//포인트 차감
			memberService.usePoint(m_id, point_discount);;
		}
		
		if(isInsertSuccess) {
			System.out.println("reservBean insert 성공");
			request.setAttribute("reservBean", rb);
			request.setAttribute("name", name);
//			request.setAttribute("grade_discount", grade_discount);
//			request.setAttribute("point_discount", point_discount);
			if(r_payment.equals("card")) {
				forward = new ActionForward();
				//결제페이지로 이동
				forward.setPath("/ReservPay.od");
				forward.setRedirect(false);
			} else if(r_payment.equals("cash")){
				forward = new ActionForward();
				//결제 완료 페이지로 로 이동
				forward.setPath("./reservation/payment_info.jsp");
				forward.setRedirect(false);
			}

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
