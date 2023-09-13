package ac.kr.kopo.HanaInsureFit.insurance.dao;


import ac.kr.kopo.HanaInsureFit.insurance.vo.Insurance;
import ac.kr.kopo.HanaInsureFit.member.vo.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface InsuMapper {
    List<Insurance> getAllInsu();
    Insurance getOneInsu(String insuranceProductNumber);

}