package ac.kr.kopo.HanaInsureFit.insurance.service;

import ac.kr.kopo.HanaInsureFit.insurance.dao.InsuMapper;
import ac.kr.kopo.HanaInsureFit.insurance.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
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

    @Override
    public List<specialAgree> getInsuSpecial() {
        return insuMapper.getInsuSpecial();
    }

    @Override
    public void insertInsuMapping(HashMap<String, Object> paramMap) {
        insuMapper.insertInsuMapping(paramMap);
    }
    @Override
    public InsuMapping getSpecialInsuMapping(String customerID){
        return insuMapper.getSpecialInsuMapping(customerID);
    }
    @Override
    public List<PointTable> getPoint(String customerID){
        return insuMapper.getPoint(customerID);
    };
    @Override
    public void insertPointFood(HashMap<String, Object> paramMap){
        insuMapper.insertPointFood(paramMap);
    };
    @Override
    public void insertPointInbody(HashMap<String, Object> paramMap){
        insuMapper.insertPointInbody(paramMap);
    };
    @Override
    public void updatePoint(int pointValue){
        insuMapper.updatePoint(pointValue);
    };
}

