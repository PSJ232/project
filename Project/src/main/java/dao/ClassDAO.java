package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.ClassBean;
import static db.JdbcUtil.*;

public class ClassDAO {
	
	private ClassDAO() {}
	private static ClassDAO instance;
	
	public static ClassDAO getInstance() {
		if(instance == null) {
			instance = new ClassDAO();
		}
		return instance;
	}
	
	Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public int insertClass(ClassBean classBean) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int insertCount = 0;
		try {
			String sql = "SELECT MAX(f_id) FROM fclass";
			int num = 1;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1);
				num++;
			}
			sql = "INSERT INTO fclass VALUES(?,?,?,?,?,?,now(),?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, classBean.getClass_subject());
			pstmt.setString(3, classBean.getClass_desc());
			pstmt.setInt(4, classBean.getClass_price());
			pstmt.setInt(5, classBean.getClass_max_member());
			pstmt.setString(6, classBean.getClass_main_img());
			pstmt.setString(7, classBean.getClass_sub_img1());
			pstmt.setString(8, classBean.getClass_sub_img2());
			pstmt.setString(9, classBean.getClass_sub_img3());
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL구문 오류! - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return insertCount;
	}
	
	
}
