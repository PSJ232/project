package vo;

import java.sql.Date;

public class CartBean {
	private int c_id;
	private int i_id;
	private String m_id;
	private int c_qty;
	private int c_letter;
	private Date c_delivery_date;
	private Date c_rdate;
	
	
	
	
	public int getC_letter() {
		return c_letter;
	}
	public void setC_letter(int c_letter) {
		this.c_letter = c_letter;
	}
	public Date getC_delivery_date() {
		return c_delivery_date;
	}
	public void setC_delivery_date(Date c_delivery_date) {
		this.c_delivery_date = c_delivery_date;
	}
	
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public int getI_id() {
		return i_id;
	}
	public void setI_id(int i_id) {
		this.i_id = i_id;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getC_qty() {
		return c_qty;
	}
	public void setC_qty(int c_qty) {
		this.c_qty = c_qty;
	}
	public Date getC_rdate() {
		return c_rdate;
	}
	public void setC_rdate(Date c_rdate) {
		this.c_rdate = c_rdate;
	}
	
	
}
