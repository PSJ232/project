package action;

import java.io.PrintWriter;
import java.sql.Time;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.ClassDetailInsertService;
import svc.ClassInsertService;
import vo.ActionForward;
import vo.ClassBean;
import vo.ClassDetailBean;

public class ClassInsertProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ClassInsertProAction - execute");
		ActionForward forward = null;
		ClassInsertService service = new ClassInsertService();
		ServletContext context = request.getServletContext();
		
		String realFolder = "";
		String saveFolder = "/img_upload";
		int maxSize = 10 * 1024 * 1024;
		
		realFolder = context.getRealPath(saveFolder);
		System.out.println(realFolder);
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
		classBean.setClass_max_member(Integer.parseInt(multi.getParameter("max_member")));
		classBean.setClass_date(multi.getParameter("date"));
		classBean.setClass_place(multi.getParameter("place"));
		classBean.setClass_price(Integer.parseInt(multi.getParameter("class_cost")));
		classBean.setClass_main_img(multi.getFilesystemName("class_main_img"));
		classBean.setClass_sub_img1(multi.getFilesystemName("class_sub_img1"));
		classBean.setClass_sub_img2(multi.getFilesystemName("class_sub_img2"));
		classBean.setClass_sub_img3(multi.getFilesystemName("class_sub_img3"));
		classBean.setClass_sub_desc(multi.getParameter("class_sub_desc"));
		
		// detail에 저장할 값들
		
		boolean isWriteSuccess = service.registArticle(classBean, multi.getParameterValues("timeList"));
		if(isWriteSuccess) {
			forward = new ActionForward();
			forward.setPath("ClassList.ad");
			forward.setRedirect(true);
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
