package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ClassDAO;
import vo.ClassBean;

import static db.JdbcUtil.close;

public class ClassReservService {

	public ArrayList<String> getPlaceList(String f_subject) {
		System.out.println("ClassReservService - getPlaceList(String f_subject)");
		ArrayList<String> classList = null;
		//Conneciton 객체 전달
		Connection con = getConnection();
		ClassDAO classDAO = ClassDAO.getInstance();
		classDAO.setConnection(con);
		
		classList = classDAO.availableClassList(f_subject);
		
		close(con);
		
		return classList;
	}

	public int getClassId(String f_place, String f_subject) {
		
		System.out.println("ClassReservService - getClassId(String f_place)");
		int f_id = 0;
		//Conneciton 객체 전달
		Connection con = getConnection();
		ClassDAO classDAO = ClassDAO.getInstance();
		classDAO.setConnection(con);
		
		f_id = classDAO.getClassId(f_place, f_subject);
		
		close(con);
		
		return f_id;
	}


}
