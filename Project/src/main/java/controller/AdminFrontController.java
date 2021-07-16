package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ClassDetailSelectTimelistAction;
import action.ClassInsertProAction;
import action.ClassListAction;
import action.TimeAddAction;
import vo.ActionForward;

/**
 * Servlet implementation class AdminFrontController
 */
@WebServlet("*.ad")
public class AdminFrontController extends HttpServlet {
	
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AdminFrontController");
		String command = request.getServletPath();
		ActionForward forward = null;
		Action action = null;
		
		
		if(command.equals("/OrderList.ad")) {
			forward = new ActionForward();
//			action = new OrderListAction();
			
		}else if(command.equals("/ClassInsertForm.ad")) {
			forward = new ActionForward();
			forward.setPath("./admin_layout/class_management/classManagementInsert.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/ClassInsertPro.ad")) {
			forward = new ActionForward();
			action = new ClassInsertProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/SelectClassDetail.ad")) {
			forward = new ActionForward();
			forward.setPath("./admin_layout/class_management/selectClassDetail.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/TimeList.ad")) {
			forward = new ActionForward();
			action = new ClassDetailSelectTimelistAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/ClassDetailadd.ad")) {
			forward = new ActionForward();
			action = new TimeAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/ClassList.ad")) {
			forward = new ActionForward();
			action = new ClassListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
