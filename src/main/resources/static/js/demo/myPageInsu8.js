
function numberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
document.addEventListener("DOMContentLoaded", function () {
    $.ajax({
        url: 'getInsuMapping',
        type: 'POST',
        dataType: "json",
        data: {
            'customerID': customerID
        },
        success: function (data) {
            console.log("@@@@@@" + data);
            console.log(data.selectedInsurances);
            document.getElementById('insuFeeCell').textContent = numberWithCommas(data.insuFee) + "원(월)"
            document.getElementById('thisMonthFee').textContent = numberWithCommas(data.insuFee) + "원(월)"
            document.getElementById('specialInsuContent').textContent = data.selectedInsurances;
        },
        error: function (error) {
            console.error('데이터를 가져오는 중 오류 발생: ', error);
        },
    })
});