package vo;

public class OrderDetailBean {

	private int od_id; // 고유번호
	private int o_id; // 주문번호(참조키)
	private int i_id; // 상품번호
	private int l_id; // 편지지번호
	private int od_qty; // 주문수량
	private String od_message; // 편지 4번(직접입력) 선택시, 메세지가 기록되는 공간
	private int od_review; // 리뷰작성상태 0:미작성, 1:완료
	private String m_id; // 회원아이디
	private int c_id; // 장바구니번호 - 주문 후 장바구니 삭제를 위함
	private String od_delivery_date; // 배송요청일
	private String od_invoice; // 송장정보
	private int od_confirm; // 구매확정상태 0:미확정, 1:구매확정, 2:취소, 3:반품
	private String i_name; // 팀장님 편의상 만든 항목 (상품이름)

	public String getI_name() {
		return i_name;
	}

	public void setI_name(String i_name) {
		this.i_name = i_name;
	}

	public int getOd_id() {
		return od_id;
	}

	public void setOd_id(int od_id) {
		this.od_id = od_id;
	}

	public int getO_id() {
		return o_id;
	}

	public void setO_id(int o_id) {
		this.o_id = o_id;
	}

	public int getI_id() {
		return i_id;
	}

	public void setI_id(int i_id) {
		this.i_id = i_id;
	}

	public int getL_id() {
		return l_id;
	}

	public void setL_id(int l_id) {
		this.l_id = l_id;
	}

	public int getOd_qty() {
		return od_qty;
	}

	public void setOd_qty(int od_qty) {
		this.od_qty = od_qty;
	}

	public String getOd_message() {
		return od_message;
	}

	public void setOd_message(String od_message) {
		this.od_message = od_message;
	}

	public int getOd_review() {
		return od_review;
	}

	public void setOd_review(int od_review) {
		this.od_review = od_review;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public String getOd_delivery_date() {
		return od_delivery_date;
	}

	public void setOd_delivery_date(String od_delivery_date) {
		this.od_delivery_date = od_delivery_date;
	}

	public String getOd_invoice() {
		return od_invoice;
	}

	public void setOd_invoice(String od_invoice) {
		this.od_invoice = od_invoice;
	}

	public int getOd_confirm() {
		return od_confirm;
	}

	public void setOd_confirm(int od_confirm) {
		this.od_confirm = od_confirm;
	}

}
