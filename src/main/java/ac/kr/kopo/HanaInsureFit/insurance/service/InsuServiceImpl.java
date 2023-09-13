package ac.kr.kopo.HanaInsureFit.insurance.service;

import ac.kr.kopo.HanaInsureFit.healthCare.food.dao.FoodMapper;
import ac.kr.kopo.HanaInsureFit.insurance.dao.InsuMapper;
import ac.kr.kopo.HanaInsureFit.insurance.vo.Insurance;
import ac.kr.kopo.HanaInsureFit.member.dao.MemberMapper;
import ac.kr.kopo.HanaInsureFit.member.service.MemberService;
import ac.kr.kopo.HanaInsureFit.member.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


@Service
public class InsuServiceImpl implements InsuService {
    private InsuMapper insuMapper;


    @Autowired
    public InsuServiceImpl(FoodMapper foodMapper) {

        this.insuMapper = insuMapper;
    }

    @Override
    public List<Insurance> getAllInsu(){
        return insuMapper.getAllInsu();
    }
    @Override
    public Insurance getOneInsu(String insuranceProductNumber){
        return insuMapper.getOneInsu(insuranceProductNumber);
    }

}