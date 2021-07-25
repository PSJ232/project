package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.CartDAO;
import db.JdbcUtil;
import vo.CartBean;

public class CartService {

	public ArrayList<CartBean> selectCart(String m_id) {
		System.out.println("CartService - selectCart()");

		Connection con = getConnection();
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.setConnection(con);

		ArrayList<CartBean> cartList = cartDAO.getCart(m_id);

		JdbcUtil.close(con);

		return cartList;

	}

	// 오버로딩 - 매개변수 데이터타입 다름
	public CartBean selectCart(int c_id) {
		System.out.println("CartService - selectCart()");

		Connection con = getConnection();
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.setConnection(con);

		CartBean cartDetail = cartDAO.getCart(c_id);

		JdbcUtil.close(con);

		return cartDetail;

	}

	public boolean dropItem(int c_id) {
		System.out.println("CartService - dropItem()");
		boolean isItemDeleteSuccess = false;

		Connection con = JdbcUtil.getConnection();
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.setConnection(con);

		int deleteCount = cartDAO.deleteItem(c_id);

		if (deleteCount > 0) {
			JdbcUtil.commit(con);
			isItemDeleteSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}

		JdbcUtil.close(con);

		return isItemDeleteSuccess;
	}

	public boolean modifyCart(int c_id, int c_qty) {
		System.out.println("CartService - modifyCart()");
		boolean isUpdateSuccess = false;

		Connection con = JdbcUtil.getConnection();
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.setConnection(con);

		int updateCount = cartDAO.updateCart(c_id, c_qty);

		if (updateCount > 0) {
			JdbcUtil.commit(con);
			isUpdateSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}

		JdbcUtil.close(con);

		return isUpdateSuccess;
	}

	public boolean modifyLetter(int c_id, int c_letter) {
		System.out.println("CartService - modifyLetter()");
		boolean isUpdateSuccess = false;

		Connection con = JdbcUtil.getConnection();
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.setConnection(con);

		int updateCount = cartDAO.deleteLetter(c_id, c_letter);

		if (updateCount > 0) {
			JdbcUtil.commit(con);
			isUpdateSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}

		JdbcUtil.close(con);

		return isUpdateSuccess;
	}

	public boolean putCart(CartBean cartBean) {
		System.out.println("CartService - putCart()");
		boolean isInsertSuccess = false;

		Connection con = JdbcUtil.getConnection();
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.setConnection(con);

		int insertCount = cartDAO.insertCart(cartBean);

		if (insertCount > 0) {
			JdbcUtil.commit(con);
			isInsertSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}

		JdbcUtil.close(con);

		return isInsertSuccess;
	}

}
