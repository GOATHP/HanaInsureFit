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
            console.log(data);
            document.getElementById('insuranceFeeLast').textContent = numberWithCommas(data.insuFee) + "원(월)"
        },
        error: function (error) {
            console.error('데이터를 가져오는 중 오류 발생: ', error);
        },
    })
});