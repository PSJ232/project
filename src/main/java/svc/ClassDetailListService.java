package svc;

import java.sql.Connection;
import java.text.NumberFormat;
import java.util.ArrayList;

import dao.ClassDetailDAO;
import dao.ReservDAO;
import vo.ClassDetailBean;
import vo.ReservBean;

import static db.JdbcUtil.*;

public class ClassDetailListService {

	public ArrayList<ClassDetailBean> getDetailList() {
		Connection con = getConnection();
		ClassDetailDAO classDetailDAO = ClassDetailDAO.getInstance();
		classDetailDAO.setConnection(con);
		ArrayList<ClassDetailBean> detailList = classDetailDAO.getDetailList();
		close(con);
		return detailList;
	}

	public String getReservInfo(String place, String time, String date) {
		Connection con = getConnection();
		ReservDAO reservDAO = ReservDAO.getInstance();
		reservDAO.setConnection(con);
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ArrayList<ReservBean> resultList = reservDAO.getReservInfo(place, time, date);
		
		for(int i = 0; i < resultList.size(); i++) {
			result.append("[{\"value\": \"" + resultList.get(i).getR_id() + "\"},");
			result.append("{\"value\": \"" + resultList.get(i).getM_id() + "\"},");
			result.append("{\"value\": \"" + resultList.get(i).getR_num() + "명\"},");
			result.append("{\"value\": \"" + resultList.get(i).getR_date() + "\"},");
			result.append("{\"value\": \"" + NumberFormat.getInstance().format(resultList.get(i).getR_amount()) + "원\"},");
			result.append("{\"value\": \"" + resultList.get(i).getR_payment() + "\"}],");
		}
		result.append("]}");
		
		close(con);
		
		return result.toString();
	}

}
