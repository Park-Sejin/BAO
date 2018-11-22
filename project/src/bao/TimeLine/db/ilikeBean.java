package bao.TimeLine.db;

public class ilikeBean {
	int num;
	String like_email;
	int b_num;
	int push_cnt;
	/*int total;*/
	
	/*create table ilike(
	num int primary key auto_increment,
	like_email varchar(30),
	b_num int,
	push_cnt int,
	total int);*/
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getLike_email() {
		return like_email;
	}
	public void setLike_email(String like_email) {
		this.like_email = like_email;
	}
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public int getPush_cnt() {
		return push_cnt;
	}
	public void setPush_cnt(int push_cnt) {
		this.push_cnt = push_cnt;
	}
	/*public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}*/
	
	
}
