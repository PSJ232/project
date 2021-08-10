package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.text.NumberFormat;
import java.util.ArrayList;

import com.google.gson.Gson;

import dao.MemberDAO;
import dao.OrderDAO;
import vo.DetailBean;
import vo.PageInfo;

public class AdminOrderSearchService {
		public String getJSON(String search_val, String filter) {
			Connection con = getConnection();
			if(search_val == null) search_val = "";
			StringBuffer result = new StringBuffer("");
			result.append("{\"result\":[");
			OrderDAO orderDAO = OrderDAO.getInstance();
			orderDAO.setConnection(con);
			ArrayList<DetailBean> resultList = orderDAO.search(search_val, filter);
			for(int i = 0; i < resultList.size(); i++) {
				result.append("[{\"value\": \"" + resultList.get(i).getO_id() + "\"},");
				result.append("{\"value\": \"" + resultList.get(i).getM_id() + "\"},");
				result.append("{\"value\": \"" + resultList.get(i).getI_name() + "\"},");
				result.append("{\"value\": \"" + NumberFormat.getInstance().format(resultList.get(i).getO_amount()) + "\"},");
				result.append("{\"value\": \"" + resultList.get(i).getO_rdate() + "\"},");
				if(!resultList.get(i).getOd_invoice().equals("주문접수") && resultList.get(i).getOd_confirm() == 0) {
					result.append("{\"value\": \"" + "배송중" + "\"}],");
				}else if(!resultList.get(i).getOd_invoice().equals("주문접수") && resultList.get(i).getOd_confirm() == 1) {
					result.append("{\"value\": \"" + "배송완료" + "\"}],");
				}else if(resultList.get(i).getOd_confirm() == 2) {
					result.append("{\"value\": \"" + "주문취소" + "\"}],");
				}
				else {
					result.append("{\"value\": \"" + resultList.get(i).getOd_invoice() + "\"}],");
				}
				
			}
			result.append("]}");
			close(con);
			
			return result.toString();
		}

		public ArrayList<DetailBean> getMemberOrders(String m_id) {
			Connection con = getConnection();
			OrderDAO orderDAO = OrderDAO.getInstance();
			orderDAO.setConnection(con);
			ArrayList<DetailBean> orderList = orderDAO.search(m_id,"1");
			close(con);
			return orderList;
		}

	}
