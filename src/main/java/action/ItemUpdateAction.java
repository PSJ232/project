package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.ItemInsertService;
import svc.ItemUpdateService;
import vo.ActionForward;
import vo.ItemBean;

public class ItemUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	System.out.println("ItemInsertAction");
			
			ActionForward forward = null;
			
			String realFolder = "";
			String uploadFolder = "/admin_layout/upload";
			int fileSize = 1024 * 1024 * 10; //10MB
			
			//java.lang.IllegalArgumentException: Not a directory: 예외뜨면
			//console에서 realFolder 디렉터리에 가서 upload 파일 생성해야합니다
			
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
			
			//응답시 경로설정에 사용할 변수
			int i_id = Integer.parseInt(multi.getParameter("i_id"));
			

			ItemUpdateService itemUpdateService = new ItemUpdateService();
			boolean isUpdateSuccess = itemUpdateService.updateItem(ib);
			
			if(isUpdateSuccess) {
				//db작업성공시
				forward = new ActionForward();
				//상품 관리 메인페이지로 이동
				forward.setPath("itemDetail.ad?i_id="+i_id); 
				forward.setRedirect(true);
			} else {
				//DB작업 실패시
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('상품 수정에 실패했습니다');");
				out.print("history.back();");
				out.print("</script>");
			}

			
			return forward;
		}

}
