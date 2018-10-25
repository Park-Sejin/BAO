package chat.test;


 import java.net.*;
 import java.io.*;
 import java.awt.*;
 import java.awt.event.*;
 import java.util.*;
 
 class GUIChatClient extends Frame implements ActionListener{
   String ipAddress;        //접속을 요청할 서버의 아이피 주소와
   final static int server_port=6000;  //포트 번호 
   Socket client=null;       //클라이언트 소켓
   ObjectOutputStream oos; //서버에 데이터를 전송하기 위한 스트림
   ObjectInputStream ois;   //서버로부터 데이터를 전송받기 위한 스트림
   String usr_id;            //접속자의 아이디를 저장할 변수 선언
   ReceiveDataThread rt;   //서버가 보낸 데이터를 받기 위한 스레드 객체 

   //+화면 구성을 위해서 추가된 멤버변수++++++++++++++++
   Button btn_exit ;          // 종료 버튼
   Button btn_send ;          // 문자열 전송
   Button btn_connect ;       // 서버 접속
   TextArea  txt_list ;        // 접속 목록 출력
   TextField txt_server_ip ;  // 접속 서버 아이피
   TextField txt_name ;       // 접속 이름 
   TextField txt_input ;      // 전송 메시지
   CardLayout cl ;            // 카드 레이아웃 설정
   //++++++++++++++++++++++

   public GUIChatClient( ){  // 생성자
     super("클라이언트");             // 타이틀바 제목
     cl = new CardLayout();    // 카드 레이아웃 초기화
     setLayout(cl);            // 레이아웃 변경
     // 접속 화면 
     Panel connect = new Panel(); 
     connect.setLayout(new BorderLayout());

     connect.add("North", new Label("다중 채팅 접속 화면",Label.CENTER));
     
     Panel connect_sub = new Panel();  // 접속창 하위 패널
  
     connect_sub.add( new Label("서버 아이피 :  "));
     txt_server_ip = new TextField("127.0.0.1", 15 );
     connect_sub.add( txt_server_ip );

     connect_sub.add( new Label("대화명      :   "));
     txt_name = new TextField("딸기공주", 15);
     connect_sub.add( txt_name );

     connect.add("Center", connect_sub);

     btn_connect = new Button("서버 접속"); // 버튼 생성
     connect.add("South", btn_connect);

     btn_connect.addActionListener(this);   // 이벤트 등록

     // 채팅 화면
     Panel chat = new Panel(); 
     chat.setLayout(new BorderLayout());
  
     chat.add("North" , new Label("채팅 프로그램 ver 1.0", Label.CENTER));
 
     txt_list = new TextArea();   // 채팅한 내용 출력창 화면 구성
     chat.add("Center", txt_list);

     Panel chat_sub = new Panel(); // 채팅창 하위 패널 
     txt_input = new TextField("", 25);
     btn_exit = new Button("종료");
     btn_send = new Button("전송");

     chat_sub.add( txt_input );
     chat_sub.add( btn_send );
     chat_sub.add( btn_exit );

     btn_exit.addActionListener(this);  // 이벤트 등록
     btn_send.addActionListener(this);  // 이벤트 등록
     txt_input.addActionListener(this); // 이벤트 등록

     chat.add("South", chat_sub);

     // 접속 화면, 채팅 화면을 카드 레이아웃에 등록 +++++    
     add( connect , "접속창"); // 카드 레이아웃에 등록
     add( chat , "채팅창");    // 카드 레이아웃에 등록
     
     cl.show(this, "접속창");  // 초기화면은 접속창
     
     setSize(300, 300);
     setVisible(true);   

     addWindowListener(new WindowAdapter( ){
       public void windowClosing(WindowEvent e) {
         dispose();
         System.exit(0); 
       }//windowClosing 메서드 끝 
     } //클래스 정의 끝
    );//addWindowListener 메서드 끝                     
   }//GUIChatClient 생성자 끝

 
  //접속할 서버의 아이피와 포트 번호로 소켓 생성하고 사용자 아이디를 서버로 보냄 
  void init() throws IOException{
    ipAddress = txt_server_ip.getText();   //서버에게 보낼 사용자 아이디를 얻어내어 
    //접속할 서버의 아이피 주소와 포트를 이용해서 클라이언트 소켓 생성
    client = new Socket(ipAddress, server_port); 
    //서버로 메시지를 보내기 위해서 출력 스트림 얻어 ObjectOutputStream으로 변환 
    oos = new ObjectOutputStream(client.getOutputStream());
    //서버가 수신한 데이터를 읽기 위해서 입력 스트림을 얻어 ObjectInputStream으로 변환
    ois = new ObjectInputStream( client.getInputStream());

    //+++++++++++++++++++++++++++++++++
    usr_id = txt_name.getText(); //글상자에서 대화명(사용자 id)를 얻어와서
    oos.writeObject(usr_id);     // 서버에게 송신
    oos.flush(); 

    rt= new ReceiveDataThread( );// 서버가 보낸 데이터를 받기(수신) 위한 
    Thread t = new Thread(rt);   // 스레드 객체 생성
    t.start();                   // 스레드를 시작하고 

    cl.show(this,"채팅창"); // 채팅창으로 화면 전환
    txt_input.requestFocus(); // 채팅창 글 입력 상자에 포커스
  }//init의 끝
 

  // 버튼에 대한 이벤트 처리 
  public void actionPerformed(ActionEvent e){
   try{
    Object obj = e.getSource();

    if( obj == btn_connect ){      // 서버 접속 버튼이 눌렸을 때 
      init( );  //채팅할 준비를 해주는 함수 호출
    }//if
    else if( obj == btn_exit ){        // 종료 버튼이 눌렸을 때 
        System.exit(0); // 프로그램 강제 종료
    }//else if
    // 글 입력 상자에서 엔터키를 쳤거나 전송버튼이 눌렸을 때
    else if( obj == btn_send || obj == txt_input){
      String sendData;        //서버로 보낼 데이터를 저장하기 위한 변수  
      sendData = txt_input.getText(); //글 입력 상자에서 데이터를 얻어
      oos.writeObject( sendData );           //서버에게 송신함
      oos.flush();
      
      txt_input.setText("");            //글상자를 지우고
      txt_input.requestFocus();         // 포커스를 준다.
    } //else if
   }catch(Exception ex){ // 예외 처리
      txt_list.appendText(ex.getMessage() +"\n");  
   }  
 }//actionPerformed 메서드 끝
   

//서버가 보낸 데이터를 받기(수신) 위한 클래스 설계를 내부 클래스로 설계
 class ReceiveDataThread implements Runnable{
   String receiveData;      //서버로부터 받은 데이터를 저장하기 위한 변수 
   public void run(){  // Runnable 인터페이스 run() 메서드 오버라이딩
    try{
      while(true){
        receiveData = (String)ois.readObject(); // 서버 데이터 수신
        txt_list.appendText(receiveData + "\n");
     }
    }
    catch(ClassNotFoundException e){
    System.out.print(e);   
   }
   catch(IOException e){ // 예외 처리
      System.out.print( e);     
    }
   }//run 메서드의 끝
  }//ReceiveDataThread 클래스의 끝

 public static void main(String [] args){ // main() 메서드
   new GUIChatClient( );    
 }// main() 메서드 끝

}//GUIChatClient 클래스 설계 끝      
