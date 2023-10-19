function numberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
document.addEventListener("DOMContentLoaded", function () {
    $.ajax({
        type: "POST",
        url: "/getPoint",
        dataType: "json",
        data: {
            'customerID': customerID
        },
        success: function (response) {
            console.log("포인트 통신 성공");
            console.log(response);

            if (response && response.length > 0) {
                var lastPoint = response[response.length - 1];
                console.log('@@@@@@@@@@@' + lastPoint.usablePoints);
                document.getElementById('pointValue').textContent = numberWithCommas(lastPoint.usablePoints.toFixed(0)) + "P";
                var pointInput = document.getElementById('pointInput');
                pointInput.placeholder = "잔여 포인트 :" + numberWithCommas(lastPoint.usablePoints.toFixed(0)) + "P";
            }
            // 데이터를 DataTable에 동적으로 추가
            var table = $('#pointTable').DataTable();
            table.clear().draw();
            response.forEach(function (item, index) {
                table.row.add([
                    index + 1,
                    numberWithCommas(item.points) + "P",
                    numberWithCommas(item.usablePoints) + "P",
                    item.transactionDate,
                    item.description
                ]).draw();
            });
            table.on('draw', function () {
                table.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
                    cell.innerHTML = i + 1;
                });
            });
        },
        error: function (xhr, status, error) {
            console.error("서버 오류: " + error);
        }
    });
});