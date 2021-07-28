package vo;

import java.sql.Date;

public class OrderBean {
	private int o_id; // 주문번호
	private String m_id; // 회원아이디
	private String o_sender; // 보내는사람
	private String o_address; // 배송지
	private String o_receiver; // 받는 사람
	private String o_phone; // 받는사람 연락처
	private int o_amount; // 총주문금액((상품원가 * 상품할인율 * 수량) + 편지)
	private int o_point; // 사용포인트
	private int o_payment; // 결제수단 0:계좌이체, 1:신용카드, 2:카카오페이, 3:네이버페이 (미정)
	private Date o_rdate; // 주문등록일(DB시간 동기화)
	private int o_gdiscount; // 등급할인액
	private String o_visitor; // 비회원구매시 회원아이디는 "visitor"로 고정되므로, 전화번로가 저장되고 값유무로 회원 비회원 판별

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

	public String getO_visitor() {
		return o_visitor;
	}

	public void setO_visitor(String o_visitor) {
		this.o_visitor = o_visitor;
	}

}
