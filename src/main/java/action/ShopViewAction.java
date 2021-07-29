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

		ItemListService itemListService = new ItemListService();
		ArrayList<ItemBean> itemList = itemListService.getItemList();

		request.setAttribute("itemList", itemList);

		forward = new ActionForward();
		forward.setPath("./shop/flowers.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
