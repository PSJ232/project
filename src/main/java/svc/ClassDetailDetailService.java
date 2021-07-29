package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.ClassDAO;
import dao.ClassDetailDAO;
import vo.ClassBean;
import vo.ClassDetailBean;

public class ClassDetailDetailService {
	public ClassDetailBean getDetail(int fd_id) {
		System.out.println("ClassDetailService - getDetail(int fd_id)");
		ClassDetailBean classDetailBean = null;
		//Conneciton 객체 전달
		Connection con = getConnection();
		ClassDetailDAO classDetailDAO = ClassDetailDAO.getInstance();
		classDetailDAO.setConnection(con);
		
		//ClassDetail 테이블에서 fd_id로 열 조회 후 저장
		classDetailBean = classDetailDAO.getDetail(fd_id);
		close(con);
		return classDetailBean;
	}
}
