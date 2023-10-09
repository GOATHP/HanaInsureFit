var customerID = document.getElementById("customerID").getAttribute("data-customerID");
var healthGrade;
var newFriendData;
function numberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$.ajax({
    url: 'getMyPageInfo',
    type: 'POST',
    dataType: "json",
    data: {
        'customerID': customerID
    },
    success: function (data) {
        console.log(data);
        healthGrade = data.healthGrade;
        console.log(healthGrade);
        newFriendData = { name: name, customerID: customerID, healthGrade: healthGrade };
        // friendGrades.push(newFriendData);

    },
    error: function (error) {
        console.error('데이터를 가져오는 중 오류 발생: ', error);
    },
})