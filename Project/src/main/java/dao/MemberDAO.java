package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import vo.MemberBean;

public class MemberDAO {
	
	private static MemberDAO instance;
	
	private MemberDAO() {}
	
	public static MemberDAO getInstance() {
		if(instance == null) {
			instance = new MemberDAO();
		}
		
		return instance;
	}
	
	Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	//----------------------------------------------------------------
	
	public int insertMember(MemberBean memberBean) {
		
		int insertCount = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO member VALUES(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, memberBean.getM_id());
			pstmt.setString(2, memberBean.getM_pass());
			pstmt.setString(3, memberBean.getM_name());
			pstmt.setString(4, memberBean.getM_phone());
			pstmt.setString(5, memberBean.getM_birth());
			pstmt.setInt(6, memberBean.getM_gender());
			pstmt.setInt(7, 0);
			pstmt.setString(8, memberBean.getM_agree());
			pstmt.setString(9, memberBean.getM_address());
			pstmt.setTimestamp(10, memberBean.getM_rdate());
			pstmt.setString(11, memberBean.getM_drop());
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			close(pstmt);
		}
		
		return insertCount;
	}
	

}
