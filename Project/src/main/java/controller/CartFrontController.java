package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.CartDeleteProAction;
import action.CartViewAction;
import action.CartInsertProAction;
import action.CartUpdateProAction;
import vo.ActionForward;

@WebServlet("*.cr")
public class CartFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CartFrontController");

		// POST 방식 요청에 대한 한글 처리
		request.setCharacterEncoding("UTF-8");

		// 요청 URL 에서 서블릿 주소 추출
		String command = request.getServletPath();
		System.out.println("command : " + command);

		// 포워딩 정보를 관리하는 ActionForward 타입 변수 forward 선언
		ActionForward forward = null;
		// 액션 클래스의 공통 타입(슈퍼클래스)인 Action 인터페이스 타입 변수 선언
		Action action = null;

		if (command.equals("/Cart.cr")) {
			action = new CartViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/CartInsertPro.cr")) {
			action = new CartInsertProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/CartUpdatePro.cr")) {
			action = new CartUpdateProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/CartDeletePro.cr")) {
			action = new CartDeleteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		

		// -------------------------------------------------------------------------
		// 포워딩 방식 결정
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		} else { // 임시 확인을 위한 코드
			// ActionForward 객체가 null 일 경우 포워딩 작업 수행하지 않음
			System.out.println("MemberFrontController - ActionForward 객체가 null 입니다!");
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
