package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ClassDAO;
import vo.ClassBean;
import static db.JdbcUtil.*;

public class MypageClassListService {
	
	public ArrayList<ClassBean> selectMypageStartClassList(String m_id) {
		System.out.println("MypageClassListService - selectMypageStartClassList()");
		
		Connection con = getConnection();
		ClassDAO classDAO = ClassDAO.getInstance();
		classDAO.setConnection(con);
		ArrayList<ClassBean> classStartList = classDAO.getMypageStartClassList(m_id);
		
		return classStartList;
	}
	
	public ArrayList<ClassBean> selectMypageEndClassList(String m_id) {
		System.out.println("MypageClassListService - selectMypageEndClassList()");
		
		Connection con = getConnection();
		ClassDAO classDAO = ClassDAO.getInstance();
		classDAO.setConnection(con);
		ArrayList<ClassBean> classEndList = classDAO.getMypageStartClassList(m_id);
		
		return classEndList;
	}

}
