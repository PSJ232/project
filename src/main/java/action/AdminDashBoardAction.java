package action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.TreeMap;

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
		for(String key : weekCardSalesKeys) {
			if(!weekCashSalesKeys.contains(key)) {
				weekCashSales.put(key, 0);
				weekCashSalesKeys.add(key);
			}
		}
		for(String key : weekCashSalesKeys) {
			if(!weekCardSalesKeys.contains(key)) {
				weekCardSales.put(key, 0);
				weekCardSalesKeys.add(key);
			}
		}
		Collections.sort(weekCardSalesKeys, Comparator.reverseOrder());
		if(weekCardSalesKeys.size() > 7) {
			weekCardSalesKeys = weekCardSalesKeys.subList(0, 7);
		}
		Collections.sort(weekCardSalesKeys);
		ArrayList<ItemBean> rankingItems = service.getItemRanking();
		ArrayList<ReviewBean> recentReview = service.getRecentReview();
		request.setAttribute("recentReview", recentReview);
		request.setAttribute("rankingItems", rankingItems);
		request.setAttribute("salesInfo", salesInfo);
		request.setAttribute("weekCardSales", weekCardSales);
		request.setAttribute("weekCashSales", weekCashSales);
		request.setAttribute("weekCardSalesKeys", weekCardSalesKeys);
		forward.setPath("./admin_layout/main/main.jsp");
		return forward;
	}
	

}
