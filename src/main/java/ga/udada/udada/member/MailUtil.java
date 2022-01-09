package ga.udada.udada.member;

import org.apache.commons.mail.HtmlEmail;

public class MailUtil {
	public void sendMail(MemberDTO memberDTO) throws Exception{
		
		String charSet = "UTF-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "아이디";
		String hostSMTPpw = "비밀번호";
		
		String fromEmail = "아이디@gmail.com";
		String fromName = "UDADA";
		
		String subject = "";
		String msg="";
		
		subject ="[UDADA] 임시 비밀번호 발급 안내";
		msg += "<h3>임시 비밀번호 발급 안내</h3>";
		msg += "<hr>";
		msg += "안녕하세요, 회원님.";
		msg += "<br>임시 비밀번호입니다. 보안을 위해 로그인 후 비밀번호를 변경해주세요.";
		msg += "<br>";
		msg += "<br>";
		msg += "<p>임시 비밀번호 : ";
		msg += memberDTO.getMPw()+"</p>";
		
		String mailRecipient = memberDTO.getMEmail();
		try {
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true);
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(465);
			mail.setAuthentication(hostSMTPid, hostSMTPpw);
			mail.setStartTLSEnabled(true);
			mail.addTo(mailRecipient, charSet);
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
