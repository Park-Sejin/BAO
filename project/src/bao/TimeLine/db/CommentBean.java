package bao.TimeLine.db;

import java.util.Date;

public class CommentBean {
	int cmt_num;
	int cmt_board_num;
	String cmt_email;
	String cmt_content;
	Date date;
	
	/*create table comment(
	cmt_num int primary key auto_increment,
	cmt_board_num int,
	cmt_email varchar(30),
	cmt_content varchar(500),
	date timestamp default now());*/
	
	public int getCmt_num() {
		return cmt_num;
	}
	public void setCmt_num(int ccmt_num) {
		this.cmt_num = ccmt_num;
	}
	public int getCmt_board_num() {
		return cmt_board_num;
	}
	public void setCmt_board_num(int cmt_board_num) {
		this.cmt_board_num = cmt_board_num;
	}
	public String getCmt_email() {
		return cmt_email;
	}
	public void setCmt_email(String cmt_email) {
		this.cmt_email = cmt_email;
	}
	public String getCmt_content() {
		return cmt_content;
	}
	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
