package member.action;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator{
	
	PasswordAuthentication passAuth;
    
    public GoogleAuthentication(){
    	//구글아이디, 구글비밀번호
        passAuth = new PasswordAuthentication("mewlsle", "zrantlbyoonilskk");
    }
    
    //Authenticator 구현 시 반드시 구현해 주어야하는 메소드
    public PasswordAuthentication getPasswordAuthentication() {
        return passAuth;
    }

}
