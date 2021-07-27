package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.IdMakerService;
import svc.QnaService;
import vo.ActionForward;
import vo.QnaBean;

public class QnaInsertProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		
		IdMakerService idMakerService = new IdMakerService();
		int q_id = idMakerService.newId("qna", "q_id", 0);
		int o_id;
		
		if(request.getParameter("o_id")==null) {
			o_id = 0;
		} else {
			o_id = Integer.parseInt(request.getParameter("o_id"));
		}
		
		
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
		qnaBean.setM_id(m_id);
		qnaBean.setQ_id(q_id);
		qnaBean.setO_id(o_id);
		qnaBean.setQ_subject(multi.getParameter("q_subject"));
		qnaBean.setQ_content(multi.getParameter("q_content"));
		qnaBean.setQ_img(multi.getFilesystemName("q_img"));
		qnaBean.setQ_img2(multi.getFilesystemName("q_img2"));
		qnaBean.setQ_img3(multi.getFilesystemName("q_img3"));
		
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
