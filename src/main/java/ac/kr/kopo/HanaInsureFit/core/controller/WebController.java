package ac.kr.kopo.HanaInsureFit.core.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class WebController {

    @GetMapping("/")
    public String index() {
        System.out.println("test");
        return "index";
    }

    @GetMapping("/introduce")
    public String getIntroduce() throws Exception {
        System.out.println("여기까진 옴");
        return "introduce";
    }

    @GetMapping("/loginMember")
    public String login() throws Exception {
        System.out.println("여기까진 옴");
        return "jsp/members/loginForm";
    }

    @GetMapping("/joinMember")
    public String join() throws Exception {
        System.out.println("여기까진 옴jhuhu");
        return "jsp/members/joinForm";
    }

    @GetMapping("/foodInfo")
    public String foodInfo() throws Exception {
        System.out.println("여기까진 옴-----음식추천");
        return "jsp/healthCare/foodInfo";
    }

    @GetMapping("/recommendFood")
    public String recommendFood() throws Exception {
        System.out.println("여기까진 옴-----식당추천");
        return "jsp/healthCare/recommendFood";
    }

    @GetMapping("/weightManage")
    public String weightManage() throws Exception {
        System.out.println("여기까진 옴-----체중관리");
        return "jsp/healthCare/weightManage";
    }

    @GetMapping("/recommendInsu")
    public String recommendInsu() throws Exception {
        System.out.println("여기까진 옴-----보험추천");
        return "jsp/insurance/recommendInsu";
    }
    @GetMapping("/insuGradeSubmit")
    public String insuGradeSubmit() throws Exception {
        System.out.println("여기까진 옴-----보험추천");
        return "jsp/insurance/insuGradeSubmit";
    }
    @GetMapping("/insuList")
    public String insuList() throws Exception {
        System.out.println("여기까진 옴-----보험추천");
        return "jsp/insurance/insuList";
    }
    @GetMapping("/insuJoin")
    public String insuJoin() throws Exception {
        System.out.println("여기까진 옴-----보험추천");
        return "jsp/insurance/insuJoin";
    }
    @GetMapping("/insuAgreement")
    public String insuAgreement() throws Exception {
        System.out.println("여기까진 옴-----보험추천");
        return "jsp/insurance/insuAgreement";
    }

    @GetMapping("/insuRead")
    public String insuRead() throws Exception {
        System.out.println("여기까진 옴-----보험추천");
        return "jsp/insurance/insuRead";
    }
    @GetMapping ("/insuJoinInput")
    public String insuJoinInput() throws Exception {
        System.out.println("여기까진 옴-----보험추천");
        return "jsp/insurance/insuJoinInput";
    }
}