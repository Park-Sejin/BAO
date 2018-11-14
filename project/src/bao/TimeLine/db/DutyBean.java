package bao.TimeLine.db;

import java.util.Date;

public class DutyBean {
	private String duty_title;
	private String duty_content;
	private String duty_file;
	private String duty_imgfile;
	private String duty_admin;
	private String duty_firstday;
	private String duty_lastday;
	private Date date;
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
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
	

}
