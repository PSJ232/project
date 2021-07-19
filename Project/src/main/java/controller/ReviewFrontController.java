package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ReviewInsertFormAction;
import vo.ActionForward;

@WebServlet("*.rv")
public class ReviewFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReviewFrontController");
		
		// POST 방식 요청에 대한 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// 요청 URL에서 서블릿 주소 추출
		String command = request.getServletPath();
		System.out.println("command : " + command);
		
		// 포워딩 정보를 관리하는 ActionForward 타입 변수 forward 선언
		ActionForward forward = null;
		// 액션 클래스의 공통 타입(슈퍼클래스)인 Action 인터페이스 타입 변수 선언
		Action action = null;
		
		if(command.equals("/ReviewInsert.rv")) {
			action = new ReviewInsertFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				System.out.println("Review 컨트롤러의 reviewInsertFormAction쪽 문제" + e.getMessage());
			}
		}
		
		
		
		
		
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
}
