
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

src="https://code.jquery.com/jquery-3.4.1.min.js"
src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-annotation/1.0.2/chartjs-plugin-annotation.min.js"
src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"
src="https://cdn.jsdelivr.net/npm/chart.js"

var labels = [];
var dataValues = [];
function fetchDataAndUpdateChart() {

  $.ajax({
    url: 'getLineChart',
    method: 'POST',
    dataType: 'json',
    success: function (response) {
      console.log("Data Check : " + response);
      for (var i = 0; i < response.length; i++)  {
        console.log(response[i])
        console.log(response[i].joindate);
        labels.push(response[i].joindate);
        dataValues.push(response[i].customer_COUNT+i);
      }
      drawLineChart();

      document.querySelector('.h5.mb-0.font-weight-bold.text-gray-800').textContent = response.length - 1+"명";
    },
    //   // 차트 데이터 업데이트
    //   myBarChart.data.labels = labels;
    //   myBarChart.data.datasets[0].data = dataValues;
    //
    //   // 차트 업데이트
    //   myBarChart.update();
    // },
    error: function (error) {
      console.error('데이터를 가져오는 중 오류 발생: ', error);
    },
  });
}
window.addEventListener('load', fetchDataAndUpdateChart);
// drawLineChart();
// fetchDataAndUpdateChart();
// Area Chart Example
function drawLineChart(){

  const annotation = {
    type: 'line',
    mode: 'horizontal',
    scaleID: 'y',
    // value: dailyRecommendedCalories, // 원하는 값을 설정하세요 (예: 1800)
    borderColor: '#ff0000',
    borderWidth: 2,
    // label: {
    //   enabled: true,
    //   content: '1800'
    // }
  }
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: labels,
    datasets: [{
      // label: "Kcal : ",
      lineTension: 0.3,
      // backgroundColor: "#005753",
      borderColor: "#00857E",
      pointRadius: 3,
      pointBackgroundColor: "#005753",
      pointBorderColor: "#00857E",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "#005753",
      pointHoverBorderColor: "#00857E",
      pointHitRadius: 10,
      pointBorderWidth: 2,
      data: dataValues,
      // data: [0, 10000, 5000, 15000, 10000]
      // , 20000, 15000, 25000, 20000, 30000, 25000, 40000],
    }],
  },
  options: {
    maintainAspectRatio: false,
    layout: {
      padding: {
        left: 10,
        right: 25,
        top: 25,
        bottom: 0
      }
    },
    scales: {
      // xAxes: [{
      //   time: {
      //     unit: 'date'
      //   },
      //   gridLines: {
      //     display: false,
      //     drawBorder: false
      //   },
      //   ticks: {
      //     maxTicksLimit: 7
      //   }
      // }],
      // yAxes: [{
      //   ticks: {
      //     maxTicksLimit: 5,
      //     padding: 10,
      //     // Include a dollar sign in the ticks
      //     callback: function(value, index, values) {
      //       return number_format(value);
      //     }
      //   },
      //   gridLines: {
      //     color: "rgb(234, 236, 244)",
      //     zeroLineColor: "rgb(234, 236, 244)",
      //     drawBorder: false,
      //     borderDash: [2],
      //     zeroLineBorderDash: [2]
      //   }
      // }],
      x: {
        beginAtZero: true,
        max: 3000,
        stepSize: 500,
      },
      y: {
        type: 'linear', // y축의 유형을 linear로 설정
        min: 0, // y축 최소값
        max: 2000, // y축 최대값
        stepSize: 500,
      },
    },
    plugins: {
      annotation: {
        annotations: [annotation]
      },
    },

  legend: {
    display: false
  },
  tooltips: {
    backgroundColor: "rgb(255,255,255)",
    bodyFontColor: "#858796",
    titleMarginBottom: 10,
    titleFontColor: '#6e707e',
    titleFontSize: 14,
    borderColor: '#dddfeb',
    borderWidth: 1,
    xPadding: 15,
    yPadding: 15,
    displayColors: false,
    intersect: false,
    mode: 'index',
    caretPadding: 10,
  }
  },
});
}
