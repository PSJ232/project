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
import javax.servlet.http.HttpSession;

import svc.ClassDetailDetailService;
import svc.ClassDetailViewService;
import svc.MemberService;
import svc.ReservClassNumService;
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
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");
		System.out.println("m_id!: " + m_id);
		MemberService memberService = new MemberService();
		MemberBean mb = memberService.selectMember(m_id);
		//회원 등급 가져오기
		int g_id = mb.getG_id();
		float g_discount = memberService.getGradeDetail(g_id);
		//classDetail 정보
		int f_id = Integer.parseInt(request.getParameter("f_id"));
		String fc_date = request.getParameter("fc_date");
		String fd_place = request.getParameter("fd_place");
		String fd_time = request.getParameter("fd_time");
		ClassDetailBean cdb = new ClassDetailBean();
		cdb.setClass_id(f_id);
		cdb.setDate(fc_date);
		cdb.setPlace(fd_place);
		//타임은 따로
		System.out.println("fc_date: " + fc_date);
		//클래스 정보 가져오기
		ClassDetailViewService classDetailViewService = new ClassDetailViewService();
		ClassBean cb = classDetailViewService.getDetailContent(f_id);
		
		//요일 구하기
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		Date date = simpleDate.parse(fc_date);
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
		
		if(mb!=null&&cb!=null&&cdb!=null) {
			request.setAttribute("r_num", r_num);
			request.setAttribute("member", mb);
			request.setAttribute("fclass", cb);
			request.setAttribute("fclass_detail", cdb);
			request.setAttribute("startDate", startDate);
			request.setAttribute("fd_time", fd_time);
			request.setAttribute("grade", g_discount);
			forward = new ActionForward();
			forward.setPath("./reservation/reservInsert.jsp");
			forward.setRedirect(false);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('결제페이지 로딩에 실패했습니다');");
			out.print("history.back();");
			out.print("</script>");
		}

		return forward;
	}

}
