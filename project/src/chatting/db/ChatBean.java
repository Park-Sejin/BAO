package chatting.db;

import java.util.Date;

public class ChatBean {
	int num;
	String receiver;
	String sender;
	String message;
	Date date;
	int read_cnt;
	
	/*
	create table chat(
	num int primary key auto_increment,
	receiver varchar(45),
	sender varchar(45),
	message text,
	date timestamp default now(),
	read_cnt int default 1);
	 */
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getRead_cnt() {
		return read_cnt;
	}
	public void setRead_cnt(int read_cnt) {
		this.read_cnt = read_cnt;
	}
	
}
