package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ClassDAO;
import vo.ClassBean;
import static db.JdbcUtil.*;

public class ReservListService {

	public ArrayList<ClassBean> getClassShopList() {
		System.out.println("ReservListService - getClassList()");
		ArrayList<ClassBean> classList = null;
		
		Connection con = getConnection();
		ClassDAO classDAO = ClassDAO.getInstance();
		classDAO.setConnection(con);
		
		classList = classDAO.getClassShopList();
		
		close(con);
		
		return classList;
	}

}
