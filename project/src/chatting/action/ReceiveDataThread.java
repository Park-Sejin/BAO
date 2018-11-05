package chatting.action;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.net.Socket;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chatting.action.ActionForward;

public class ReceiveDataThread implements Action, Runnable{
	Socket client; // 서버와 통신하기 위한 소켓
	ObjectInputStream ois; // 서버로부터 데이터를 수신받기 위한 스트림
	String receiveData; // 서버로부터 수신받은 데이터를 저장하기 위한 변수
	
	String receive_email;
	
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		request.setAttribute("receiveData", receiveData); 
		
		ActionForward forward = new ActionForward();
		forward.setPath("./chatHandling.chat");
		forward.setRedirect(false);
		return forward;
	}

	// 접속 요청한 소켓 객체와 입력 스트림이 전달됨
	public ReceiveDataThread(Socket s, ObjectInputStream ois, String receive_email) {
		client = s;
		this.ois = ois;
		this.receive_email = receive_email;
	}// ReceiveDataThread 클래스의 생성자의 끝
			
			
	@Override
	public void run() {
		try {
			// 입력 스트림을 통해 데이터를 읽어 와서 출력
			while ((receiveData = (String) ois.readObject()) != null){
				
				System.out.println(receiveData);
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				ois.close();
				client.close();
			} catch (IOException e2) {
				e2.printStackTrace();
			}
		}
	}
	
}
