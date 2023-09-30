// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

var customerID = document.getElementById("customerID").getAttribute("data-customerID");
src="https://code.jquery.com/jquery-3.4.1.min.js"

function number_format(number, decimals, dec_point, thousands_sep) {
  // *     example: number_format(1234.56, 2, ',', ' ');
  // *     return: '1 234,56'
  number = (number + '').replace(',', '').replace(' ', '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function(n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}
var labels = [];
var dataValues = [];
function fetchDataAndUpdateChart() {

  $.ajax({
    url: 'getChartData',
    method: 'POST',
    dataType: 'json',
    data: {
      'customerID': customerID
    },
    success: function (response) {
      console.log("Data Check : " + response);
      for (var i = response.length - 1; i >= 0; i--) {
        labels.push(response[i].recorddate);
        dataValues.push(response[i].total_calories);

      }
      drawLineChart();
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
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels : labels,
    // labels: ["Jan", "Feb", "Mar", "Apr", "May"],
      // , "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
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
      data : dataValues,
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
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false,
          drawBorder: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          maxTicksLimit: 5,
          padding: 10,
          // Include a dollar sign in the ticks
          callback: function(value, index, values) {
            return number_format(value);
          }
        },
        gridLines: {
          color: "rgb(234, 236, 244)",
          zeroLineColor: "rgb(234, 236, 244)",
          drawBorder: false,
          borderDash: [2],
          zeroLineBorderDash: [2]
        }
      }],
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
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          return datasetLabel + number_format(tooltipItem.yLabel) + 'kcal';
        }
      }
    }
  }
});
}
