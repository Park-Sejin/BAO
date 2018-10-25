package chat.test;

import java.net.*;
import java.io.*;
import java.util.*;

//***ChatServerEx 클래스 설계************************************************************
public class  ChatServerEx{
  ServerSocket server;                //서버 소켓
  final static int port=6000;            //포트 번호 
  Socket child;                        //클라이언트와 통신하기 위한 소켓

  //++새롭게 추가된 변수+++++++++++++++++++++++++++++++++++
  //스레드 간의 정보를 공유할 HashMap : key는 아이디이고 value는 출력 스트림
  HashMap<String, ObjectOutputStream> hm;

  //서버 소켓 생성, 데이터 송수신 하기 위해서 스레드(ChatServerThread)객체 생성 
  public ChatServerEx( ) {
    try{
      server = new ServerSocket(port); //포트를 지정해서 서버 소켓 생성
    }catch(Exception e){                //서버 소켓 생성에 실패하면
      e.printStackTrace();               //에러 메시지를 출력하고
      System.exit(0);                    //프로그램을 종료한다. 
    }
    System.out.println("**** 채팅 서버*****");
    System.out.println("서버는 클라이언트 소켓의 접속 요청을 기다리고 있음");

    //+++스레드 간의 정보를 공유할 HashMap 객체 생성+++++++++
    hm = new HashMap<String, ObjectOutputStream>( );

    while(true){    //클라이언트의 접속을 항상 받아들일 수 있도록 무한루프를 돌림
      try{
         child = server.accept( );   //클라이언트의 접속 요청을 받아들여 

        //+++접속을 계속 유지하면서 데이터 송수신 하기 위해서 스레드 객체 생성++++
        //스레드 객체의 생성자로 소켓 객체와 해쉬 맵을 넘겨줌 
        ChatServerThread childThread=new ChatServerThread(child, hm);
        Thread t = new Thread(childThread);
        t.start();  //스레드 시작

    }catch(Exception e){ 
        e.printStackTrace();  //에러 메시지를 출력하고
        System.exit(0);       //프로그램을 종료한다. 
      }
    }//while 끝
  }//생성자 끝

  public static void main(String[] args)  {
    new ChatServerEx( );   
  }//main끝 
}//ChatServerEx

