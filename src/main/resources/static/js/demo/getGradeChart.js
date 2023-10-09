function numberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
var pieDataValues=[];

document.addEventListener("DOMContentLoaded", function () {
    $.ajax({
        url: 'getGradeChart',
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log(data);
            for (var i = 0; i < data.length; i++) {
                pieDataValues.push(data[i].grade_COUNT);
            }
            drawPieChart(pieDataValues);
        },
        error: function (error) {
            console.error('데이터를 가져오는 중 오류 발생: ', error);
        },
    })
});

function drawPieChart(data) {
    console.log("drawPieChart 함수가 호출되었습니다.");
    var ctx = document.getElementById("myPieChart");
    var myPieChart2 = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ["Grade 1", "Grade 2", "Grade 3 ", "Grade 4"],
            datasets: [{
                data: data,
                backgroundColor: ['#39F3BB', '#09BB9F', '#1D81A2', '#18A1CD'],
                hoverBackgroundColor: ['#0AAA78', '#06806C', '#13566B', '#106A86'],
                hoverBorderColor: "rgba(234, 236, 244, 1)",
            }],
        },
        options: {
            layout:{
                padding: {
                }
            },
            maintainAspectRatio: false,
            tooltips: {
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#858796",
                borderColor: '#dddfeb',
                borderWidth: 2,
                xPadding: 15,
                yPadding: 15,
                displayColors: false,
                caretPadding: 10,
            },
            legend: {
                position: 'bottom',
                display: true,
                labels: {
                    padding: {
                        top:30,
                    },
                    fontSize: 14, // 범례 글꼴 크기
                    usePointStyle: true,
                    boxWidth: 10
                },
            },
            cutoutPercentage: 50,
            elements: {
                arc: {
                    borderWidth: 0.5, // 파이 차트 두께 조절
                },
            },
        },
    });
}