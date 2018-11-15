package bao.TimeLine.db;

import java.util.Date;

public class TotalBean {
	
	
	// 글
	private String content;
	private String write_file;
	private String img_file;
	private Date Tdate;
	private String Member_user;
	private String Table;
	
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

	
	
	public String getTable() {
		return Table;
	}
	public void setTable(String table) {
		Table = table;
	}
	public String getDTable() {
		return DTable;
	}
	public void setDTable(String dTable) {
		DTable = dTable;
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
	public Date getTdate() {
		return Tdate;
	}
	public void setTdate(Date tdate) {
		Tdate = tdate;
	}
	public String getMember_user() {
		return Member_user;
	}
	public void setMember_user(String member_user) {
		Member_user = member_user;
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
	
	
	
	

}
