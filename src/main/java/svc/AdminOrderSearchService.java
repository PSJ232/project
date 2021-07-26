package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.OrderDAO;
import vo.OrderListBean;

public class AdminOrderSearchService {
		public String getJSON(String search_val, String filter) {
			Connection con = getConnection();
			if(search_val == null) search_val = "";
			StringBuffer result = new StringBuffer("");
			result.append("{\"result\":[");
			OrderDAO orderDAO = OrderDAO.getInstance();
			orderDAO.setConnection(con);
			ArrayList<OrderListBean> resultList = orderDAO.search(search_val, filter);
			for(int i = 0; i < resultList.size(); i++) {
				result.append("[{\"value\": \"" + resultList.get(i).getO_id() + "\"},");
				result.append("{\"value\": \"" + resultList.get(i).getM_id() + "\"},");
				result.append("{\"value\": \"" + resultList.get(i).getI_name() + "\"},");
				result.append("{\"value\": \"" + resultList.get(i).getO_amount() + "\"},");
				result.append("{\"value\": \"" + resultList.get(i).getO_rdate() + "\"},");
				result.append("{\"value\": \"" + resultList.get(i).getOd_invoice() + "\"}],");
			}
			result.append("]}");
			close(con);
			
			return result.toString();
		}

		public ArrayList<OrderListBean> getMemberOrders(String m_id) {
			Connection con = getConnection();
			OrderDAO orderDAO = OrderDAO.getInstance();
			orderDAO.setConnection(con);
			ArrayList<OrderListBean> orderList = orderDAO.search(m_id,"1");
			close(con);
			return orderList;
		}
	}
