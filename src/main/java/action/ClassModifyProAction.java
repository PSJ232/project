package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.ClassModifyProService;
import vo.ActionForward;
import vo.ClassBean;

public class ClassModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		ServletContext context = request.getServletContext();
		
		String realFolder = "";
		String saveFolder = "/img_upload";
		int maxSize = 10 * 1024 * 1024;
		
		realFolder = context.getRealPath(saveFolder);
		MultipartRequest multi = new MultipartRequest(
				request, 
				realFolder , 
				maxSize, 
				"utf-8", 
				new DefaultFileRenamePolicy());
		
		ClassBean classBean = new ClassBean();
		
		classBean.setClass_id(Integer.parseInt(multi.getParameter("class_num")));
		classBean.setClass_subject(multi.getParameter("class_subject"));
		classBean.setClass_date(multi.getParameter("date"));
		classBean.setClass_place(multi.getParameter("place"));
		classBean.setClass_desc(multi.getParameter("class_desc"));
		classBean.setClass_sub_desc(multi.getParameter("class_sub_desc"));
		classBean.setClass_max_member(Integer.parseInt(multi.getParameter("max_member")));
		
		String[] timeList = multi.getParameterValues("timeList");
		// 삽입한 파일이 없을시
		if(multi.getFilesystemName("class_main_img") == null) {
			classBean.setClass_main_img(multi.getParameter("ori_main_img"));
		}else {
			classBean.setClass_main_img(multi.getFilesystemName("class_main_img"));
		}
		if(multi.getFilesystemName("class_sub_img1") == null) {
			classBean.setClass_sub_img1(multi.getParameter("ori_sub_img1"));
		}else {
			classBean.setClass_sub_img1(multi.getFilesystemName("class_sub_img1"));
		}
		if(multi.getFilesystemName("class_sub_img2") == null) {
			classBean.setClass_sub_img2(multi.getParameter("ori_sub_img2"));
		}else {
			classBean.setClass_sub_img2(multi.getFilesystemName("class_sub_img2"));
		}
		if(multi.getFilesystemName("class_sub_img3") == null) {
			classBean.setClass_sub_img3(multi.getParameter("ori_sub_img3"));
		}else {
			classBean.setClass_sub_img3(multi.getFilesystemName("class_sub_img3"));
		}
		
		ClassModifyProService service = new ClassModifyProService();
		boolean isModifySuccess = service.modifyClass(classBean, timeList);
		
		if(isModifySuccess) {
			forward = new ActionForward();
			forward.setPath("ClassDetailView.ad?class_num="+multi.getParameter("class_num"));
			forward.setRedirect(true);
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
