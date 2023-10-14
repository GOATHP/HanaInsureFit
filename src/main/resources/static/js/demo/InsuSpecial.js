
function numberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
$.ajax({
    url: 'getInsuSpecial',
    type: 'POST',
    dataType: "json",
    success: function (data) {
        console.log(data)
        insuranceData2 = data;
        var selectBox = document.getElementById('insuranceSelect'); // 적절한 ID로 변경
        data =
// 데이터를 셀렉트 박스에 추가
        data.forEach(function(item, index) {
            var option = document.createElement('option');
            option.value = index; // 선택된 옵션의 값 (인덱스로 설정)
            option.text = item.coverageitemname; // 옵션 텍스트
            selectBox.appendChild(option);
        });
    },
    error: function (error) {
        console.error('데이터를 가져오는 중 오류 발생: ', error);
    },
})

