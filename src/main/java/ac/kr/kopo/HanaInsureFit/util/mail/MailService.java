package ac.kr.kopo.HanaInsureFit.util.mail;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;


@Service
public class MailService {

    private final JavaMailSender emailSender;

    @Autowired
    public MailService(JavaMailSender emailSender) {
        this.emailSender = emailSender;
    }
    public void sendSimpleMessage(MailVO mailVO) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("mds468@ajou.ac.kr");
        message.setTo(mailVO.getAddress());
        message.setSubject(mailVO.getTitle());
        message.setText(mailVO.getContent());
        emailSender.send(message);
    }
}
