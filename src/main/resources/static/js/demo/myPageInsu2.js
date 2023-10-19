var customerID = document.getElementById("customerID").getAttribute("data-customerID");
function numberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
document.addEventListener("DOMContentLoaded", function () {
    $.ajax({
        url: 'getMyPageInsu',
        type: 'POST',
        dataType: "json",
        data: {
            'customerID': customerID
        },
        success: function (data) {
            console.log(data.insuContent)
            // document.getElementById("insuNameCell").textContent = data.insuranceProductName;
            // grade 변수가 문자열 형태로 설정되어야 하므로 getElementById로 가져온 내용에서 .textContent 또는 .innerText를 사용합니다.
            var grade = document.getElementById("grade").textContent;

// data.insuranceFee를 숫자로 변환합니다.
            insuranceFeee = parseInt(data.insuranceFee, 10);
            var insuranceFee = parseInt(data.insuranceFee, 10); // 10진수로 변환
            console.log('@@@@@@@' + grade);
// grade에 따라 월 보험료를 계산하여 insuFeeCell 내용을 업데이트합니다.
            if (grade === '1') {
                var intPart = numberWithCommas(Math.floor(insuranceFee * 0.6));
                document.getElementById("insuFeeCell").textContent = intPart + "원(월)";
            } else if (grade === '2') {
                var intPart = numberWithCommas(Math.floor(insuranceFee * 0.8));
                document.getElementById("insuFeeCell").textContent = intPart + "원(월)";
            } else if (grade === '3' || grade === '4') {
                var intPart = numberWithCommas(Math.floor(insuranceFee));
                document.getElementById("insuFeeCell").textContent = intPart + "원(월)";
            } else {
                // 예외 처리: grade가 1, 2, 3, 4 중 하나가 아닌 경우
                document.getElementById("insuFeeCell").textContent = "유효하지 않은 등급";
            }


            if (grade === '1') {
                var intPart = Math.floor(insuranceFee * 0.6);

                document.getElementById("halfYearDiscount").textContent = numberWithCommas(intPart*6) + "원";
                document.getElementById("aYearDiscount").textContent = numberWithCommas(intPart*12) + "원";
                document.getElementById("fiveYearDiscount").textContent = numberWithCommas(intPart*60) + "원";
                document.getElementById("decadeDiscount").textContent = numberWithCommas(intPart*120) + "원";

                document.getElementById("halfYearGap").textContent = numberWithCommas(insuranceFee*6 - intPart*6) + "원";
                document.getElementById("aYearGap").textContent = numberWithCommas(insuranceFee*12-intPart*12) + "원";
                document.getElementById("fiveYearGap").textContent = numberWithCommas(insuranceFee*60-intPart*60) + "원";
                document.getElementById("decadeGap").textContent = numberWithCommas(insuranceFee*120 - intPart*120) + "원";
            } else if (grade === '2') {
                var intPart = Math.floor(insuranceFee * 0.8);
                document.getElementById("halfYearDiscount").textContent = numberWithCommas(intPart*6) + "원";
                document.getElementById("aYearDiscount").textContent = numberWithCommas(intPart*12) + "원";
                document.getElementById("fiveYearDiscount").textContent = numberWithCommas(intPart*60) + "원";
                document.getElementById("decadeDiscount").textContent = numberWithCommas(intPart*120) + "원";

                document.getElementById("halfYearGap").textContent = numberWithCommas(insuranceFee*6 - intPart*6) + "원";
                document.getElementById("aYearGap").textContent = numberWithCommas(insuranceFee*12-intPart*12) + "원";
                document.getElementById("fiveYearGap").textContent = numberWithCommas(insuranceFee*60-intPart*60) + "원";
                document.getElementById("decadeGap").textContent = numberWithCommas(insuranceFee*120 - intPart*120) + "원";
            } else if (grade === '3' || grade === '4') {
                var intPart = Math.floor(insuranceFee);
                document.getElementById("halfYearDiscount").textContent = numberWithCommas(intPart*6) + "원";
                document.getElementById("aYearDiscount").textContent = numberWithCommas(intPart*12) + "원";
                document.getElementById("fiveYearDiscount").textContent = numberWithCommas(intPart*60) + "원";
                document.getElementById("decadeDiscount").textContent = numberWithCommas(intPart*120) + "원";

                document.getElementById("halfYearGap").textContent = numberWithCommas(insuranceFee*6 - intPart*6) + "원";
                document.getElementById("aYearGap").textContent = numberWithCommas(insuranceFee*12-intPart*12) + "원";
                document.getElementById("fiveYearGap").textContent = numberWithCommas(insuranceFee*60-intPart*60) + "원";
                document.getElementById("decadeGap").textContent = numberWithCommas(insuranceFee*120 - intPart*120) + "원";

            } else {
                // 예외 처리: grade가 1, 2, 3, 4 중 하나가 아닌 경우
                document.getElementById("insuFeeCell").textContent = "유효하지 않은 등급";
            }

            document.getElementById("halfYear").textContent = numberWithCommas(insuranceFee*6) + "원";
            document.getElementById("aYear").textContent = numberWithCommas(insuranceFee*12) + "원";
            document.getElementById("fiveYear").textContent = numberWithCommas(insuranceFee*60) + "원";
            document.getElementById("decade").textContent = numberWithCommas(insuranceFee*120) + "원";

        },
        error: function (error) {
            console.error('데이터를 가져오는 중 오류 발생: ', error);
        },
    })
});