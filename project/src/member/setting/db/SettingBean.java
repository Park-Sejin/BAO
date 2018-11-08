package member.setting.db;

public class SettingBean {
	private int num;
	//회원정보수정_설정부분
	private String email;
	private String alram;
	private String color;
	//일정관리
	private int schedule1;
	private int schedule2;
	private String work;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAlram() {
		return alram;
	}
	public void setAlram(String alram) {
		this.alram = alram;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getSchedule1() {
		return schedule1;
	}
	public void setSchedule1(int schedule1) {
		this.schedule1 = schedule1;
	}
	public int getSchedule2() {
		return schedule2;
	}
	public void setSchedule2(int schedule2) {
		this.schedule2 = schedule2;
	}
	public String getWork() {
		return work;
	}
	public void setWork(String work) {
		this.work = work;
	}
	
}
