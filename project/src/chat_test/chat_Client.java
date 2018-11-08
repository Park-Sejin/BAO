package chat_test;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;

import chat_test.ReceiveDataThread_past;
import member.db.MemberBean;
import member.db.MemberDAO;

public class chat_Client {
	// Client
	Socket client = null; // 클라이언트 소켓
	ObjectOutputStream oos; // 서버에 데이터를 전송하기 위한 스트림
	ObjectInputStream ois; // 서버로부터 데이터를 전송받기 위한 스트림
	String usr_id; // 접속자의 아이디를 저장할 변수 선언
	ReceiveDataThread_past rt; // 서버가 보낸 데이터를 받기 위한 스레드 객체
	String ipAddress;
	final static int server_port = 6000;

	static ObjectOutputStream save_oos; // 서버에 데이터를 전송하기 위한 스트림
	static ObjectInputStream save_ois; // 서버로부터 데이터를 전송받기 위한 스트림

	public void ChatClient(String se_email, String receive_email) {
		// 접속할 서버의 아이피와 포트 번호로 소켓 생성하고 사용자 아이디를 서버로 보냄
		// 접속할 서버의 아이피 주소와 포트를 이용해서 클라이언트 소켓 생성
		try {
			ipAddress = "127.0.0.1";
			
			client = new Socket(ipAddress, server_port);
			System.out.println("1111111");
			
			//서버로 메시지를 송신하기 위해서 출력 스트림을 얻어 ObjectOutputStream으로 변환
			oos = new ObjectOutputStream(client.getOutputStream());
			System.out.println("222222");
			
			//서버로부터 데이터를 수신받기 위해서 클라이언트로부터 입력 스트림을 얻어 bjectInputStream으로 변환
			ois = new ObjectInputStream(client.getInputStream());
			System.out.println("33333333");

			// +++++++++++++++++++++++++++++++++
			MemberDAO mdao = new MemberDAO();
			MemberBean sen_mb = mdao.getMember(se_email);
			
			usr_id = sen_mb.getName(); // 글상자에서 대화명(사용자 id)를 얻어와서
			oos.writeObject(usr_id); // 서버에게 송신
			oos.flush();
			rt = new ReceiveDataThread_past(client, ois, receive_email);
			Thread t = new Thread(rt); // 스레드 객체 생성
			t.start(); // 스레드를 시작하고

			save_oos = oos;
			save_ois = ois;
		} catch (IOException e) {
			System.out.println("IOException 오류");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("Exception 오류");
			e.printStackTrace();
		}
	}

	public synchronized void ChatSubmit(String txt_input) {

		String sendData; // 서버로 보낼 데이터를 저장하기 위한 변수
		sendData = txt_input; // 글 입력 상자에서 데이터를 얻어
		try {
			save_oos.writeObject(sendData);
			save_oos.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} // 서버에게 송신함
	}

	public void ChatExit() {
		System.exit(0); // 프로그램 강제 종료
	}

}
