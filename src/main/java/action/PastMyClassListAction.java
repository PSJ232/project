package action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MypageClassService;
import vo.ActionForward;
import vo.ClassBean;
import vo.MyClassBean;
import vo.ReservBean;

public class PastMyClassListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id"); //request.getParameter("m_id");
		System.out.println(m_id);
		MypageClassService mypageClassService = new MypageClassService();
		ArrayList<ReservBean> reservList = mypageClassService.getReservList(m_id);
		ArrayList<MyClassBean> plannedClassList = new ArrayList<MyClassBean>();
		ArrayList<MyClassBean> pastClassList = new ArrayList<MyClassBean>();
		
		for(ReservBean rb: reservList) {
			//클래스 정보 가져오기
			ClassBean cb = mypageClassService.getMyClassInfo(rb.getF_id());
			//클래스 날짜 가져오기
			int fd_time = mypageClassService.getMyClassTime(rb.getFd_id());
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date ClassDay = null;
			Date today = null;
			
			//현재 날짜 구하기
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH)+1;
			int day = cal.get(Calendar.DAY_OF_MONTH);
			
			System.out.println(cb.getClass_date());
			ClassDay = dateFormat.parse(cb.getClass_date());
			today = dateFormat.parse(year+"-"+month+"-"+day);
			
			//날짜 비교
			int compare = ClassDay.compareTo(today);
			System.out.println(compare);
			
			MyClassBean mcb = new MyClassBean();
			mcb.setSubject(cb.getClass_subject());
			mcb.setPlace(cb.getClass_place());
			mcb.setPrice(cb.getClass_price());
			mcb.setClass_date(cb.getClass_date());
			mcb.setImg(cb.getClass_main_img());
			mcb.setTime(fd_time);
			mcb.setNum(rb.getR_num());
			mcb.setReserv_date(rb.getR_date());
			
			//클래스 수강일이 지났다면
			if(compare<0) {
				pastClassList.add(mcb);
				request.setAttribute("pastClassList", pastClassList);
			}
		}

		forward = new ActionForward();
		forward.setPath("./mypage/pastClassBack.jsp");
		
		return forward;
	}

}
