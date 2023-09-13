package ac.kr.kopo.HanaInsureFit.insurance.controller;

import ac.kr.kopo.HanaInsureFit.insurance.service.InsuService;
import ac.kr.kopo.HanaInsureFit.insurance.vo.Insurance;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class InsuController {

    @Autowired
    private InsuService insuService;

    @ResponseBody
    @GetMapping("/insu-searching")
    public ResponseEntity<List<Insurance>> getAllInsu() {
        List<Insurance> insuList = insuService.getAllInsu();
        System.out.println("보험 목록 출력");
        if (insuList != null && !insuList.isEmpty()) {
            System.out.println(ResponseEntity.ok(insuList));
            return ResponseEntity.ok(insuList);
        } else {

            return ResponseEntity.notFound().build();
        }

    }
}