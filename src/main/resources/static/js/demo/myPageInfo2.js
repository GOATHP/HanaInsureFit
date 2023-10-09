var customerID = document.getElementById("customerID").getAttribute("data-customerID");

function numberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
var dailyRecommendedCalories;
$.ajax({
    url: 'getMyPageInfo',
    type: 'POST',
    dataType: "json",
    data: {
        'customerID': customerID
    },
    success: function (data) {

        console.log(data);
        var healthGrade = data.healthGrade;
        console.log(healthGrade);
        var grade = document.getElementById("grade");
        var gradeImgElement = document.getElementById("gradeImg");
        gradeImgElement.setAttribute("class", "gradeImg");
        gradeImgElement.setAttribute("alt", "프로젝트");
        grade.textContent = healthGrade;
        if (healthGrade === 1) {
            gradeImgElement.setAttribute("src", "resources/static/image/Grade1Graph.png");
        } else if (healthGrade === 2) {
            gradeImgElement.setAttribute("src", "resources/static/image/Grade2Graph.png");
        } else if (healthGrade === 3) {
            gradeImgElement.setAttribute("src", "resources/static/image/Grade3Graph.png");
        } else if (healthGrade === 4) {
            gradeImgElement.setAttribute("src", "resources/static/image/Grade4Graph.png");
        }
        },

    error: function (error) {
        console.error('데이터를 가져오는 중 오류 발생: ', error);
    },
})