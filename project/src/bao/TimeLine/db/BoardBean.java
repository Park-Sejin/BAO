package bao.TimeLine.db;

import java.util.Date;

public class BoardBean {
	private int num;
	private String content;
	private String write_file;
	private String img_file;
	private Date date;
	private String Member_user;
	private int project_num;
	private String table_type;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWrite_file() {
		return write_file;
	}
	public void setWrite_file(String write_file) {
		this.write_file = write_file;
	}
	public String getImg_file() {
		return img_file;
	}
	public void setImg_file(String img_file) {
		this.img_file = img_file;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getMember_user() {
		return Member_user;
	}
	public void setMember_user(String member_user) {
		Member_user = member_user;
	}
	public int getProject_num() {
		return project_num;
	}
	public void setProject_num(int project_num) {
		this.project_num = project_num;
	}
	public String getTable_type() {
		return table_type;
	}
	public void setTable_type(String table_type) {
		this.table_type = table_type;
	}
	

}
