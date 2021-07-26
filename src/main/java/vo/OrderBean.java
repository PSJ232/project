package vo;

import java.sql.Date;

public class OrderBean {
	private int o_id;
	private String m_id;
	private String o_sender;
	private String o_address;
	private String o_receiver;
	private String o_phone;
	private int o_amount;
	private int o_point;
	private int o_payment;
	private Date o_rdate;
	private int o_gdiscount;
	private String o_request;

	public String getO_request() {
		return o_request;
	}

	public void setO_request(String od_request) {
		this.o_request = od_request;
	}

	public int getO_id() {
		return o_id;
	}

	public void setO_id(int o_id) {
		this.o_id = o_id;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getO_sender() {
		return o_sender;
	}

	public void setO_sender(String o_sender) {
		this.o_sender = o_sender;
	}

	public String getO_address() {
		return o_address;
	}

	public void setO_address(String o_address) {
		this.o_address = o_address;
	}

	public String getO_receiver() {
		return o_receiver;
	}

	public void setO_receiver(String o_receiver) {
		this.o_receiver = o_receiver;
	}

	public String getO_phone() {
		return o_phone;
	}

	public void setO_phone(String o_phone) {
		this.o_phone = o_phone;
	}

	public int getO_amount() {
		return o_amount;
	}

	public void setO_amount(int o_amount) {
		this.o_amount = o_amount;
	}

	public int getO_point() {
		return o_point;
	}

	public void setO_point(int o_point) {
		this.o_point = o_point;
	}

	public int getO_payment() {
		return o_payment;
	}

	public void setO_payment(int o_payment) {
		this.o_payment = o_payment;
	}

	public Date getO_rdate() {
		return o_rdate;
	}

	public void setO_rdate(Date o_rdate) {
		this.o_rdate = o_rdate;
	}

	public int getO_gdiscount() {
		return o_gdiscount;
	}

	public void setO_gdiscount(int o_gdiscount) {
		this.o_gdiscount = o_gdiscount;
	}

}
