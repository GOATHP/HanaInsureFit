var dailyRecommendedCalories;
$.ajax({
    url: 'getMyPageInfo',
    type: 'POST',
    dataType: "json",
    data: {
        'customerID': customerID
    },
    success: function (data) {
        // document.getElementById("heightCell").textContent = data.height + "cm";
        // document.getElementById("weightCell").textContent = data.weight + "kg";
        // document.getElementById("bmiCell").textContent = data.bmi;
        // document.getElementById("bmrCell").textContent = data.basalMetabolicRate + "kcal";
        // document.getElementById("caloriesCell").textContent = data.calories + "kcal";
        dailyRecommendedCalories = data.calories;
        var originalDate = data.checkDate;
        console.log(originalDate);
// 시간 부분을 제외한 날짜 부분 추출
        var dateParts = originalDate.split(" ");
        var dateWithoutTime = dateParts[0]; // "2001-08-23

        // document.getElementById("gradeRecordDate").textContent = "마지막 등록일자 : " + dateWithoutTime;

        console.log(data);
        var healthGrade = data.healthGrade;
        console.log(healthGrade);
        var gradeImgElement = document.getElementById("grade");
        // gradeImgElement.setAttribute("class", "gradeImg");
        // gradeImgElement.setAttribute("alt", "프로젝트");

        if (healthGrade === 1) {
            gradeImgElement.textContent = "Grade" +healthGrade;
        } else if (healthGrade === 2) {
            gradeImgElement.textContent = "Grade" + healthGrade;
        } else if (healthGrade === 3) {
            gradeImgElement.textContent = "Grade" +healthGrade;
        } else if (healthGrade === 4) {
            gradeImgElement.textContent = "Grade" +healthGrade;
        }
        },

    error: function (error) {
        console.error('데이터를 가져오는 중 오류 발생: ', error);
    },
})