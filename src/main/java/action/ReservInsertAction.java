package action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ClassDetailDetailService;
import svc.ClassDetailViewService;
import vo.ActionForward;
import vo.ClassBean;
import vo.ClassDetailBean;
import vo.MemberBean;

public class ReservInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		System.out.println("ReservInsertAction - execute(request, response)");
		
		//수강인원 가져오기
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		
		//회원정보 가져오기
//		String m_id = (String) request.getAttribute("id");
		
		//클래스 정보 가져오기
		int f_id = 3; //Integer.parseInt(request.getParameter("f_id"));
		String fd_date = request.getParameter("fd_date");
		String fd_place = request.getParameter("fd_place");
		String fd_time = request.getParameter("fd_time");
		//fd_date, fd_place, fd_time 세개 값을 가지고 fd_id 조회
		int fd_id = 4; //getClassDetailIdService(fd_date, fd_place, fd_time);
		
		//클래스 정보 가져오기
		ClassDetailViewService classDetailViewService = new ClassDetailViewService();
		ClassBean cb = classDetailViewService.getDetailContent(f_id);
		
		//클래스 디테일 가져오기(장소, 날짜, 시간)
		ClassDetailDetailService classDetailService = new ClassDetailDetailService();
		ClassDetailBean cdb = classDetailService.getDetail(fd_id);
		
		//요일 구하기
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		System.out.println(cdb.getDate());
		Date date = simpleDate.parse(cdb.getDate());
		System.out.println(date);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		
		String startDate = null;
		switch (calendar.get(Calendar.DAY_OF_WEEK)) {
		case 1: startDate = "일"; break;
		case 2: startDate = "월"; break;
		case 3: startDate = "화"; break;
		case 4: startDate = "수"; break;
		case 5: startDate = "목"; break;
		case 6: startDate = "금"; break;
		case 7: startDate = "토"; break;
		}
		
		request.setAttribute("startDate", startDate);

//		MemberDetailService memberDetailService = new MemberDetailService();
//		MemberBean mb = memberDetailService.selectMember(m_id);
		
//		if(cb!=null && cdb!=null && mb!= null) {
//			request.setAttribute("fclass", cb);
//			request.setAttribute("fclass_detail", cdb);
////			request.setAttribute("memberDetail", m_id);
//			
//			forward = new ActionForward();
//			forward.setPath("./admin_layout/reserv_manage/reservInsert.jsp");
//			forward.setRedirect(false);
//		} else {
//			
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.print("<script>");
//			if(cb == null) {
//				out.print("alert('결제페이지 로딩에 실패했습니다 - 클래스를 선택하세요');");
//			} else if(cdb == null) {
//				out.print("alert('결제페이지 로딩에 실패했습니다 - 시간과 장소를 선택하세요');");
//			} else if(mb == null) {
//				out.print("alert('결제페이지 로딩에 실패했습니다 - 로그인하세요');");
//			}
//			
//			out.print("history.back();");
//			out.print("</script>");
//		}

		
		
		if(cb!=null && cdb!=null) {
			request.setAttribute("r_num", r_num);
			request.setAttribute("fclass", cb);
			request.setAttribute("fclass_detail", cdb);
//			request.setAttribute("memberDetail", m_id);
			
			forward = new ActionForward();
			forward.setPath("./admin_layout/reserv_manage/reservInsert.jsp");
			forward.setRedirect(false);
		} else {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			
			if(cb == null) {
				out.print("alert('결제페이지 로딩에 실패했습니다 - 클래스를 선택하세요');");
			} else if(cdb == null) {
				out.print("alert('결제페이지 로딩에 실패했습니다 - 시간과 장소를 선택하세요');");
			}
			
			out.print("history.back();");
			out.print("</script>");
		}



		return forward;
	}

}
