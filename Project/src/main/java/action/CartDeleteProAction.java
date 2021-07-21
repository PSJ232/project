package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.IdMakerService;
import vo.ActionForward;

public class CartDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CartDeleteProAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		int i_id = Integer.parseInt(request.getParameter("i_id"));
		
		IdMakerService idMakerService = new IdMakerService();
		int newId = idMakerService.newId("cart", "c_id"); 
		
		CartDeleteProSerivce cartDeleteProSerivce = new CartDeleteProSerivce();
		cartDeleteProService.dropCart
		
		
		
		
		
		
		
		
		return forward;
	}

}
