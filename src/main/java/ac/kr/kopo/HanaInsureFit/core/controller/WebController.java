package ac.kr.kopo.HanaInsureFit.core.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class WebController {

    @GetMapping("/")
    public String index() {

        return "index";
    }

    @GetMapping("/introduce")
    public String getIntroduce() throws Exception {

        return "introduce";
    }

    @GetMapping("/loginMember")
    public String login() throws Exception {

        return "jsp/members/loginForm";
    }

    @GetMapping("/joinMember")
    public String join() throws Exception {

        return "jsp/members/joinForm";
    }

    @GetMapping("/foodInfo")
    public String foodInfo() throws Exception {

        return "jsp/healthCare/foodInfo";
    }

    @GetMapping("/recommendFood")
    public String recommendFood() throws Exception {

        return "jsp/healthCare/recommendFood";
    }

    @GetMapping("/weightManage")
    public String weightManage() throws Exception {

        return "jsp/healthCare/weightManage";
    }

    @GetMapping("/recommendInsu")
    public String recommendInsu() throws Exception {

        return "jsp/insurance/recommendInsu";
    }
    @GetMapping("/insuGradeSubmit")
    public String insuGradeSubmit() throws Exception {

        return "jsp/insurance/insuGradeSubmit";
    }
    @GetMapping("/insuList")
    public String insuList() throws Exception {

        return "jsp/insurance/insuList";
    }
    @GetMapping("/insuJoin")
    public String insuJoin() throws Exception {

        return "jsp/insurance/insuJoin";
    }
    @GetMapping("/insuAgreement")
    public String insuAgreement() throws Exception {

        return "jsp/insurance/insuAgreement";
    }

    @GetMapping("/insuRead")
    public String insuRead() throws Exception {

        return "jsp/insurance/insuRead";
    }
    @GetMapping ("/insuJoinInput")
    public String insuJoinInput() throws Exception {

        return "jsp/insurance/insuJoinInput";
    }

    @GetMapping ("/calendar")
    public String calendar() throws Exception {
        return "jsp/calendar";
    }

    @GetMapping ("/dashboardAdmin")
    public String dashboardAdmin() throws Exception {
        return "jsp/dashboardAdmin";
    }

    @GetMapping ("/manageMember")
    public String manageMember() throws Exception {
        return "jsp/manageMember";
    }

    @GetMapping ("/dashboardMypage")
    public String dashboardMypage() throws Exception {
        return "jsp/dashboardMypage";
    }
    @GetMapping ("/manageInsu")
    public String manageInsu() throws Exception {
        return "jsp/manageInsu";
    }

    @GetMapping ("/weightAuth")
    public String weightAuth() throws Exception {
        return "jsp/healthCare/weightAuth";
    }

    @GetMapping ("/openedAccount")
    public String checkPhone() throws Exception {
        return "jsp/openedAccount";
    }

    @GetMapping ("/compareCost")
    public String compareCost() throws Exception {
        return "jsp/compareCost";
    }

    @GetMapping ("/InsureFitWith")
    public String InsureFitWith() throws Exception {
        return "jsp/InsureFitWith";
    }

    @GetMapping ("/acceptInvite")
    public String acceptInvite() throws Exception {
        return "jsp/acceptInvite";
    }
}