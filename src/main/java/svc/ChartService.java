package svc;

import java.sql.Connection;
import java.util.HashMap;

import dao.MemberDAO;

import static db.JdbcUtil.*;

public class ChartService {

	public HashMap<String, Integer> getMemberData() {
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		HashMap<String, Integer> memberData = memberDAO.getMemberData();
		close(con);
		return memberData;
	}
	
}
