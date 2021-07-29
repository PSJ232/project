package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.ClassDetailDetailService;
import svc.ClassDetailViewService;
import svc.MemberService;
import vo.ActionForward;
import vo.ClassBean;
import vo.ClassDetailBean;
import vo.MemberBean;
import vo.ReservBean;

public class ReservPayAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReservPayAction execute()");
		ActionForward forward = null;
		
		ReservBean rb = (ReservBean) request.getAttribute("reservBean");
		System.out.println("!!!!!!!!r" + rb.getR_id());
		
		//클래스 정보 가져오기
		ClassDetailViewService classDetailViewService = new ClassDetailViewService();
		ClassBean cb = classDetailViewService.getDetailContent(rb.getF_id());
		
		//클래스 디테일 가져오기(장소, 날짜, 시간)
		ClassDetailDetailService classDetailService = new ClassDetailDetailService();
		ClassDetailBean cdb = classDetailService.getDetail(rb.getFd_id());
		
		MemberService memberDetailService = new MemberService();
		MemberBean mb = memberDetailService.selectMember(rb.getM_id());

		
		if(cb!=null && cdb!=null && mb != null) {
			request.setAttribute("reservBean", rb);
			request.setAttribute("fclass", cb);
			request.setAttribute("fclass_detail", cdb);
			request.setAttribute("member", mb);
			
			forward = new ActionForward();
			forward.setPath("./admin_layout/reserv_manage/reservPay.jsp");
			forward.setRedirect(false);
		} else {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			
			if(cb == null) {
				out.print("alert('결제페이지 로딩에 실패했습니다 - 클래스를 선택하세요');");
			} else if(cdb == null) {
				out.print("alert('결제페이지 로딩에 실패했습니다 - 시간과 장소를 선택하세요');");
			} else if(mb == null) {
				out.print("alert('결제페이지 로딩에 실패했습니다 - 로그인하세요');");
			}
			
			out.print("history.back();");
			out.print("</script>");
		}
		
		return forward;
	}

}
