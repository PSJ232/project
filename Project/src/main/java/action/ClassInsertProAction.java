package action;

import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import vo.ActionForward;
import vo.ClassBean;

public class ClassInsertProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ClassInsertProAction - execute");
		request.setCharacterEncoding("utf-8");
		ActionForward forward = null;
		ClassBean classBean = new ClassBean();
		ClassInsertService service = new ClassInsertService();
		
		ServletContext context = request.getServletContext();
		
		String realFolder = "";
		String saveFolder = "/img_upload";
		int maxSize = 10 * 1024 * 1024;
		
		realFolder = context.getRealPath(saveFolder);
		
		MultipartRequest multi = new MultipartRequest(request, 
				realFolder , 
				maxSize, 
				"utf-8", 
				new DefaultFileRenamePolicy());
		
		classBean.setClass_subject(multi.getParameter("class_subject"));
		classBean.setClass_desc(multi.getParameter("class_desc"));
		classBean.setClass_price(Integer.parseInt(multi.getParameter("class_cost")));
		classBean.setClass_max_member(Integer.parseInt(multi.getParameter("max_member")));
		
		Enumeration files = multi.getFileNames();
		
		// 업로드한 파일들의 이름을 얻어옴
		
		String file = (String)files.nextElement();
		
		String filename = multi.getFilesystemName(file);
		System.out.println(filename);
		classBean.setClass_main_img(filename);
		String file2 = (String)files.nextElement();
		
		String filename2 = multi.getFilesystemName(file2);
		System.out.println(filename2);
		classBean.setClass_sub_img1(filename2);
		String file3 = (String)files.nextElement();
		
		String filename3 = multi.getFilesystemName(file3);
		System.out.println(filename3);
		classBean.setClass_sub_img2(filename3);
		String file4 = (String)files.nextElement();
		  
		String filename4 = multi.getFilesystemName(file4);
		System.out.println(filename4);
		classBean.setClass_sub_img3(filename4);
		System.out.println(classBean);
//		boolean isWriteSuccess = service.registArticle();
		forward = new ActionForward();
		forward.setPath("ClassInsertPro.ad");
		forward.setRedirect(true);
		return forward;
	}

}
