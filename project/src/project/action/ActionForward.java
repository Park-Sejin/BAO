package project.action;

public class ActionForward {
	
	// 이동정보 저장 객체 (이동할 페이지주소, 이동할 페이지 방식)
	
	private String path; // 페이지주소
	
	// true - sendRedirect방식으로 페이지 이동
	// false - forward 방식으로 페이지 이동
	private boolean isRedirect; // 이동방식
	
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	

}
