package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.ReviewUpdateProService;
import vo.ActionForward;
import vo.ReviewBean;

public class ReviewUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewUpdateProAction");
		ActionForward forward = null;
		
		String realFolder = "";
		String saveFolder = "/reviewUpload";
		int fileSize = 0xa0000;
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		String writerIpAdd = request.getRemoteAddr();
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		
		// 이미지 수정 적용 (이미지를 교체하지 않는 경우 이전의 파일을 다시 업로드하도록 적용)
		String oldr_img = multi.getParameter("oldr_img");
		String img = multi.getFilesystemName((String)multi.getFileNames().nextElement());
		if(img == null) {
			img = oldr_img;
		}
		
		ReviewBean rb = new ReviewBean();
		rb.setR_id(Integer.parseInt(multi.getParameter("r_id")));
		rb.setOd_id(Integer.parseInt(multi.getParameter("od_id")));
		rb.setR_writer(multi.getParameter("r_writer"));
		rb.setR_title(multi.getParameter("r_title"));
		rb.setR_content(multi.getParameter("r_content"));
		rb.setR_rate(Integer.parseInt(multi.getParameter("r_rate")));
		rb.setR_img(img);

		ReviewUpdateProService reviewUpdateProService = new ReviewUpdateProService();
		boolean isUpdateSuccess = reviewUpdateProService.modifyReview(rb);
		
		if(isUpdateSuccess) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("ReviewInsertForm.rv");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('리뷰 수정 실패!');");
			out.println("history.back();");
			out.println("</script>");
		}
		
		return forward;
	}

}
