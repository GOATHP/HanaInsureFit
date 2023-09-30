package ac.kr.kopo.HanaInsureFit.insurance.service;

import ac.kr.kopo.HanaInsureFit.insurance.dao.InsuMapper;
import ac.kr.kopo.HanaInsureFit.insurance.vo.Insurance;

import ac.kr.kopo.HanaInsureFit.insurance.vo.insuByCustID;
import ac.kr.kopo.HanaInsureFit.insurance.vo.insuNum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class InsuServiceImpl implements InsuService {
    private InsuMapper insuMapper;
    @Autowired
    public InsuServiceImpl(InsuMapper insuMapper) {
        this.insuMapper = insuMapper;
    }

    @Override
    public List<Insurance> getAllInsu(){
        return insuMapper.getAllInsu();
    }
    @Override
    public Insurance getOneInsu(int insuranceProductNumber){
        return insuMapper.getOneInsu(insuranceProductNumber);
    }
    @Override
    public void insertInsu(Map <String, String> paramMap) {
        insuMapper.insertInsu(paramMap);
    }

    @Override
    public List<insuNum> insuByCustID(String customerID) {
        System.out.println("요기~" + customerID);
        return insuMapper.insuByCustID(customerID);
    }
    @Override
    public insuByCustID insuByCustIDList(int insuranceProductNumber, String customerID) {

        return insuMapper.insuByCustIDList(insuranceProductNumber, customerID);
    }
}

