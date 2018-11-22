package bao.TimeLine.db;

import java.util.Date;

public class TotalBean {
	
	
	// 글
	private int num;
	private String content;
	private String write_file;
	private String img_file;
	private Date date;
	private String Member_user;
	private int project_num;
	private String table_type;
	
	// 업무
	private String duty_title;
	private String duty_content;
	private String duty_file;
	private String duty_imgfile;
	private String duty_admin;
	private String duty_firstday;
	private String duty_lastday;
	private Date Ddate;
	private String DTable;
	
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
	public String getDuty_title() {
		return duty_title;
	}
	public void setDuty_title(String duty_title) {
		this.duty_title = duty_title;
	}
	public String getDuty_content() {
		return duty_content;
	}
	public void setDuty_content(String duty_content) {
		this.duty_content = duty_content;
	}
	public String getDuty_file() {
		return duty_file;
	}
	public void setDuty_file(String duty_file) {
		this.duty_file = duty_file;
	}
	public String getDuty_imgfile() {
		return duty_imgfile;
	}
	public void setDuty_imgfile(String duty_imgfile) {
		this.duty_imgfile = duty_imgfile;
	}
	public String getDuty_admin() {
		return duty_admin;
	}
	public void setDuty_admin(String duty_admin) {
		this.duty_admin = duty_admin;
	}
	public String getDuty_firstday() {
		return duty_firstday;
	}
	public void setDuty_firstday(String duty_firstday) {
		this.duty_firstday = duty_firstday;
	}
	public String getDuty_lastday() {
		return duty_lastday;
	}
	public void setDuty_lastday(String duty_lastday) {
		this.duty_lastday = duty_lastday;
	}
	public Date getDdate() {
		return Ddate;
	}
	public void setDdate(Date ddate) {
		Ddate = ddate;
	}
	public String getDTable() {
		return DTable;
	}
	public void setDTable(String dTable) {
		DTable = dTable;
	}

	
	
	
	
	
	
	

}
