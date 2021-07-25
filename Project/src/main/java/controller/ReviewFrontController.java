package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ReviewInsertProAction;
import action.ReviewUpdateFormAction;
import action.ReviewUpdateProAction;
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
		
		if(command.equals("/ReviewInsertForm.rv")) {
			action = new ReviewInsertFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/ReviewInsert.rv")) {
			forward = new ActionForward();
			forward.setPath("./mypage/review.jsp");
			forward.setRedirect(false);
		} else if(command.equals("/ReviewInsertPro.rv")) {
			action = new ReviewInsertProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/ReviewUpdate.rv")) {
			action = new ReviewUpdateFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/ReviewUpdatePro.rv")) {
			action = new ReviewUpdateProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		

		// --------------------------------------------------------------
		// 포워딩 방식 결정
		if(forward != null) {
			System.out.println("ReviewFrontController");
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		} else {
			System.out.println("ReviewFrontController - ActionForward 객체가 null 입니다!");
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
