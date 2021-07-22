package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.ClassBean;
import vo.ClassDetailBean;

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
			
			sql = "INSERT INTO fclass VALUES(?,?,?,?,?,?,0,?,?,?,?,now(),0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, classBean.getClass_place());
			pstmt.setString(3, classBean.getClass_subject());
			pstmt.setString(4, classBean.getClass_desc());
			pstmt.setInt(5, classBean.getClass_price());
			pstmt.setInt(6, classBean.getClass_max_member());
			pstmt.setString(7, classBean.getClass_main_img());
			pstmt.setString(8, classBean.getClass_sub_img1());
			pstmt.setString(9, classBean.getClass_sub_img2());
			pstmt.setString(10, classBean.getClass_sub_img3());
			insertCount = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			System.out.println("SQL구문 오류! - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return insertCount;
	}

	public ArrayList<ClassBean> getClassList() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ClassBean> classList = new ArrayList<ClassBean>();
		try {
			String sql = "SELECT * FROM fclass ORDER BY f_id DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ClassBean classBean = new ClassBean();
				classBean.setClass_id(rs.getInt("f_id"));
				classBean.setClass_subject(rs.getString("f_subject"));
				classBean.setClass_desc(rs.getString("f_desc"));
				classBean.setClass_price(rs.getInt("f_price"));
				classBean.setClass_max_member(rs.getInt("f_maxmem"));
				classBean.setClass_main_img(rs.getString("f_main_img"));
				classBean.setClass_create_date(rs.getTimestamp("f_rdate"));
				classBean.setClass_sub_img1(rs.getString("f_sub_img1"));
				classBean.setClass_sub_img2(rs.getString("f_sub_img2"));
				classBean.setClass_sub_img3(rs.getString("f_sub_img3"));
				classList.add(classBean);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문오류! - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		return classList;
	}

	public void deleteNull() {
		PreparedStatement pstmt = null;
		try {
			String sql = "DELETE FROM fclass_detail WHERE f_id IS NULL";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL구문 오류! - " + e.getMessage());
		} finally {
			close(pstmt);
		}
	}
	
}
