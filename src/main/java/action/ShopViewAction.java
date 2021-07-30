package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ItemListService;
import vo.ActionForward;
import vo.ItemBean;

public class ShopViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ShopViewAction");

		ActionForward forward = null;
		int sort = 1;
		if (request.getParameter("sort") != null) {
			sort = Integer.parseInt(request.getParameter("sort"));
		}

		ItemListService itemListService = new ItemListService();
		ArrayList<ItemBean> itemList = itemListService.getItemList(sort);

		request.setAttribute("itemList", itemList);

		String command = request.getServletPath();

		if (command.equals("/Flowers.shop")) {
			forward = new ActionForward();
			forward.setPath("./shop/flowers.jsp");
			forward.setRedirect(false);

		} else if (command.equals("/Quick.shop")) {
			forward = new ActionForward();
			forward.setPath("./shop/quick.jsp");
			forward.setRedirect(false);
		}
		
		return forward;
	}

}
