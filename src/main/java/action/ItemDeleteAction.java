package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ItemDeleteService;
import vo.ActionForward;

public class ItemDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		int i_id = Integer.parseInt(request.getParameter("i_id"));
		
		ItemDeleteService itemDeleteService = new ItemDeleteService();
		boolean isDeleteSuccess = itemDeleteService.deleteItem(i_id);
		
		if(isDeleteSuccess) {
			//db작업성공시
			forward = new ActionForward();
			//상품 관리 메인페이지로 이동
			forward.setPath("ItemList.ad"); 
			forward.setRedirect(true);
		} else {
			//DB작업 실패시
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('상품 삭제에 실패했습니다');");
			out.print("history.back();");
			out.print("</script>");
		}
		
		return forward;
	}

}
