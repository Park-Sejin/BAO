package chat.test;

import java.net.*;
import java.io.*;

//***ReceiveDataThread 클래스 설계(키보드로 메시지를 송신하면서 서버로부터 메시지를 수신 받기 위함)*****
class ReceiveDataThread implements Runnable{
  Socket client;          //서버와 통신하기 위한 소켓
  ObjectInputStream ois; //서버로부터 데이터를 수신받기 위한 스트림
  String receiveData;    //서버로부터 수신받은 데이터를 저장하기 위한 변수 

  //접속 요청한 소켓 객체와 입력 스트림이 전달됨
  public ReceiveDataThread(Socket s, ObjectInputStream ois){ 
  client = s;
  this.ois = ois;
  }//ReceiveDataThread 클래스의 생성자의 끝
  
  public void run(){
  try{
    //입력 스트림을 통해 데이터를 읽어 와서 출력
    while((receiveData = (String)ois.readObject()) != null)
      System.out.println(receiveData);
    }catch(ClassNotFoundException e){
      e.printStackTrace();  
    }catch(IOException e){  
      e.printStackTrace();  
    }
    finally{
      try{
        ois.close();
        client.close();  
      }catch(IOException e2){
        e2.printStackTrace();
      }
    }//finally
  }//run 메서드의 끝
}//ReceiveDataThread 클래스의 끝
