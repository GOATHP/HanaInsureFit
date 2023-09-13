package ac.kr.kopo.HanaInsureFit.insurance.service;

import ac.kr.kopo.HanaInsureFit.insurance.vo.Insurance;

import java.util.List;
import java.util.Map;

public interface InsuService {

    // 종목 검
    // 종목 검색 중
    List<Insurance> getAllInsu();
    Insurance getOneInsu(String insuranceProductNumber);
}