package action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.DashBoardService;
import vo.ActionForward;
import vo.ItemBean;
import vo.ReviewBean;

public class AdminDashBoardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		DashBoardService service = new DashBoardService();
		HashMap<String, Integer> salesInfo = service.getSalesInfo();
		HashMap<String, Integer> weekCardSales = service.getWeekCardSales();
		HashMap<String, Integer> weekCashSales = service.getWeekCashSales();
		List<String> weekCardSalesKeys = new ArrayList<String>(weekCardSales.keySet());
		List<String> weekCashSalesKeys = new ArrayList<String>(weekCashSales.keySet());
		Collections.sort(weekCardSalesKeys);
		Collections.sort(weekCashSalesKeys);
		ArrayList<ItemBean> rankingItems = service.getItemRanking();
		ArrayList<ReviewBean> recentReview = service.getRecentReview();
		request.setAttribute("recentReview", recentReview);
		request.setAttribute("rankingItems", rankingItems);
		request.setAttribute("salesInfo", salesInfo);
		request.setAttribute("weekCardSales", weekCardSales);
		request.setAttribute("weekCashSales", weekCashSales);
		request.setAttribute("weekCardSalesKeys", weekCardSalesKeys);
		request.setAttribute("weekCashSalesKeys", weekCashSalesKeys);
		forward.setPath("./admin_layout/main/main.jsp");
		return forward;
	}
	

}
