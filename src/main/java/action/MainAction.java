package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MainService;
import vo.ActionForward;
import vo.ItemBean;

public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MainAction - execute");
		ActionForward forward = null;
		
		MainService mainService = new MainService();
		//정기 구독 목록 가져오기
		ArrayList<ItemBean> mainSubscribeList = mainService.geItemList(3);
		//꽃다발
		ArrayList<ItemBean> mainflowerList = mainService.geItemList(1);
		//당일배송
		ArrayList<ItemBean> mainQuickList = mainService.geItemList(2);

		request.setAttribute("mainSubscribeList", mainSubscribeList);
		request.setAttribute("mainflowerList", mainflowerList);
		request.setAttribute("mainQuickList", mainQuickList);
		forward = new ActionForward();
		forward.setPath("./index.jsp");
		forward.setRedirect(false);
		
		
		return forward;
	}

}
