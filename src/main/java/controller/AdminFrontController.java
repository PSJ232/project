package controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.AdminDashBoardAction;
import action.AdminGetReservInfoAction;
import action.AdminInsertTrackingNumProAction;
import action.AdminMemberDetailAction;
import action.AdminMemberListAction;
import action.AdminOrderDetailAction;
import action.AdminOrderListAction;
import action.AdminQnaDeleteAnswerAction;
import action.AdminQnaDetailAction;
import action.AdminQnaListAction;
import action.AdminQnaGetListAction;
import action.AdminQnaWriteAnswerAction;
import action.AdminReviewDeleteAction;
import action.AdminReviewListAction;
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
import action.MemberChartAction;
import action.ReservClassNumAction;
import action.ReservClassPlaceAction;
import action.ReservClassTimeAction;
import action.ReservInsertAction;
import action.ReservInsertProAction;
import action.ReservMiddleCancleAction;
import action.ReservPayAction;
import svc.AdminDeleteReviewService;
import action.ClassTimeAddAction;
import action.ItemDeleteAction;
import vo.ActionForward;

@WebServlet("*.ad")
public class AdminFrontController extends HttpServlet {
	public void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");	

		// Action????????? upcasting?????? ???????????? ?????? ?????? ??????
		Action action = null;
		ActionForward forward = null;
		// ???????????? ?????? ????????? ?????? ???????????? ???????????? ??????
		String command = request.getServletPath();
		// ?????? ??????
		if (command.equals("/ItemList.ad")) {
			action = new ItemListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// ?????????????????????
		} else if (command.equals("/ItemDetail.ad")) {
			action = new ItemDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// ????????????????????? ??????
		} else if (command.equals("/ItemRegister.ad")) {
			forward = new ActionForward();
			forward.setPath("./admin_layout/item_manage/itemManageRegister.jsp");
			forward.setRedirect(false);
			// ??? ?????? ????????????
		} else if (command.equals("/ItemInsert.ad")) {
			action = new ItemInsertAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// ???????????? ??????
		} else if (command.equals("/ItemUpdate.ad")) {
			action = new ItemUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// ???????????? ?????????
		} else if (command.equals("/ItemUpdatePage.ad")) {
			action = new ItemDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// ?????? ??????
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
			// ????????? ??????Pro
		} else if (command.equals("/ClassInsertPro.ad")) {
			forward = new ActionForward();
			action = new ClassInsertProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// ????????? ?????? ?????????
		} else if (command.equals("/TimeList.ad")) {
			forward = new ActionForward();
			action = new ClassDetailSelectTimelistAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// ???????????? ??????
		} else if (command.equals("/ClassDetailadd.ad")) {
			forward = new ActionForward();
			action = new ClassTimeAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// ????????? ?????????
		} else if (command.equals("/ClassList.ad")) {
			forward = new ActionForward();
			forward.setPath("./admin_layout/class_management/classList.jsp");
			forward.setRedirect(false);
			// ????????? ?????????
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
			// ????????? ??????
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
			action = new AdminMemberListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
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
			action = new AdminOrderListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
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
			
			//????????? ??????????????? ??????(?????? ?????? ???????????? ?????? ??????)
		} else if(command.equals("/InsertTrackingNum.ad")) {
			forward = new ActionForward();
			forward.setPath("./admin_layout/order_management/insertTrackingNum.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/InsertTrackingNumPro.ad")) {
			forward = new ActionForward();
			action = new AdminInsertTrackingNumProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/GetQnaList.ad")) {
			AdminQnaGetListAction q_action = new AdminQnaGetListAction();
			try {
				q_action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/QnaList.ad")) {
			forward = new ActionForward();
			action = new AdminQnaListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/QnaDetail.ad")) {
			forward = new ActionForward();
			action = new AdminQnaDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/WriteAnswer.ad")) {
			forward = new ActionForward();
			action = new AdminQnaDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/WriteAnswerPro.ad")) {
			forward = new ActionForward();
			action = new AdminQnaWriteAnswerAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/DeleteQna.ad")) {
			forward = new ActionForward();
			action = new AdminQnaDeleteAnswerAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/SalesManage.ad")) {
			forward = new ActionForward();
			forward.setPath("./admin_layout/sales_management/salesManage.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/GetReservInfo.ad")) {
			AdminGetReservInfoAction reservAction = new AdminGetReservInfoAction();
			try {
				reservAction.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/ReviewList.ad")) {
			forward = new ActionForward();
			action = new AdminReviewListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/DeleteReview.ad")) {
			forward = new ActionForward();
			action = new AdminReviewDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/DashBoard.ad")) {
			forward = new ActionForward();
			action = new AdminDashBoardAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/Chart.ad")) {
			forward = new ActionForward();
			action = new MemberChartAction();
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
