function numberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function getInsuData(customerID) {
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
            console.log("@@@@@@@@@@@@" + data.insuFee);
            updateInsuFee(data.insuFee);
            var specialContentElement = document.querySelector(".specialContent");
            specialContentElement.textContent = data.selectedInsurances;
        },
        error: function (error) {
            console.error('데이터를 가져오는 중 오류 발생: ', error);
        },
    });
}

function updateInsuFee(insuFee) {
    var insuFeeElement = document.querySelector(".insuFee");
    insuFeeElement.textContent = numberWithCommas(insuFee) + "원(월)";
}
