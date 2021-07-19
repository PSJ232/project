package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ClassDetailDAO;
import vo.ClassDetailBean;
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

}
