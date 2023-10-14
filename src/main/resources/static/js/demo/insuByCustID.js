function numberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
var insuranceData = [];
document.addEventListener("DOMContentLoaded", function () {
    $.ajax({
        type: "POST",  // HTTP GET 요청
        url: "/insuByCustID",  // 서버 측 URL
        dataType: "json",  // 응답 데이터 타입은 JSON
        success: function (response) {
            // 서버로부터 받은 데이터를 처리합니다.
            console.log("성공")
            console.log(response)
            // 보험 정보를 화면에 출력하거나 다른 처리를 수행합니다.
            var insuList = response

            for (var i = 0; i < insuList.length; i++) {
                var insurance = insuList[i];
                var insuranceObj = {
                    insuContent: insurance.insuContent,
                    insuranceCompanyCode: insurance.insuranceCompanyCode,
                    insuranceCompanyName: insurance.insuranceCompanyName,
                    insuranceFee: insurance.insuranceFee,
                    insuranceProductName: insurance.insuranceProductName,
                    insuranceProductNumber: insurance.insuranceProductNumber,
                    maxAgeAtRegistration: insurance.maxAgeAtRegistration,
                    minAgeAtRegistration: insurance.minAgeAtRegistration,
                    insuranceStartDate: insurance.insuranceStartDate,
                    insuranceEndDate: insurance.insuranceEndDate
                };
                insuranceData.push(insuranceObj);
                console.log(insuranceData)
            }
            document.getElementById('insuranceFee').textContent = numberWithCommas((insurance.insuranceFee * 0.8).toFixed(0)) + "원(월)"
            // 데이터를 테이블에 추가


        },
        error: function (xhr, status, error) {
            console.error("서버 오류: " + error);
        }
    });
});