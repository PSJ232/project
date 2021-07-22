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
import action.ClassInsertFormAction;
import action.ClassInsertProAction;
import action.ClassListAction;
import action.ItemDetailAction;
import action.ItemInsertAction;
import action.ItemListAction;
import action.ItemUpdateAction;
import action.ClassTimeAddAction;
import action.ItemDeleteAction;
import vo.ActionForward;

@WebServlet("*.ad")
public class AdminFrontController extends HttpServlet {
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		//Action객체를 upcasting하여 저장하기 위한 변수 선언
		Action action = null;

		ActionForward forward = null;
		
		//요청에서 요청 서블릿 명을 추출하여 변수명에 저장
		String command = request.getServletPath();
		
		//제품 목록
		if(command.equals("/ItemList.ad")) {
			
			action = new ItemListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		//제품상세페이지
		} else if(command.equals("/ItemDetail.ad")) {
			
			action = new ItemDetailAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		//제품등록페이지 이동
		} else if(command.equals("/ItemRegister.ad")){
			
			forward = new ActionForward();
			forward.setPath("./admin_layout/item_manage/itemManageRegister.jsp");
			forward.setRedirect(false);
		
		//새 제품 등록작업
		} else if(command.equals("/ItemInsert.ad")) {
			
			action = new ItemInsertAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		//제품수정 처리
		} else if(command.equals("/ItemUpdate.ad")) {
			
			action = new ItemUpdateAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		//제품수정 페이지
		} else if(command.equals("/ItemUpdatePage.ad")) {
			
			action = new ItemDetailAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		//제품 삭제
		} else if(command.equals("/ItemDelete.ad")) {
			
			action = new ItemDeleteAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/OrderList.ad")) {
			forward = new ActionForward();
//			action = new OrderListAction();
			
		}else if(command.equals("/ClassInsertForm.ad")) {
			forward = new ActionForward();
			action = new ClassInsertFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
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
			action = new ClassTimeAddAction();
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
		
		
		if(forward!=null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		} else {

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
