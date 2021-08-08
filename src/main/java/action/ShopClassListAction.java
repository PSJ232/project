package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReservListService;
import vo.ActionForward;
import vo.ClassBean;

public class ShopClassListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		System.out.println("ShopClassListAction - execute");
		ReservListService reservListService = new ReservListService();
		
		ArrayList<ClassBean> classList = reservListService.getClassShopList();

		request.setAttribute("classList", classList);
		
		forward = new ActionForward();
		forward.setPath("./shop/class.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
