var customerID = document.getElementById("customerID").getAttribute("data-customerID");
function numberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
$.ajax({
    url: 'getMyPageInsu',
    type: 'POST',
    dataType: "json",
    data: {
        'customerID': customerID
    },
    success: function (data) {
        console.log(data.insuContent)
        document.getElementById("insuNameCell").textContent = data.insuranceProductName;
        document.getElementById("insuFeeCell").textContent = numberWithCommas((data.insuranceFee * 0.8).toFixed(0)) + "원(월)";
        document.getElementById("startDate").textContent = data.insuranceStartDate;
        document.getElementById("endDate").textContent = data.insuranceEndDate;
        document.getElementById("insuContent").textContent = data.insuContent;

    },
    error: function (error) {
        console.error('데이터를 가져오는 중 오류 발생: ', error);
    },
})