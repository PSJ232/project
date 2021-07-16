package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.ItemInsertService;
import vo.ActionForward;
import vo.ItemBean;

public class ItemInsertAction implements Action{
	//request 
	//response forward
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ItemInsertAction");
		
		ActionForward forward = null;
		
		String realFolder = "";
		String uploadFolder = "/admin_layout/upload";
		int fileSize = 1024 * 1024 * 10; //10MB
		
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(uploadFolder);
		System.out.println(realFolder);
		MultipartRequest multi = new MultipartRequest(
				request, 
				realFolder, 
				fileSize, 
				"UTF-8", 
				new DefaultFileRenamePolicy());
		
		ItemBean ib = new ItemBean();
		
		//i_rdate값은 service페이지에서 생성함
		ib.setI_id(Integer.parseInt(multi.getParameter("i_id")));
		ib.setI_name(multi.getParameter("i_name"));
		ib.setI_desc(multi.getParameter("i_desc"));
		ib.setI_price(Integer.parseInt(multi.getParameter("i_price")));
		ib.setI_inven(Integer.parseInt(multi.getParameter("i_inven")));
		ib.setI_img(multi.getFilesystemName("i_img"));
		ib.setI_subimg2(multi.getFilesystemName("i_subimg2"));
		ib.setI_subimg3(multi.getFilesystemName("i_subimg3"));
		ib.setI_subimg4(multi.getFilesystemName("i_subimg4"));
		ib.setI_discount(Float.parseFloat(multi.getParameter("i_discount")));
		ib.setI_size(multi.getParameter("i_size"));
		ib.setI_dpstatus(multi.getParameter("i_dpstatus"));
		ib.setI_itemstatus(multi.getParameter("i_itemstatus"));
		ib.setI_detailpage(multi.getFilesystemName("i_detailpage"));
		
		ItemInsertService itemInsertService = new ItemInsertService();
		boolean isInsertSuccess = itemInsertService.insertItem(ib);
		System.out.println(isInsertSuccess);
		
		
		if(isInsertSuccess) {
			//db작업성공시
			forward = new ActionForward();
			//상품 관리 메인페이지로 이동
			forward.setPath("itemList.ad"); 
			forward.setRedirect(true);
		} else {
			//DB작업 실패시
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
