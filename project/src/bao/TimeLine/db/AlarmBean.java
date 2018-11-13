package bao.TimeLine.db;

import java.util.Date;

public class AlarmBean {
	private int num;
	private int project_num;
	private int member_num;
	private int twrite_num;
	private Date date;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getProject_num() {
		return project_num;
	}
	public void setProject_num(int project_num) {
		this.project_num = project_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public int getTwrite_num() {
		return twrite_num;
	}
	public void setTwrite_num(int twrite_num) {
		this.twrite_num = twrite_num;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
}
