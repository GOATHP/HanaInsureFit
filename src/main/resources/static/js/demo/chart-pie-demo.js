// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

var customerID = document.getElementById("customerID").getAttribute("data-customerID");
var pieDataValues=[];

  $.ajax({
    url: 'getAvgIngre',
    type: 'POST',
    dataType: "json",
    data: {
      'customerID': customerID
    },
    success: function (data) {
      pieDataValues = [
        // data.avg_calories,
        data.avg_carbs,
        data.avg_fat,
        data.avg_protein
      ]
      console.log(dataValues);
      drawPieChart();
      },
    error: function (error) {
      console.error('데이터를 가져오는 중 오류 발생: ', error);
    },
  })

// // Pie Chart Example
function drawPieChart() {
  var ctx = document.getElementById("myPieChart");
  var myPieChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
      labels: ["Carbs", "Fat", "Protein"],
      datasets: [{
        data: pieDataValues,
        backgroundColor: ['#1cc88a', '#00857E', '#005753'],
        hoverBackgroundColor: ['#1cc810', '#008510', '#005710'],
        hoverBorderColor: "rgba(234, 236, 244, 1)",
      }],
    },
    options: {
      maintainAspectRatio: false,
      tooltips: {
        backgroundColor: "rgb(255,255,255)",
        bodyFontColor: "#858796",
        borderColor: '#dddfeb',
        borderWidth: 1,
        xPadding: 15,
        yPadding: 15,
        displayColors: false,
        caretPadding: 10,
      },
      legend: {
        display: false
      },
      cutoutPercentage: 80,
    },
  });
}