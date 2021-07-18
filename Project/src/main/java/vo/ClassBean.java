package vo;

import java.sql.Timestamp;

public class ClassBean {
	private int class_id;
	private String class_subject;
	private String class_desc;
	private int class_price;
	private int class_max_member;
	private String class_main_img;
	private Timestamp class_create_date;
	private String class_sub_img1;
	private String class_sub_img2;
	private String class_sub_img3;
	private int class_current_member;
	private int class_readcount;
	
	public int getClass_current_member() {
		return class_current_member;
	}
	public void setClass_current_member(int class_current_member) {
		this.class_current_member = class_current_member;
	}
	public int getClass_readcount() {
		return class_readcount;
	}
	public void setClass_readcount(int class_readcount) {
		this.class_readcount = class_readcount;
	}
	public int getClass_id() {
		return class_id;
	}
	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}
	public String getClass_subject() {
		return class_subject;
	}
	public void setClass_subject(String class_subject) {
		this.class_subject = class_subject;
	}
	public String getClass_desc() {
		return class_desc;
	}
	public void setClass_desc(String class_desc) {
		this.class_desc = class_desc;
	}
	public int getClass_price() {
		return class_price;
	}
	public void setClass_price(int class_price) {
		this.class_price = class_price;
	}
	public int getClass_max_member() {
		return class_max_member;
	}
	public void setClass_max_member(int class_max_member) {
		this.class_max_member = class_max_member;
	}
	public String getClass_main_img() {
		return class_main_img;
	}
	public void setClass_main_img(String class_main_img) {
		this.class_main_img = class_main_img;
	}
	public Timestamp getClass_create_date() {
		return class_create_date;
	}
	public void setClass_create_date(Timestamp class_create_date) {
		this.class_create_date = class_create_date;
	}
	public String getClass_sub_img1() {
		return class_sub_img1;
	}
	public void setClass_sub_img1(String class_sub_img1) {
		this.class_sub_img1 = class_sub_img1;
	}
	public String getClass_sub_img2() {
		return class_sub_img2;
	}
	public void setClass_sub_img2(String class_sub_img2) {
		this.class_sub_img2 = class_sub_img2;
	}
	public String getClass_sub_img3() {
		return class_sub_img3;
	}
	public void setClass_sub_img3(String class_sub_img3) {
		this.class_sub_img3 = class_sub_img3;
	}
	@Override
	public String toString() {
		return "ClassBean [class_id=" + class_id + ", class_subject=" + class_subject + ", class_desc=" + class_desc
				+ ", class_price=" + class_price + ", class_max_member=" + class_max_member + ", class_main_img="
				+ class_main_img + ", class_create_date=" + class_create_date + ", class_sub_img1=" + class_sub_img1
				+ ", class_sub_img2=" + class_sub_img2 + ", class_sub_img3=" + class_sub_img3 + "]";
	}
	
}
