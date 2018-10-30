package chat_test;

import java.net.*;
import java.io.*;
import java.util.*;

//***ChatServerThread 클래스 설계(접속을 계속 유지하면서 데이터 송수신 하기 위해서 사용)*****
class ChatServerThread implements Runnable {
	Socket child; // 클라이언트와 통신하기 위한 소켓
	ObjectInputStream ois; // 클라이언트로부터 데이터를 수신받기 위한 스트림
	ObjectOutputStream oos;// 클라이언트에게 데이터를 송신하기 위한 스트림

	// ++새롭게 추가된 변수++++++++++++++++++++++++
	String user_id;// 접속자의 아이디를 저장할 변수 선언
	HashMap<String, ObjectOutputStream> hm; // 스레드 간의 정보를 공유할 HashMap

	// ? 생성자 : 입출력 스트림을 얻음, 아이디와 출력 스트림을 해쉬 맵에 등록+++++++++++
	// ChatServerThread 생성자로 접속 요청한 소켓 객체와 해쉬 맵이 전달된다.
	public ChatServerThread(Socket s, HashMap hm) {
		child = s; // 클라이언트와 통신할 수 있는 소켓 정보를 child에 저장함
		this.hm = hm;
		try {
			// 클라이언트로부터 아이피 주소를 얻어 출력함
			System.out.println(child.getInetAddress() + "로부터 연결요청 받음");
			// 클라이언트로부터 데이터를 수신받기 위해 클라이언트로부터 입력 스트림을 얻어
			ois = new ObjectInputStream(child.getInputStream()); // ObjectInputStream으로 변환
			// 클라이언트로 데이터를 송신하기 위해서 출력 스트림 얻어 ObjectOutputStream으로 변환
			oos = new ObjectOutputStream(child.getOutputStream());

			// ++++아이디를 얻어와 아이디와 출력 스트림을 해쉬 맵에 등록+++++++++++
			// 새로운 클라이언트가 접속해서 처음 보낸 문자가 아이디이므로 이를 얻어 와서
			user_id = (String) ois.readObject();
			// 이미 서버에 접속되어 있는 모든 클라이언트에게 XXX가 접속되었다는 메시지 전송
			broadcast(user_id + "님이 접속하셨습니다.");
			System.out.println("접속한 클라이언트의 이름은 " + user_id + "입니다.");

			// 여러 클라이언트에게 공유되는 해쉬 맵을 동기화시킴
			synchronized (hm) {
				// 해쉬맵에 사용자의 아이디를 key로 출력 스트림을 value로 저장함
				// 모든 클라이언트에 의해 공유되어 메시지를 브로드 캐스팅을 위해 출력 스트림을 해쉬 맵에 저장
				hm.put(this.user_id, oos);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}// 생성자 끝

	// ? 클라이언트로부터 수신 받은 데이터를 클라이언트에게 송신한다.+++++++++++
	public void run() {
		String receiveData; // 클라이언트로부터 수신 받은 데이터를 저장하기 위한 변수
		try {
			while (true) {
				// +++클라이언트로부터 보내진 메시지를 수신한다.++++++++++++
				receiveData = (String) ois.readObject(); // 입력 스트림을 통해 클라이언트가 보낸
															// 메시지를 읽어옴
				// 클라이언트로부터 종료 메시지가 들어오면 반복 문을 벗어나서 finally 구문으로 간다.
				if (receiveData.equals("/quit")) break;
				else // 받은 메시지를 모든 클라이언트에게 브로드 캐스팅한다.
					broadcast(user_id + " : " + receiveData);
			} // while
		} catch (Exception e) {
			System.out.println("클라이언트가 강제 종료");
		} // catch
		finally { // 클라이언트로부터 "/quit" 라는 종료 메시지가 보내지면
			synchronized (hm) {
				hm.remove(user_id);// 종료 메시지 메시지를 보낸 클라이언트의 정보를 해쉬 맵에서 삭제한 후
			}
			broadcast(user_id + "님이 나가셨습니다."); // 나머지 클라이언트에게 접속 종료를 알림
			System.out.println(user_id + "님이 나가셨습니다."); // 서버에도 출력
			try {
				if (child != null)
					child.close(); // 나간 클라이언트 객체를 close 한다.
			} catch (Exception e) {
			}
		} // finally
	}// run 메서드 끝

	// ? 받은 메시지를 모든 클라이언트에게 브로드 캐스팅하기 위한 메서드++++++++++++
	public void broadcast(String message) {
		// 여러 클라이언트에게 공유되는 해쉬 맵을 동기화시킴
		synchronized (hm) {
			try {
				// 해쉬 맵에 등록된 모든 출력 스트림을 얻어와서
				for (ObjectOutputStream oos : hm.values()) {
					oos.writeObject(message); // 수신 받은 메시지를 다시 송신한다.
					oos.flush();
				}
			} catch (IOException e) {
			}
		}
	}// broadcast 메서드의 끝

}// ChatServerThread 클래스의 끝
