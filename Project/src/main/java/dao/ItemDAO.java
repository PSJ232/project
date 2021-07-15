package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;
import vo.ItemBean;

public class ItemDAO {
	
	private static ItemDAO instance;
	
	private ItemDAO() {}
	
	public static ItemDAO getInstance() {
		// 기존 BoardDAO 인스턴스가 생성된 적이 없을 경우 인스턴스 생성 후 리턴
		if(instance == null) {
			instance = new ItemDAO();
		}
		
		return instance;
	}
	// ----------------------------------------------------------------------------------
	// 외부의 Service 클래스로부터 Connection 객체를 전달받아 Connection 타입 변수에 저장
	Connection con;// 멤버변수 Connection 타입 선언
	
	public void setConnection(Connection con) {
		this.con = con;
	}

	public ItemBean getItem(String i_id) { //등록된 아이템에 대한 디테일 정보를 가져옴
		System.out.println("ItemDAO - getItem()");
		
		ItemBean itemDetail = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM item WHERE i_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, i_id);// 아이디=이메일
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				itemDetail = new ItemBean();
				//itemDetail.setI_id(rs.getString("m_id"));
				//itemBean 내용작업해야됨 - 관리자팀과 협의
				
				
				
				
				
				
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		
		return itemDetail;
	}

	
	
	
	
	
	
	
}
