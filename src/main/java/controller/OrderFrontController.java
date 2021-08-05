package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.MypageSbscribeListAction;
import action.OrderAddressAction;
import action.OrderCancelAction;
import action.OrderCartAction;
import action.OrderDetailProAction;
import action.OrderInsertFormAction;
import action.OrderInsertProAction;
import action.OrderLetterAction;
import action.OrderMypageDetailAction;
import action.OrderMypageListAction;
import action.OrderNowAction;
import action.OrderSubAction;
import action.VisitorNowAction;
import vo.ActionForward;

//서블릿 주소가 XXX.me 일 경우 OrderFrontController 로 해당 요청이 전달됨
@WebServlet("*.od")
public class OrderFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("OrderFrontController");

		// POST 방식 요청에 대한 한글 처리
		request.setCharacterEncoding("UTF-8");

		// 요청 URL 에서 서블릿 주소 추출
		String command = request.getServletPath();
		System.out.println("command : " + command);

		// 포워딩 정보를 관리하는 ActionForward 타입 변수 forward 선언
		ActionForward forward = null;
		// 액션 클래스의 공통 타입(슈퍼클래스)인 Action 인터페이스 타입 변수 선언
		Action action = null;

		if (command.equals("/OrderNow.od")) {
			action = new OrderNowAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/OrderCart.od")) {
			action = new OrderCartAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/OrderForm.od")) {
			action = new OrderInsertFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/OrderInsertPro.od")) {
			action = new OrderInsertProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/OrderDetailPro.od")) {
			action = new OrderDetailProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/OrderLetter.od")) {
			action = new OrderLetterAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/OrderAddress.od")) {
			action = new OrderAddressAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/OrderMypageDetailList.od")) {
			action = new OrderMypageListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/VisitorOrderNow.od")) {
			action = new VisitorNowAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/OrderMypageDetail.od")) {
			action = new OrderMypageDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/OrderCancel.od")) {
			action = new OrderCancelAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/OrderSub.od")) {
			action = new OrderSubAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/MypageSubscribe.od")) {
			action = new MypageSbscribeListAction();
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
			System.out.println("OrderFrontController - ActionForward 객체가 null 입니다!");
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
