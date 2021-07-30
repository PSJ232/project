package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberService;
import svc.OrderDetailStatusService;
import vo.ActionForward;
import vo.ItemBean;
import vo.MemberBean;
import vo.OrderBean;
import vo.OrderDetailBean;

public class OrderMypageDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderMypageDetailAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		
		String o_id = request.getParameter("o_id");
		System.out.println(o_id);
		
		// 마이페이지 멤버 정보 호출
		MemberService memberService = new MemberService();
		MemberBean memberMypageDetail = memberService.selectMember(m_id);
		request.setAttribute("memberMypageDetail", memberMypageDetail);
		
		//  주문 세부사항 정보
		OrderDetailStatusService orderDetailStatusService = new OrderDetailStatusService();
		OrderBean orderBean = orderDetailStatusService.getMypageOrderDetailOrderBean(o_id);
		ArrayList<OrderDetailBean> orderDetailList = orderDetailStatusService.getMypageOrderDetailOrderDetailBean(o_id);
		ArrayList<ItemBean> itemList = orderDetailStatusService.getMypageOrderDetailItemBean(o_id);
		
		request.setAttribute("orderDetailList", orderDetailList);
		request.setAttribute("orderBean", orderBean);
		request.setAttribute("itemList", itemList);
		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./mypage/orderHistoryDetail.jsp");
		
		return forward;
	}

}
