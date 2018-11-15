package bao.TimeLine.db;

import java.util.Date;

public class BoardBean {
	
	private String content;
	private String write_file;
	private String img_file;
	private Date date;
	private String Member_user;
	private String project_name;
	private String table_type;
	
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
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public String getTable_type() {
		return table_type;
	}
	public void setTable_type(String table_type) {
		this.table_type = table_type;
	}
	

}
