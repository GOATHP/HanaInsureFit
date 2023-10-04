package ac.kr.kopo.HanaInsureFit.util.mail;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MailController {
    private final MailService mailService;
    public MailController(MailService mailService) {
        this.mailService = mailService;
    }
    @GetMapping("/mail/send")
    public String main() {
        return "SendMail.html";
    }
    @PostMapping("/mail/send")
    public String sendMail(MailVO MailVO) {
        mailService.sendSimpleMessage(MailVO);
        System.out.println("메일 전송 완료");
        return "AfterMail.html";
    }
}