package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ItemDetailService;
import vo.ActionForward;

public class ItemDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
		int itemId = Integer.parseInt(request.getParameter("i_id"));
		
		ItemDetailService itemDetailService = new ItemDetailService();
//		ItemDAO = itemDetailService.getList(itemId);
		
		
		return forward;
	}

}
