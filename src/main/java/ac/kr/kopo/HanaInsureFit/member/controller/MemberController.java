package ac.kr.kopo.HanaInsureFit.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import ac.kr.kopo.HanaInsureFit.member.vo.Member;
import ac.kr.kopo.HanaInsureFit.member.service.MemberService;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    @PostMapping("/loginMember")
    public ResponseEntity<String> loginMember(@RequestBody HashMap<String, String> loginData, HttpServletRequest request) {
        System.out.println("여기까진 온다.");

        System.out.println(loginData);
        Member loginMember = memberService.loginMember(loginData);

        HttpSession session = request.getSession();
        if (loginMember!=null) {
            session.setAttribute("name",loginMember.getName());
            session.setAttribute("email",loginMember.getEmail());
            return ResponseEntity.ok("로그인 성공");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("로그인 실패");
        }
    }
}
