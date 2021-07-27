package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.QnaService;
import vo.ActionForward;
import vo.QnaBean;

public class QnaInsertProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
		
		String realFolder = "";
		String uploadFolder = "/mypage/qnaUpload";
		int fileSize = 1024 * 1024 * 5; //5mb
		
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(uploadFolder);
		System.out.println(realFolder);
		MultipartRequest multi = new MultipartRequest(
				request, 
				realFolder, 
				fileSize, 
				"UTF-8", 
				new DefaultFileRenamePolicy());
		
		QnaBean qnaBean = new QnaBean();
		qnaBean.setQ_id(Integer.parseInt(multi.getParameter("q_id")));
		qnaBean.setO_id(Integer.parseInt(multi.getParameter("o_id")));
		qnaBean.setQ_subject(multi.getParameter("q_subject"));
		qnaBean.setQ_content(multi.getParameter("q_content"));
		qnaBean.setQ_img(multi.getFilesystemName("q_img"));
		
		QnaService qnaService = new QnaService();
		boolean isInsertSuccess = qnaService.askQna(qnaBean);
		
		if(isInsertSuccess) {
			forward = new ActionForward();
			forward.setPath("QnaInsert.qna"); 
			forward.setRedirect(true);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('문의등록을 실패했습니다');");
			out.print("history.back();");
			out.print("</script>");
		}
		
		return forward;
	}

}
