package controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.AdminMemberDetailAction;
import action.AdminOrderDetailAction;
import action.AdminSearchAction;
import action.ClassDeleteAction;
import action.ClassDetailViewAction;
import action.ClassDetailSelectTimelistAction;
import action.ClassInsertProAction;
import action.ClassListAction;
import action.ClassModifyProAction;
import action.ClassReservAction;
import action.ItemDetailAction;
import action.ItemInsertAction;
import action.ItemListAction;
import action.ItemUpdateAction;
import action.ReservClassNumAction;
import action.ReservClassPlaceAction;
import action.ReservClassTimeAction;
import action.ReservInsertAction;
import action.ReservInsertProAction;
import action.ReservMiddleCancleAction;
import action.ReservPayAction;
import action.ClassTimeAddAction;
import action.ItemDeleteAction;
import vo.ActionForward;

@WebServlet("*.ad")
public class AdminFrontController extends HttpServlet {
	public void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");	

		// Action객체를 upcasting하여 저장하기 위한 변수 선언
		Action action = null;
		ActionForward forward = null;
		// 요청에서 요청 서블릿 명을 추출하여 변수명에 저장
		String command = request.getServletPath();
		// 제품 목록
		if (command.equals("/ItemList.ad")) {
			action = new ItemListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 제품상세페이지
		} else if (command.equals("/ItemDetailView.ad")) {
			action = new ItemDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 제품등록페이지 이동
		} else if (command.equals("/ItemRegister.ad")) {
			forward = new ActionForward();
			forward.setPath("./admin_layout/item_manage/itemManageRegister.jsp");
			forward.setRedirect(false);
			// 새 제품 등록작업
		} else if (command.equals("/ItemInsert.ad")) {
			action = new ItemInsertAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 제품수정 처리
		} else if (command.equals("/ItemUpdate.ad")) {
			action = new ItemUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 제품수정 페이지
		} else if (command.equals("/ItemUpdatePage.ad")) {
			action = new ItemDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 제품 삭제
		} else if (command.equals("/ItemDelete.ad")) {
			action = new ItemDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ClassInsertForm.ad")) {
			forward = new ActionForward();
			forward.setPath("./admin_layout/class_management/classInsertForm.jsp");
			forward.setRedirect(false);
			// 클래스 등록Pro
		} else if (command.equals("/ClassInsertPro.ad")) {
			forward = new ActionForward();
			action = new ClassInsertProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 클래스 시간 리스트
		} else if (command.equals("/TimeList.ad")) {
			forward = new ActionForward();
			action = new ClassDetailSelectTimelistAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 시간정보 등록
		} else if (command.equals("/ClassDetailadd.ad")) {
			forward = new ActionForward();
			action = new ClassTimeAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 클래스 리스트
		} else if (command.equals("/ClassList.ad")) {
			forward = new ActionForward();
			forward.setPath("./admin_layout/class_management/classList.jsp");
			forward.setRedirect(false);
			// 클래스 수정폼
		}else if (command.equals("/GetClassList.ad")) {
			forward = new ActionForward();
			action = new ClassListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ClassModifyForm.ad")) {
			forward = new ActionForward();
			action = new ClassDetailViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 클래스 수정
		} else if (command.equals("/ClassModifyPro.ad")) {
			forward = new ActionForward();
			action = new ClassModifyProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ClassDetailView.ad")) {
			forward = new ActionForward();
			action = new ClassDetailViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ClassDelete.ad")) {
			forward = new ActionForward();
			action = new ClassDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberSearch.ad")) {
			AdminSearchAction searchAction = new AdminSearchAction();
			searchAction.execute(request, response);
		}else if(command.equals("/MemberList.ad")) {
			forward = new ActionForward();
			forward.setPath("./admin_layout/member_management/memberList.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/MemberDetail.ad")) {
			forward = new ActionForward();
			action = new AdminMemberDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/OrderList.ad")) {
			forward = new ActionForward();
			forward.setPath("./admin_layout/order_management/orderList.jsp");
		}else if(command.equals("/OrderSearch.ad")) {
			AdminSearchAction searchAction = new AdminSearchAction();
			searchAction.execute(request, response);
			
		}else if(command.equals("/OrderDetail.ad")) {
			forward = new ActionForward();
			action = new AdminOrderDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/getReviewContent.ad")) {
			AdminSearchAction searchAction = new AdminSearchAction();
			searchAction.execute(request, response);
			
			//클래스 예약페이지 이동(추후 멤버 페이지로 옮길 예정)
		} else if(command.equals("/ClassReserv.ad")) {
			forward = new ActionForward();
			action = new ClassReservAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	//		forward.setPath("./admin_layout/class_member/classReserv.jsp");
	//		forward.setRedirect(false);
		//예약및 결제 페이지 
		} else if(command.equals("/ReservInsert.ad")){
			forward = new ActionForward();
			action = new ReservInsertAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/ReservInsertPro.ad")) {
			forward = new ActionForward();
			action = new ReservInsertProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if(command.equals("/ReservPay.ad")) {
			forward = new ActionForward();
			action = new ReservPayAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}  else if(command.equals("/ReservMiddleCancle.ad")) {
			forward = new ActionForward();
			action = new ReservMiddleCancleAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/ReservClassPlace.ad")) {
			forward = new ActionForward();
			action = new ReservClassPlaceAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/ReservClassTime.ad")) {
			forward = new ActionForward();
			action = new ReservClassTimeAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/ReservClassMem.ad")) {
			forward = new ActionForward();
			action = new ReservClassNumAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}


		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		} else {

		}
	}
	
	

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
