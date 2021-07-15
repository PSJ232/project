package action;

import java.io.PrintWriter;
import java.sql.Time;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.ClassDetailInsertService;
import svc.ClassInsertService;
import vo.ActionForward;
import vo.ClassBean;

public class ClassInsertProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ClassInsertProAction - execute");
		ActionForward forward = null;
		ClassInsertService service = new ClassInsertService();
		ClassDetailInsertService detailService = new ClassDetailInsertService();
		
		ServletContext context = request.getServletContext();
		
		String realFolder = "";
		String saveFolder = "/admin_layout/class_management/img_upload";
		int maxSize = 10 * 1024 * 1024;
		
		realFolder = context.getRealPath(saveFolder);
		
		MultipartRequest multi = new MultipartRequest(
				request, 
				realFolder , 
				maxSize, 
				"utf-8", 
				new DefaultFileRenamePolicy());
		
		request.setCharacterEncoding("utf-8");
		ClassBean classBean = new ClassBean();
		classBean.setClass_subject(multi.getParameter("class_subject"));
		classBean.setClass_desc(multi.getParameter("class_desc"));
		classBean.setClass_price(Integer.parseInt(multi.getParameter("class_cost")));
		classBean.setClass_max_member(Integer.parseInt(multi.getParameter("max_member")));
		
		Enumeration files = multi.getFileNames();
		
		// 업로드한 파일들의 이름을 얻어옴
		
		String file = (String)files.nextElement();
		
		String filename = multi.getFilesystemName(file);
		classBean.setClass_main_img(filename);
		String file2 = (String)files.nextElement();
		
		String filename2 = multi.getFilesystemName(file2);
		classBean.setClass_sub_img1(filename2);
		String file3 = (String)files.nextElement();
		
		String filename3 = multi.getFilesystemName(file3);
		classBean.setClass_sub_img2(filename3);
		String file4 = (String)files.nextElement();
		  
		String filename4 = multi.getFilesystemName(file4);
		classBean.setClass_sub_img3(filename4);
		
		boolean isWriteSuccess = service.registArticle(classBean);
		if(isWriteSuccess) {
			forward = new ActionForward();
			forward.setPath("ClassList.ad");
			forward.setRedirect(true);
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
