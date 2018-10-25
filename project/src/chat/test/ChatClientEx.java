package chat.test;

import java.net.*;
import java.io.*;

//***ChatClientEx 클래스 설계************************************************************
public class  ChatClientEx{
  String ipAddress;            //접속을 요청할 서버의 아이피 주소와 
  static final int    port=6000; //포트 번호 
  Socket client=null;           //클라이언트 소켓
  BufferedReader read;        //키보드로부터 메시지를 읽어올 입력 스트림 
  ObjectOutputStream oos;     //서버에 데이터를 전송하기 위한 스트림
  ObjectInputStream ois;       //서버로부터 데이터를 전송받기 위한 스트림
  String sendData;             //서버로 보낼 데이터를 저장하기 위한 변수  
  String receiveData;          //서버로부터 받은 데이터를 저장하기 위한 변수 

  //+++새롭게 추가된 멤버 변수 ++++++++++++++++++++ 
  String user_id;              //접속자의 아이디를 저장할 변수 선언   
  ReceiveDataThread rt;      //서버가 보낸 데이터를 받기 위한 스레드 객체  
  boolean endflag=false;

  public ChatClientEx(String id, String ip)  {//생성자는 사용자의 아이디와 접속할 서버의 아이피를 전달 받음 
    user_id=id;
    ipAddress=ip;
    try{
      System.out.println("**** 클라이언트*****");
      //접속할 서버의 아이피 주소와 포트를 이용해서 클라이언트 소켓 생성
      client = new Socket(ipAddress, port); 
      //클라이언트 소켓이 생성되는 순간 서버의 accept 메서드가 수행된다. 

      //키보드로부터 메시지를 읽어올 입력 스트림 생성 
      read= new BufferedReader(new InputStreamReader(System.in));
      //서버로부터 데이터를 수신받기 위해서 클라이언트로부터 입력 스트림을 얻어 bjectInputStream으로 변환
      ois = new ObjectInputStream(client.getInputStream());
      //서버로 메시지를 송신하기 위해서 출력 스트림을 얻어 ObjectOutputStream으로 변환
      oos = new ObjectOutputStream(client.getOutputStream());

      //++++서버에게 사용자 아이디를 전송+++++++++++++++++++++++++++++++++
      oos.writeObject(user_id);
      oos.flush();            
      //++++서버가 보낸 데이터를 수신받기 위한 스레드 객체 생성+++++++++++++++++++++
      rt= new ReceiveDataThread(client, ois);
      Thread t = new Thread(rt);
      t.start(); 

      while(true){
        sendData = read.readLine();     //서버에게 보낼 데이터를 키보드에서 입력 받기
      
        oos.writeObject(sendData);      //서버로 데이터를 송신함
        oos.flush();            

        if(sendData.equals("/quit")){   //접속을 끊으려면 "/quit" 메시지를 보냄
          endflag = true;
          break;
        }
      }//while
      System.out.print("클라이트의 접속을 종료합니다. ");
    }catch(Exception e){  
      if(!endflag)
        e.printStackTrace();  //에러 메시지를 출력하고
    }//catch
    finally{
      try{
        ois.close();
        oos.close();
        client.close();   
        System.exit(0);       //프로그램을 종료한다. 
      }catch(IOException e2){
        e2.printStackTrace();
      }
    }//finally
  }//ChatClientEx 생성자 끝

  public static void main(String[] args) {
    if(args.length < 2) {
      System.out.print("USAGE : java  ChatClient  사용자_id  서버_ip");
      System.exit(0);
    }
    new ChatClientEx(args[0], args[1]);
  }//main 메서드의 끝
}//ChatClientEx 클래스의 끝
