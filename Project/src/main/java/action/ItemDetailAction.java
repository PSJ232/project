package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ItemDetailService;
import vo.ActionForward;
import vo.ItemBean;

public class ItemDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
		int itemId = Integer.parseInt(request.getParameter("i_id"));
		
		
		ItemDetailService itemDetailService = new ItemDetailService();
		ItemBean itemDetail =  itemDetailService.selectItem(itemId);
		
		if(itemDetail!=null) {
			if(request.getServletPath().equals("/ItemDetail.ad")) {
				request.setAttribute("itemDetail", itemDetail);
				
				forward = new ActionForward();
				forward.setPath("admin_layout/item_manage/itemManageDetail.jsp");
				forward.setRedirect(false);
			} else if(request.getServletPath().equals("/ItemUpdatePage.ad")) {
				request.setAttribute("itemDetail", itemDetail);
				
				forward = new ActionForward();
				forward.setPath("admin_layout/item_manage/itemManageUpdate.jsp");
				forward.setRedirect(false);
			}
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('등록에 실패했습니다');");
			out.print("history.back();");
			out.print("</script>");
		}
		
		return forward;
	}

}
