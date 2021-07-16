package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.JdbcUtil;
import vo.OrderBean;

public class OrderDAO {
	
	private static OrderDAO instance;
	private OrderDAO() {}
	public static OrderDAO getInstance() {
		if(instance == null) {
			instance = new OrderDAO();
		}
		return instance;
	}
	
	Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	public int insertOrder(OrderBean orderBean) {
		System.out.println("OrderDAO - insertOrder()");
		
		int insertCount = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql ="INSERT INTO orders VALUES(?,?,?,?,?,?,?,?,?,?,now(),?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, orderBean.getO_id());
			pstmt.setString(2, orderBean.getM_id());
			pstmt.setString(3, orderBean.getO_sender());
			pstmt.setString(4, orderBean.getO_address());
			pstmt.setString(5, orderBean.getO_receiver());
			pstmt.setString(6, orderBean.getO_phone());
			pstmt.setString(7, orderBean.getO_delivery_date());
			pstmt.setInt(8, orderBean.getO_amount());
			pstmt.setInt(9, orderBean.getO_point());
			pstmt.setInt(10, orderBean.getO_payment());
			//rdate는 sql구문에 바로 now()
			pstmt.setString(11, "주문접수"); //배송상태 기본값 주문접수
			pstmt.setInt(12, 0); //구매확정 기본값 0
			
			insertCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
		}
		
		return insertCount;
	}
	
	
	
	
	
	
	
}
