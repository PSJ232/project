package svc;

import java.sql.Connection;
import java.text.SimpleDateFormat;

import dao.OrderDAO;
import db.JdbcUtil;

public class IdMakerService {
	
	public int newId(String table, String colName) {
		System.out.println("IdMakerService");
		int newId = 0;
		
		SimpleDateFormat shortDate = new SimpleDateFormat("yyyyMMdd"); // 날짜 포멧 변경
		int now = Integer.parseInt(shortDate.format(System.currentTimeMillis())); // system날짜 기준
		
		
		Connection con = JdbcUtil.getConnection();
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);

		int maxNum = orderDAO.makeId(table, colName);
		System.out.println("아이디는" + maxNum);
		
		if (maxNum > 0) { // 0 보다 크다는 말은 DB에서 추출 성공
			JdbcUtil.commit(con);
		
			if(maxNum / 100 == now) { //최근 기록날짜가 오늘 날짜와 같은지 판별
				newId = maxNum + 1; // 같다면 추출한 최대숫자에 + 1
			} else {
				newId = (now * 100) + 1; // 다르다면 첫번째 번호이므로 001 부여
			}
			
		} else {
			JdbcUtil.rollback(con);
		}
		JdbcUtil.close(con);
		
		return newId;
	}

}
