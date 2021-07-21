package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;
import vo.OrderDetailBean;

public class OrderLetterAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderLetterAction");
		ActionForward forward = null;
		
		int iNum = Integer.parseInt(request.getParameter("iNum"));
		
		ArrayList<OrderDetailBean> orderInfo = new ArrayList<OrderDetailBean>();
		OrderDetailBean ob = null;
		for (int i = 0; i < iNum; i++) {
			ob = new OrderDetailBean();
			ob.setC_id(Integer.parseInt(request.getParameter("c_id")));
			ob.setI_id(Integer.parseInt(request.getParameter("i_id")));
			ob.setC_id(Integer.parseInt(request.getParameter("c_qty")));
			ob.setL_id(Integer.parseInt(request.getParameter("l_id")));
			ob.setOd_message(request.getParameter("od_message"));
			
			orderInfo.add(ob);
			
		}
		
		
		
		forward = new ActionForward();
		forward.setPath("OrderForm.od");
		forward.setRedirect(false);
		
		
		return forward;
	}

}
