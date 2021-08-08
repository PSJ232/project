package svc;

import java.sql.Connection;
import java.sql.Time;
import java.util.ArrayList;

import dao.ClassDAO;
import dao.ClassDetailDAO;
import vo.ClassBean;
import vo.ClassDetailBean;

import static db.JdbcUtil.*;

public class ClassDetailViewService {
	public ClassBean getDetailContent(int class_num) {
		Connection con = getConnection();
		ClassDAO classDAO = ClassDAO.getInstance();
		classDAO.setConnection(con);
		ClassBean classBean = classDAO.getDetailContent(class_num);
		close(con);
		return classBean;
	}
	

	public int getClassDetailId(ClassDetailBean cdb, String fd_time) {
		Connection con = getConnection();
		ClassDetailDAO classDetailDAO = ClassDetailDAO.getInstance();
		classDetailDAO.setConnection(con);

		int fd_id = classDetailDAO.getClassDetailId(cdb, fd_time);
		
		return fd_id;
	}
}
