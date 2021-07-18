package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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

	public ItemBean getItem(int i_id) { //등록된 아이템에 대한 디테일 정보를 가져옴
		System.out.println("ItemDAO - getItem()");
		
		ItemBean itemDetail = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM item WHERE i_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, i_id);// 아이디=이메일
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				itemDetail = new ItemBean();
				itemDetail.setI_id(rs.getInt("i_id"));
				itemDetail.setI_name(rs.getString("i_name"));
				itemDetail.setI_desc(rs.getString("i_desc"));
				itemDetail.setI_price(rs.getInt("i_price"));
				itemDetail.setI_inven(rs.getInt("i_inven"));
				itemDetail.setI_img(rs.getString("i_img"));
				itemDetail.setI_subimg2(rs.getString("i_subimg2"));
				itemDetail.setI_subimg3(rs.getString("i_subimg3"));
				itemDetail.setI_subimg4(rs.getString("i_subimg4"));
				itemDetail.setI_rdate(rs.getTimestamp("i_rdate"));
				itemDetail.setI_discount(rs.getFloat("i_discount"));
				itemDetail.setI_size(rs.getString("i_size"));
				itemDetail.setI_dpstatus(rs.getString("i_dpstatus"));
				itemDetail.setI_itemstatus(rs.getString("i_itemstatus"));
				itemDetail.setI_detailpage(rs.getString("i_detailpage"));
				
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return itemDetail;
	}
	
	//상품목록 가져오기
	public ArrayList<ItemBean> selectItemList() {
		
		ArrayList<ItemBean> itemList = null;
		ItemBean ib = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//최근 등록한 상품부터 내림차순으로 SELECT
		try {
			String sql = "SELECT * FROM item ORDER BY i_rdate DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			itemList = new ArrayList<ItemBean>();
			
			while(rs.next()) {
				ib = new ItemBean();
				ib.setI_id(rs.getInt("i_id"));
				ib.setI_name(rs.getString("i_name"));
				ib.setI_desc(rs.getString("i_desc"));
				ib.setI_price(rs.getInt("i_price"));
				ib.setI_inven(rs.getInt("i_inven"));
				ib.setI_img(rs.getString("i_img"));
				ib.setI_subimg2(rs.getString("i_subimg2"));
				ib.setI_subimg3(rs.getString("i_subimg3"));
				ib.setI_subimg4(rs.getString("i_subimg4"));
				ib.setI_rdate(rs.getTimestamp("i_rdate"));
				ib.setI_discount(rs.getFloat("i_discount"));
				ib.setI_size(rs.getString("i_size"));
				ib.setI_dpstatus(rs.getString("i_dpstatus"));
				ib.setI_itemstatus(rs.getString("i_itemstatus"));
				
				itemList.add(ib);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return itemList;
	}

	public void selectItem() {
		
		
	}

	//상품등록 db작업 처리
	public int insertItem(ItemBean ib) {
		//db작업 처리된 행 수
		int insertCount = 0;
		System.out.println("itemDAO - insertItem");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "INSERT INTO item VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ib.getI_id());
			pstmt.setString(2, ib.getI_name());
			pstmt.setString(3, ib.getI_desc());
			pstmt.setInt(4, ib.getI_price());
			pstmt.setInt(5, ib.getI_inven());
			pstmt.setString(6, ib.getI_img());
			pstmt.setString(7, ib.getI_subimg2());
			pstmt.setString(8, ib.getI_subimg3());
			pstmt.setString(9, ib.getI_subimg4());
			pstmt.setTimestamp(10, ib.getI_rdate());
			pstmt.setFloat(11, ib.getI_discount());
			pstmt.setString(12, ib.getI_size());
			pstmt.setString(13, ib.getI_dpstatus());
			pstmt.setString(14, ib.getI_itemstatus());
			pstmt.setString(15, ib.getI_detailpage());
			
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류발생 - " + e.getMessage());
		} finally {
			close(pstmt);
		}
		
		return insertCount;
	}

	
	
	
	
	
	
	
}
