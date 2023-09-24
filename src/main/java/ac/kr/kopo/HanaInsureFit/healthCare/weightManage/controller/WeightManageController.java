package ac.kr.kopo.HanaInsureFit.healthCare.weightManage.controller;

import ac.kr.kopo.HanaInsureFit.healthCare.restaurant.vo.Restaurant;
import ac.kr.kopo.HanaInsureFit.healthCare.weightManage.service.WeightManageService;
import ac.kr.kopo.HanaInsureFit.healthCare.weightManage.vo.WeightManage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import com.fasterxml.jackson.databind.ObjectMapper;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class WeightManageController {

    @Autowired
    private WeightManageService WeightManageService;

    @PostMapping("/weig2htManage")
    public ResponseEntity<Object> weightManage(@RequestBody HashMap<String, String> data, HttpServletRequest request) {
        String customerID = data.get("customerID");
        System.out.println("Controller 여까지옴"  + customerID);
        WeightManage weightManage = WeightManageService.getInfo(customerID);
        System.out.println("=> 객체 이름" + weightManage.getName());
        // json으로 변환
        // HttpSession session = request.getSession();
        return ResponseEntity.ok(weightManage);
    }
}
