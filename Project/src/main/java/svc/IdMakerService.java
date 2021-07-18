package svc;

import java.sql.Connection;
import java.text.SimpleDateFormat;

import dao.OrderDAO;
import db.JdbcUtil;

public class IdMakerService {
	
	public int newId(String table, String colName) {
		System.out.println("IdMakerService - newId()");
		int newId = 0;
		
		SimpleDateFormat shortDate = new SimpleDateFormat("yyyyMMdd"); // 날짜 포멧 변경
		int now = Integer.parseInt(shortDate.format(System.currentTimeMillis())); // system날짜 기준
		
		
		Connection con = JdbcUtil.getConnection();
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);

		int maxNum = orderDAO.makeId(table, colName);
		//20210101XX 패턴인지 판별 
		if (maxNum / 2000000000 > 0) {//맞으면
			if(maxNum / 100 == now) { //최근 기록날짜가 오늘 날짜와 같은지 판별
				newId = maxNum + 1; // 같다면 추출한 최대숫자에 + 1
				JdbcUtil.commit(con);
			} else { 
				newId = (now * 100) + 1; // 다르다면 첫번째 번호이므로 001 부여
				JdbcUtil.commit(con);
			}
		} else if (maxNum >= 0) { //20210101XX 패턴이 아니면 단순숫자증가패턴
			
			newId = maxNum + 1; //추출한 최대숫자에 + 1 
			JdbcUtil.commit(con);
			
		} else { // null값이면 롤백
			
			JdbcUtil.rollback(con);
			
		}
		
		JdbcUtil.close(con);
		
		System.out.println("생성된 id번호 : " + newId);
		
		return newId;
	}

}
