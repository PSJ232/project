package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.ReviewInsertProService;
import vo.ActionForward;
import vo.ReviewBean;

public class ReviewInsertProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewInsertProAction");
		ActionForward forward = null;
		
		int od_id = 0;
		String realFolder = "";
		String saveFolder = "/reviewUpload";
		int fileSize = 0xa0000;
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		String writerIpAdd = request.getRemoteAddr();
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		// r_point 판별 (이미지 삽입시 300p, 미삽입시 200p)
		int r_point = 0;
		String img = multi.getFilesystemName((String)multi.getFileNames().nextElement());
		if(img != null) {
			r_point = 300;
		} else {
			r_point = 200;
		}
		
		ReviewBean rb = new ReviewBean();
		od_id = Integer.parseInt(multi.getParameter("od_id"));
		rb.setOd_id(od_id);
		rb.setR_writer(multi.getParameter("r_writer"));
		rb.setR_title(multi.getParameter("r_title"));
		rb.setR_content(multi.getParameter("r_content"));
		rb.setR_rate(Integer.parseInt(multi.getParameter("r_rate")));
		rb.setR_img(img);
		rb.setR_point(r_point);
		
		
		ReviewInsertProService reviewInsertProService = new ReviewInsertProService();
		boolean isInsertSuccess = reviewInsertProService.registerReview(rb);
		
		if(isInsertSuccess) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("ReviewInsertForm.rv");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('리뷰 작성 실패!');");
			out.println("history.back();");
			out.println("</script>");
		}
		
		return forward;
	}

}
