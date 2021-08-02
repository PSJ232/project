package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberService;
import svc.MypageClassListService;
import vo.ActionForward;
import vo.ClassBean;
import vo.MemberBean;

public class MypageClassListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MypageClassListAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		
		MemberService memberService = new MemberService();
		
		// 멤버 정보
		MemberBean memberMypageDetail = memberService.selectMember(m_id);
		request.setAttribute("memberMypageDetail", memberMypageDetail);
		
		// 클래스 내역 정보
		MypageClassListService mypageClassListService = new MypageClassListService();
		ArrayList<ClassBean> classStartList = mypageClassListService.selectMypageStartClassList(m_id);
		ArrayList<ClassBean> classEndList = mypageClassListService.selectMypageEndClassList(m_id);
		request.setAttribute("classStartList", classStartList);
		request.setAttribute("classEndList", classEndList);
		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./mypage/mypageClass.jsp");
		
		return forward;
	}

}
