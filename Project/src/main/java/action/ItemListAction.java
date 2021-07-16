package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ItemInsertService;
import svc.ItemListService;
import vo.ActionForward;
import vo.ItemBean;

public class ItemListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//페이징 처리 필요없을 것같아 보류중
		
		ActionForward forward = null;
		
		//Service 객체에 생성및 요청처리를 위한 메소드 호출, 반환값 저장
		ItemListService itemListService = new ItemListService();
		ArrayList<ItemBean> itemList = itemListService.getItemList();
		
		//request에 저장하여 전달
		request.setAttribute("itemList", itemList);
		
		//forward 처리
		forward = new ActionForward();
		forward.setPath("admin_layout/item_manage/itemManageList.jsp");
		forward.setRedirect(false);
		
		ItemInsertService itemInsertService = new ItemInsertService();
//		isInsertSuccess = itemInsertService.insertItem();
		
		return forward;
	}

}
