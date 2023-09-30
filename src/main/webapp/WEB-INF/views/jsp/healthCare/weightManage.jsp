<%--
  Created by IntelliJ IDEA.
  User: ajou
  Date: 2023-09-07
  Time: 오후 1:10
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>하나 InsureFit</title>
    <link href="resources/static/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="resources/static/css/chartStyle.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-annotation/1.0.2/chartjs-plugin-annotation.min.js"></script>

    <script>
         <%
         String name = (String) session.getAttribute("name");
         String customerID = (String) session.getAttribute("customerID");
         %>
         var customerID = "<%=(String) session.getAttribute("customerID")%>";
         console.log(customerID);
         var dailyCal;
    </script>
    <script>
        var myChart1;
        var myChart2;
        var myChart3;
        var myChart4;
        var myChart;


        document.addEventListener("DOMContentLoaded", function () {

            $.ajax({
                url : '/loadData',
                type : 'POST',
                dataType: "json",
                data: {
                    'customerID': customerID
                },
                success: function(data) {


                    console.log(data);
                    var mealSection;
                    var mealCircle;
                    var mealKcal = 0;

                    console.log(data.foodNames);
                    console.log(data.ingredients);
                    var foodNames = data.foodNames;
                    var ingredients = data.ingredients;

                    var total_calories = 0;
                    var total_carbs = 0;
                    var total_fat = 0;
                    var total_protein = 0;
                    console.log("영양소" +  ingredients);
                    for (var i = 0; i < ingredients.length; i++) {
                        if (ingredients[i] !== null) { // null 체크
                            total_calories += ingredients[i].total_calories || 0; // null이나 undefined인 경우 0으로 처리
                            total_carbs += ingredients[i].total_carbs || 0;
                            total_fat += ingredients[i].total_fat || 0;
                            total_protein += ingredients[i].total_protein || 0;
                        }
                    }
                    console.log("Total Calories: " + total_calories);
                    console.log("Total Carbs: " + total_carbs);
                    console.log("Total Fat: " + total_fat);
                    console.log("Total Protein: " + total_protein);
                    barChartCalories = total_calories;
                    // foodNames 출력
                    console.log('foodNames:');
                    for (var i = 0; i < foodNames.length; i++) {
                        // console.log('Food Name: ' + foodNames[i].foodName);
                        // console.log('Meal Code: ' + foodNames[i].mealCode);
                        var foodInfo = foodNames[i];
                        var foodEntry = foodInfo.foodName;
                        if (foodInfo.mealCode === 0) {
                            morningSection = document.querySelector('.section:nth-child(1) .ateFood');
                            morningCircle= document.querySelector('.section:nth-child(1) .circle');

                            if (morningSection.innerHTML.trim() !== '') {
                                morningSection.innerHTML += ', ';
                            }

                            morningSection.innerHTML += foodEntry;
                            morningCircle.innerHTML = ingredients.find(ingredient => ingredient.mealCode === foodInfo.mealCode)?.total_calories;

                        } else if (foodInfo.mealCode === 1) {
                            lunchSection = document.querySelector('.section:nth-child(2) .ateFood');
                            lunchCircle= document.querySelector('.section:nth-child(2) .circle');
                            if (lunchSection.innerHTML.trim() !== '') {
                                lunchSection.innerHTML += ', ';
                                lunchCircle.innerHTML = totalCalories.toFixed(0);
                            }
                            lunchSection.innerHTML += foodEntry;
                            lunchCircle.innerHTML = ingredients.find(ingredient => ingredient.mealCode === foodInfo.mealCode)?.total_calories;
                        } else if (foodInfo.mealCode === 2) {
                            dinnerSection = document.querySelector('.section:nth-child(3) .ateFood');
                            dinnerCircle= document.querySelector('.section:nth-child(3) .circle');
                            if (dinnerSection.innerHTML.trim() !== '') {
                                dinnerSection.innerHTML += ', ';
                            }
                            dinnerSection.innerHTML += foodEntry;
                            dinnerCircle.innerHTML = ingredients.find(ingredient => ingredient.mealCode === foodInfo.mealCode)?.total_calories;
                        }
                    }
                    // ingredients 출력
                    console.log("총지방 => " + total_fat);
                    console.log("총 칼로리" + barChartCalories);
                    document.getElementById('currentCalories').textContent = total_calories;
                    caloriesPercentage = (total_calories / weightManageArray[0].calories) * 100; // 섭취한 칼로리의 백분율
                    document.getElementById('caloriesPercentage').textContent = caloriesPercentage.toFixed(1) + '%';
                    console.log("칼로리퍼센트" + caloriesPercentage);
                    setHeartClass(caloriesPercentage);
                    // 추가적인 로직 또는 UI 업데이트를 여기에 추가할 수 있습니다.const ctx = document.getElementById('myChart').getContext('2d');
                    const ctx13 = document.getElementById('combined-bar-chart').getContext('2d');

                    myChart = new Chart(ctx13, {
                        type: 'bar',
                        data: {
                            labels: ['탄수화물 총합', '단백질 총합', '지방 총합'],
                            datasets: [
                                {
                                    label: ['탄수화물', '단백질', '지방'],
                                    data: [total_carbs, total_protein, total_fat],
                                    backgroundColor: [
                                        'rgba(255, 206, 86, 0.2)',
                                        'rgba(153, 102, 255, 0.2)',
                                        'rgba(75, 192, 192, 0.2)'
                                    ],
                                    borderColor: [
                                        'rgba(255, 206, 86, 1)',
                                        'rgba(153, 102, 255, 1)',
                                        'rgba(75, 192, 192, 1)'
                                    ],
                                    borderWidth: 0.1
                                }
                            ]
                        },
                        options: {
                            barThickness:30,
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        },
                        plugins: {
                            legend: {
                                display: false, // 범례 표시 여부
                                position: 'top', // 범례 위치 (top, bottom, left, right)
                                labels: {
                                    font: {
                                        size: 12 // 범례 레이블의 글꼴 크기
                                    },
                                    align: 'start'
                                }
                            }
                        }
                    });


                    const ctx = document.getElementById('bar-chart-calories').getContext('2d');


                    myChart1 = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: ['Kcal'],
                            datasets: [{
                                label: '칼로리 총합',
                                data: [total_calories],
                                backgroundColor: [
                                    'rgba(255, 99, 132, 0.2)'
                                    // 'rgba(54, 162, 235, 0.2)',
                                    // 'rgba(255, 206, 86, 0.2)',
                                    // 'rgba(75, 192, 192, 0.2)',
                                    // 'rgba(153, 102, 255, 0.2)',
                                    // 'rgba(255, 159, 64, 0.2)'
                                ],
                                borderColor: [
                                    'rgba(255, 99, 132, 1)'
                                    // 'rgba(54, 162, 235, 1)',
                                    // 'rgba(255, 206, 86, 1)',
                                    // 'rgba(75, 192, 192, 1)',
                                    // 'rgba(153, 102, 255, 1)',
                                    // 'rgba(255, 159, 64, 1)'
                                ],
                                borderWidth: 0.1
                            }]
                        },
                        options: {
                            barThickness:30,
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        }
                    });
                    // const ctx2 = document.getElementById('bar-chart-carbs').getContext('2d');
                    // myChart2 = new Chart(ctx2, {
                    //     type: 'bar',
                    //     data: {
                    //         labels: ['g'],
                    //         datasets: [{
                    //             label: '탄수화물 총합',
                    //             data: [total_carbs],
                    //             backgroundColor: [
                    //                 // 'rgba(255, 99, 132, 0.2)
                    //                 // 'rgba(54, 162, 235, 0.2)',
                    //                 'rgba(255, 206, 86, 0.2)'
                    //                 // 'rgba(75, 192, 192, 0.2)',
                    //                 // 'rgba(153, 102, 255, 0.2)',
                    //                 // 'rgba(255, 159, 64, 0.2)'
                    //             ],
                    //             borderColor: [
                    //                 // 'rgba(255, 99, 132, 1)'
                    //                 // 'rgba(54, 162, 235, 1)',
                    //                 'rgba(255, 206, 86, 1)'
                    //                 // 'rgba(75, 192, 192, 1)',
                    //                 // 'rgba(153, 102, 255, 1)',
                    //                 // 'rgba(255, 159, 64, 1)'
                    //             ],
                    //             borderWidth: 0.2
                    //         }]
                    //     },
                    //     options: {
                    //         scales: {
                    //             y: {
                    //                 beginAtZero: true
                    //             }
                    //         }
                    //     }
                    // });
                    // const ctx3 = document.getElementById('bar-chart-protein').getContext('2d');
                    // myChart3 = new Chart(ctx3, {
                    //     type: 'bar',
                    //     data: {
                    //         labels: ['g'],
                    //         datasets: [{
                    //             label: '단백질 총합',
                    //             data: [total_protein],
                    //             backgroundColor: [
                    //                 // 'rgba(255, 99, 132, 0.2)'
                    //                 // 'rgba(54, 162, 235, 0.2)',
                    //                 // 'rgba(255, 206, 86, 0.2)',
                    //                 // 'rgba(75, 192, 192, 0.2)',
                    //                 'rgba(153, 102, 255, 0.2)'
                    //                 // 'rgba(255, 159, 64, 0.2)'
                    //             ],
                    //             borderColor: [
                    //                 // 'rgba(255, 99, 132, 1)'
                    //                 // 'rgba(54, 162, 235, 1)',
                    //                 // 'rgba(255, 206, 86, 1)',
                    //                 // 'rgba(75, 192, 192, 1)',
                    //                 'rgba(153, 102, 255, 1)'
                    //                 // 'rgba(255, 159, 64, 1)'
                    //             ],
                    //             borderWidth: 0.2
                    //         }]
                    //     },
                    //     options: {
                    //         scales: {
                    //             y: {
                    //                 beginAtZero: true
                    //             }
                    //         }
                    //     }
                    // });
                    // const ctx4 = document.getElementById('bar-chart-fat').getContext('2d');
                    // myChart4 = new Chart(ctx4, {
                    //     type: 'bar',
                    //     data: {
                    //         labels: ['g'],
                    //         datasets: [{
                    //             label: '지방 총합',
                    //             data: [total_fat],
                    //             backgroundColor: [
                    //                 // 'rgba(255, 99, 132, 0.2)'
                    //                 // 'rgba(54, 162, 235, 0.2)',
                    //                 // 'rgba(255, 206, 86, 0.2)',
                    //                 'rgba(75, 192, 192, 0.2)'
                    //                 // 'rgba(153, 102, 255, 0.2)',
                    //                 // 'rgba(255, 159, 64, 0.2)'
                    //             ],
                    //             borderColor: [
                    //                 // 'rgba(255, 99, 132, 1)'
                    //                 // 'rgba(54, 162, 235, 1)',
                    //                 // 'rgba(255, 206, 86, 1)',
                    //                 'rgba(75, 192, 192, 1)'
                    //                 // 'rgba(153, 102, 255, 1)',
                    //                 // 'rgba(255, 159, 64, 1)'
                    //             ],
                    //             borderWidth: 0.2
                    //         }]
                    //     },
                    //     options: {
                    //         scales: {
                    //             y: {
                    //                 beginAtZero: true
                    //             }
                    //         }
                    //     }
                    // });
                    sendAddressInfoToServer(customerID);
                    // fetchDataAndUpdateChart();
                },
                error: function(data) {

                },
            });
        });

    </script>
    <script>
        var barChartCalories;
        var foodData;
        var foodID;
        var dataForServer;
        var weight;
        var amountPerOnce;

        // 검색창
        $(document).ready(function () {
                $('.search-box').on('input', function () {

                var input = $('.search-box').val();
                $.ajax({
                    url: '/stock-searching',  // API endpoint
                    type: 'GET',
                    data: {
                        'input': input
                    },

                    success: function (data) {
                        console.log(data);
                        var resultHtml = '';
                        for (var i = 0; i < data.length; i++) {
                            resultHtml += '<div>' + data[i].foodName + '</div>'; // Assuming 'name' is a property of Stock
                        }
                        $('.search-result').html(resultHtml).show();
                    },
                    error: function (data) {
                    },
                });
            });

            $(document).click(function (event) {
                if (!$(event.target).closest('.searchBar').length) {
                    $('.search-result').hide();
                }
            });

            $(document).on('click', '.search-result div', function () {
                $('.search-box').val($(this).text());
            });
            $('.search-box').on('focus', function () {
                toggleCloseFoodInfo(); // 커서가 .search-box에 포커스를 가질 때 toggleCloseFoodInfo() 함수 실행
            });
        });
        // 추가 버튼 호출 시 동작
        function handleSearch() {
            const input = $('.search-box').val();
            $.ajax({
                url: "/stock-search",
                type: "GET",
                data: {
                    'input': input
                },
                success: function (data) {
                    toggleFoodInfo();
                    console.log(data.foodName);
                    $('.food').text(data.foodName + '(' + data.foodName + ')');
                    foodData = data;
                    selectedFoodInfo = foodData;
                    amountPerOnce = foodData.amountPerOnce;
                    foodID = foodData.foodID;

                    // 기존 테이블 삭제
                    var foodInfo = document.getElementById('foodInfo');
                    while (foodInfo.firstChild) {
                        foodInfo.removeChild(foodInfo.firstChild);
                    }

                    var table = document.createElement("table");
                    table.className = "foodTable";
                    var rows = [
                        { label: "식품명", value: foodData.foodName },
                        { label: "탄수화물", value: foodData.carbs },
                        { label: "지방", value: foodData.fat },
                        { label: "단백질", value: foodData.protein },
                        { label: "칼로리", value: foodData.calories },
                        { label: "1회 제공량", value: foodData.amountPerOnce }
                    ];

                    // 테이블 데이터 동적 생성 및 추가
                    for (var i = 0; i < rows.length; i++) {
                        var row = document.createElement("tr");

                        var labelCell = document.createElement("th");
                        labelCell.textContent = rows[i].label;

                        var valueCell = document.createElement("td");
                        valueCell.textContent = rows[i].value;

                        row.appendChild(labelCell);
                        row.appendChild(valueCell);

                        table.appendChild(row);
                    }

                    foodInfo.appendChild(table);

                    weight = document.getElementById('weightInput');
                    weight.textContent = foodData.amountPerOnce;
                },

                error: function () {
                    console.log("Error occurred.");
                },
            });
        }



        var weightManageArray = [];

        function sendAddressInfoToServer(customerID) {
            $.ajax({
                type: "POST",
                url: "/weightManage?customerID=" + customerID, // 'customerID'를 URL 파라미터로 보냄
                success: function (response) {
                    console.log("Data received from server:", response);
                    weightManageArray.push(response);
                    var currentCaloriesElement = document.getElementById("goalCalories");
                    currentCaloriesElement.textContent = weightManageArray[0].calories + "kcal";
                    dailyRecommendedCalories = weightManageArray[0].calories;


                    drawChart(dailyRecommendedCalories);
                },
                error: function (xhr, status, error) {
                    console.error("Request failed with status:", status, error);
                }
            });
        }
        sendAddressInfoToServer(customerID);

        // function sendAddressInfoToServer(customerID) {
        //     var xhr = new XMLHttpRequest();
        //     xhr.open("POST", "/weightManage", true);
        //     xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        //
        //     var data = JSON.stringify({ customerID: customerID });
        //
        //     xhr.onreadystatechange = function () {
        //         if (xhr.readyState === 4) {
        //             if (xhr.status === 200) {
        //                 try {
        //                     var response = JSON.parse(xhr.responseText);
        //                     console.log("Data received from server:", response);
        //
        //                     weightManageArray.push(response);
        //                     var currentCaloriesElement = document.getElementById("goalCalories");
        //                     currentCaloriesElement.textContent = weightManageArray[0].goalCal + "kcal";
        //                     dailyRecommendedCalories = weightManageArray[0].goalCal;
        //                 } catch (error) {
        //                     console.error("Error parsing JSON response:", error);
        //                 }
        //             } else {
        //                 console.error("Request failed with status:", xhr.status, xhr.statusText);
        //             }
        //         }
        //     };
        //
        //     xhr.send(data);
        // }
    </script>

    <script>
        var weightInput;
        var dailyRecommendedCalories;
        function toggleForm() {
            var formContainer = document.querySelector('.form-container');
            formContainer.style.display = formContainer.style.display === 'none' ? 'block' : 'none';
        }

        function toggleFoodInfo() {
            var foodInfo = document.querySelector('.foodInfo');
            foodInfo.style.display = 'block';
            // foodInfo.style.display = foodInfo.style.display === 'none' ? 'block' : 'none';
        }

        function toggleCloseFoodInfo() {
            var foodInfo = document.querySelector('.foodInfo');
            foodInfo.style.display = foodInfo.style.display === 'block' ? 'none' : 'block';
        }

        var totalCalories = 0;
        var totalFat = 0;
        var totalCarbs = 0;
        var totalProtein = 0;
        var caloriesDesc, fatDesc, carbsDesc, proteinDesc;

         // 하루 섭취 권장 칼로리
        var currentCalories = 0; // 현재 섭취한 칼로리
        var caloriesPercentage = (0 / dailyRecommendedCalories) * 100; // 섭취한 칼로리의 백분율

        function updateCalorieCircle(mealType, calorieValue) {
            var mealSection = document.querySelector('.section.' + mealType);
            var circleElement = mealSection.querySelector('.circle');
            var calorieText = calorieValue + ' kcal';
            circleElement.textContent = calorieText;
        }
        function updateChart() {
            data.datasets[0].data[4] = totalCalories;
            myBarChart.update();
        }
        function addMeal() {

            var mealTypeRadios = document.getElementsByName('mealType');
            var selectedMealType;
            for (var i = 0; i < mealTypeRadios.length; i++) {
                if (mealTypeRadios[i].checked) {
                    selectedMealType = mealTypeRadios[i].value;
                    break;
                }
            }
            var mealCode;

            weightInput = document.getElementById('weightInput').value;

            var mealSection;
            var mealCircle;
            var mealKcal = 0;
            if (selectedMealType === 'morning') {
                mealSection = document.querySelector('.section:nth-child(1) .ateFood');
                mealCode = 0; // 아침
                mealCircle= document.querySelector('.section:nth-child(1) .circle');
            } else if (selectedMealType === 'lunch') {
                mealSection = document.querySelector('.section:nth-child(2) .ateFood');
                mealCode = 1; // 아침
                mealCircle= document.querySelector('.section:nth-child(2) .circle');
            } else if (selectedMealType === 'dinner') {
                mealSection = document.querySelector('.section:nth-child(3) .ateFood');
                mealCode = 2; // 아침
                mealCircle = document.querySelector('.section:nth-child(3) .circle');
            }
            if (mealSection && weightInput) {
                var selectedFoodInfo = foodData // 수정된 부분
                console.log(foodData)
                console.log(selectedFoodInfo)

                mealKcal = parseInt(mealCircle.textContent);

                totalCalories = (selectedFoodInfo.calories / selectedFoodInfo.amountPerOnce) * parseInt(weightInput);
                mealKcal = (selectedFoodInfo.calories / selectedFoodInfo.amountPerOnce) * parseInt(weightInput);
                mealCircle.innerHTML = totalCalories.toFixed(0);
                mealKcal = 0;
                totalFat = (selectedFoodInfo.fat / selectedFoodInfo.amountPerOnce) * (parseInt(weightInput));
                totalCarbs = (selectedFoodInfo.carbs / selectedFoodInfo.amountPerOnce) * (parseInt(weightInput));
                totalProtein = (selectedFoodInfo.protein / selectedFoodInfo.amountPerOnce) * (parseInt(weightInput));

                currentCalories = totalCalories; // 현재 섭취한 칼로리
                caloriesPercentage = (currentCalories / dailyRecommendedCalories) * 100; // 섭취한 칼로리의 백분율
                document.getElementById('currentCalories').textContent = currentCalories.toFixed(1);
                document.getElementById('caloriesPercentage').textContent = caloriesPercentage.toFixed(1) + '%';
            }

            dataForServer = {
                foodID: foodID,
                amountPerOnce: weightInput,
                customerID: customerID,
                mealCode: mealCode,
                calories: totalCalories.toFixed(0),
                fat: totalFat.toFixed(0),
                carbs: totalCarbs.toFixed(0),
                protein: totalProtein.toFixed(0)
            };
            console.log("데이터 확인 =>" + dataForServer);
            $.ajax({
                url: '/insertDiet', // 식사 정보를 등록하는 서버 엔드포인트 URL로 변경해야 합니다.
                type: 'POST', // POST 요청 사용
                data: JSON.stringify(dataForServer), // 데이터를 JSON 형식으로 변환하여 전송
                contentType: 'application/json',
                success: function (response) {
                    var jsonResponse = JSON.parse(response);
// foodNames 속성이 어떤 구조를 가지고 있는지 확인합니다.
                    console.log(jsonResponse.foodNames);
                    console.log(jsonResponse.ingredients);
                    var foodNames = jsonResponse.foodNames;
                    var ingredients = jsonResponse.ingredients;

                    var total_calories = 0;
                    var total_carbs = 0;
                    var total_fat = 0;
                    var total_protein = 0;
                    console.log("영양소" +  ingredients);
                    for (var i = 0; i < ingredients.length; i++) {
                        if (ingredients[i] !== null) { // null 체크
                            total_calories += ingredients[i].total_calories || 0; // null이나 undefined인 경우 0으로 처리
                            total_carbs += ingredients[i].total_carbs || 0;
                            total_fat += ingredients[i].total_fat || 0;
                            total_protein += ingredients[i].total_protein || 0;
                        }
                    }
                    console.log("Total Calories: " + total_calories);
                    console.log("Total Carbs: " + total_carbs);
                    console.log("Total Fat: " + total_fat);
                    console.log("Total Protein: " + total_protein);
                    barChartCalories = total_calories;
                    // foodNames 출력
                    console.log('foodNames:' + foodNames.length);

                    for (var i = 0; i < foodNames.length; i++) {
                    //     foodNames[foodNames.length - 1].foodName
                    //     console.log('Food Name: ' + foodNames[i].foodName);
                    //     console.log('Meal Code: ' + foodNames[i].mealCode);
                        var foodInfo = foodNames[i];
                        console.log(foodInfo);
                        var foodEntry = foodInfo.foodName;
                        if (foodInfo.mealCode === 0) {
                            morningSection = document.querySelector('.section:nth-child(1) .ateFood');
                            morningCircle= document.querySelector('.section:nth-child(1) .circle');

                            if (morningSection.innerHTML.trim() !== '') {
                                morningSection.innerHTML += ', ';
                            }
                            console.log("foodEntry" + foodEntry);
                            morningSection.innerHTML += foodEntry;
                            console.log(foodEntry);
                            morningCircle.innerHTML = ingredients.find(ingredient => ingredient.mealCode === foodInfo.mealCode)?.total_calories;

                        } else if (foodInfo.mealCode === 1) {
                            lunchSection = document.querySelector('.section:nth-child(2) .ateFood');
                            lunchCircle= document.querySelector('.section:nth-child(2) .circle');

                            if (lunchSection.innerHTML.trim() !== '') {
                                lunchSection.innerHTML += ', ';

                            }
                            lunchSection.innerHTML += foodEntry;
                            // lunchSection.innerHTML += foodEntry;
                            lunchCircle.innerHTML = ingredients.find(ingredient => ingredient.mealCode === foodInfo.mealCode)?.total_calories;

                        } else if (foodInfo.mealCode === 2) {
                            dinnerSection = document.querySelector('.section:nth-child(3) .ateFood');
                            dinnerCircle= document.querySelector('.section:nth-child(3) .circle');
                            if (dinnerSection.innerHTML.trim() !== '') {
                                dinnerSection.innerHTML += ', ';
                            }
                            dinnerSection.innerHTML += foodEntry;
                            dinnerCircle.innerHTML = ingredients.find(ingredient => ingredient.mealCode === foodInfo.mealCode)?.total_calories;
                        }

                    }

                    // ingredients 출력
                    console.log("총지방 => " + total_fat);

                    console.log("총 칼로리" + barChartCalories);
                    document.getElementById('currentCalories').textContent = total_calories;
                    caloriesPercentage = (total_calories / weightManageArray[0].calories) * 100; // 섭취한 칼로리의 백분율
                    document.getElementById('caloriesPercentage').textContent = caloriesPercentage.toFixed(1) + '%';

                    fetchDataAndUpdateChart();
                    console.log("칼로리퍼센트" + caloriesPercentage);
                    setHeartClass(caloriesPercentage);

                    // 추가적인 로직 또는 UI 업데이트를 여기에 추가할 수 있습니다.const ctx = document.getElementById('myChart').getContext('2d');




                    createOrUpdateChart();
                    function createOrUpdateChart() {
                        myChart.destroy();
                        myChart1.destroy();
                        // myChart2.destroy();
                        // myChart3.destroy();
                        // myChart4.destroy();
                        const ctx1 = document.getElementById('bar-chart-calories').getContext('2d');
                        myChart1 = new Chart(ctx1, {
                            type: 'bar',
                            data: {
                                labels: ['Kcal'],
                                datasets: [{
                                    label: '칼로리 총합',
                                    data: [total_calories],
                                    backgroundColor: [
                                        'rgba(255, 99, 132, 0.2)'
                                        // 'rgba(54, 162, 235, 0.2)',
                                        // 'rgba(255, 206, 86, 0.2)',
                                        // 'rgba(75, 192, 192, 0.2)',
                                        // 'rgba(153, 102, 255, 0.2)',
                                        // 'rgba(255, 159, 64, 0.2)'
                                    ],
                                    borderColor: [
                                        'rgba(255, 99, 132, 1)'
                                        // 'rgba(54, 162, 235, 1)',
                                        // 'rgba(255, 206, 86, 1)',
                                        // 'rgba(75, 192, 192, 1)',
                                        // 'rgba(153, 102, 255, 1)',
                                        // 'rgba(255, 159, 64, 1)'
                                    ],
                                    borderWidth: 0.2
                                }]
                            },
                            options: {
                                barThickness:30,
                                scales: {
                                    y: {
                                        beginAtZero: true
                                    }
                                }
                            }
                        });
                        const ctx2 = document.getElementById('combined-bar-chart').getContext('2d');
                        myChart = new Chart(ctx2, {
                            type: 'bar',
                            data: {
                                labels: ['탄수화물 총합', '단백질 총합', '지방 총합'],
                                datasets: [
                                    {
                                        label: 'g',
                                        data: [total_carbs, total_protein, total_fat],
                                        backgroundColor: [
                                            'rgba(255, 206, 86, 0.2)',
                                            'rgba(153, 102, 255, 0.2)',
                                            'rgba(75, 192, 192, 0.2)'
                                        ],
                                        borderColor: [
                                            'rgba(255, 206, 86, 1)',
                                            'rgba(153, 102, 255, 1)',
                                            'rgba(75, 192, 192, 1)'
                                        ],
                                        borderWidth: 0.2
                                    }
                                ]
                            },
                            options: {
                                barThickness:30,
                                scales: {
                                    y: {
                                        beginAtZero: true
                                    }
                                }
                            }
                        });
                    }
                    },
                error: function (error) {
                    // 등록 중 오류가 발생한 경우에 수행할 동작
                    console.log(dataForServer);
                    console.error('식사 정보 등록 중 오류가 발생했습니다.');
                    console.error(error);
                    // 오류 메시지를 사용자에게 표시하거나 다른 처리를 수행할 수 있습니다.
                },
            });
            drawChart();
        }
        function selectFood(food) {
            var foodInput = document.getElementById('search-box');
            foodInput.value = food;
            var foodList = document.querySelectorAll('.food-list li');
            for (var i = 0; i < foodList.length; i++) {
                foodList[i].classList.remove('selected-food');
                if (foodList[i].textContent === food) {
                    foodList[i].classList.add('selected-food');
                }
            }
            var selectedFoodInfo = foodData;
            selectedFood = selectedFoodInfo;
        }
        function updateFoodList(input) {
            var searchTerm = input.value.toLowerCase();
            var foodList = document.querySelector('.food-list');
            foodList.innerHTML = '';
            if (searchTerm.length > 0) {
                foodData.forEach(function (food) {
                    if (food.name.toLowerCase().indexOf(searchTerm) !== -1) {
                        var li = document.createElement('li');
                        li.textContent = food.name;
                        li.onclick = function () {
                            selectFood(food.name);
                        };
                        foodList.appendChild(li);
                    }

                });
            }
        }
        // function updateGraph() {
        //     var caloriesPercentage = (totalCalories / 2000) * 100; // 총 칼로리 대비 비율
        //     var fatPercentage = (totalFat / 70) * 100; // 총 지방 대비 비율
        //     var carbsPercentage = (totalCarbs / 300) * 100; // 총 탄수화물 대비 비율
        //     var proteinPercentage = (totalProtein / 50) * 100; // 총 단백질 대비 비율
        //
        //     // 그래프 업데이트
        //     var caloriesBar = document.querySelector('.bar.green');
        //     var fatBar = document.querySelector('.bar.pink');
        //     var carbsBar = document.querySelector('.bar.clear');
        //     var proteinBar = document.querySelector('.bar.clear');
        //
        //     caloriesBar.style.width = caloriesPercentage + '%';
        //     fatBar.style.width = fatPercentage + '%';
        //     carbsBar.style.width = carbsPercentage + '%';
        //     proteinBar.style.width = proteinPercentage + '%';
        //
        //     // 그래프 설명 업데이트
        //     var caloriesEm = document.getElementById('caloriesEm');
        //     var fatEm = document.getElementById('fatEm');
        //     var carbsEm = document.getElementById('carbsEm');
        //     var proteinEm = document.getElementById('proteinEm');
        //
        //     caloriesEm.textContent = totalCalories.toFixed(0);
        //     fatEm.textContent = totalFat.toFixed(0);
        //     carbsEm.textContent = totalCarbs.toFixed(0);
        //     proteinEm.textContent = totalProtein.toFixed(0);
        // }
    </script>
    <script>
        function sendFoodInfoToServer(selectedFoodInfo, customerID) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/insertFood", true);
            xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
            var data = {
                selectedFoodInfo: selectedFoodInfo,
                customerID : customerID
            };
            var jsonData = JSON.stringify(data);
            console.log(selectedFoodInfo);
        }

    </script>
    <script>
        function setHeartClass(caloriesPercentage) {
            const heart = document.querySelector('.heart');
// Remove existing classes
            console.log(caloriesPercentage);
            if (caloriesPercentage <= 25) {
                heart.src = "resources/static/image/heart_25.png";
            } else if (caloriesPercentage <= 50) {
                heart.src = "resources/static/image/heart_half.png";
            } else if (caloriesPercentage <= 75) {
                heart.src = "resources/static/image/heart_75.png";
            } else {
                heart.src = "resources/static/image/heart_full.png";
            }
        }
    </script>
</head>
<body>

<header>
    <div class="navAll">
        <div class="upper">
            <ul class="link_crfix">
                <li class="item">
                    <a href="https://www.hanainsure.co.kr/">
                        하나손해보험
                    </a>
                </li>
                <li class="item">
                    <a href="/Introduce">
                        서비스소개
                    </a>
                </li>
                <li class="item">
                    <a href="https://www.hanafn.com:8002/info/people/careerNonscheduledEmploy.do">
                        채용안내
                    </a>
                </li>
            </ul>

            <ul class="link_crfix">
                <%
                    if (name != null) {
                %>
                <li><div class="welcomeMent"><%= name %> (<%=customerID%>)님 환영합니다</div></li>
                <li><a href="javascript:void(0);" onclick="logout();">로그아웃</a></li>
                <%
                } else {
                %>
                <li class="item"><a href="/joinMember">회원가입</a></li>
                <li class="item"><div class="loginButton">로그인</div></li>
                <%
                    }
                %>
            </ul>
        </div>
        <div class="menu">
            <nav>
                <div class="logo">
                    <a href="/">

                        <img src="resources/static/image/플젝로고.png" alt="프로젝트 로고">
                    </a>
                </div>
                <ul>
                    <li><a href="/introduce">하나Insure Fit이란?</a></li>
                    <li><a href="/recommendInsu">Grade보험</a></li>
                    <li><a href="/weightManage" class="clicked">건강관리</a></li>
                    <li><a href="/dashboardMypage">마이페이지</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<div class="mainSideContainer">
    <div class="sideBar">
        <div class="sideBarName">
            건강관리
        </div>
        <div class="sideBarContents">
            <a href="/weightManage" class="sideBarTabClicked">
                칼로리 관리
            </a>
            <a href="/recommendFood" class="sideBarTab">
                칼로리 맞춤 식당
            </a>
        </div>
    </div>
    <div id="main">
        <main>
            <div class="navInfo">Main &nbsp&nbsp  > &nbsp&nbsp 건강관리 &nbsp&nbsp > &nbsp&nbsp  칼로리 관리</div>
            <div class="calManageMoongoo">내 칼로리 관리</div>
            <div class="image-row">
                <div class="image-column">
                    <img class="heart" style="width: 200px;height: 200px;" src="resources/static/image/heart_zero.png" alt="Heart Image">

                    <br>
                    <p class="imageWord1" style="font-size: 20px;">

                        <%=name%>님 칼로리하트
                    </p>
                    <div class="weightInfo">
                        <%=name%>님 안녕하세요! 체중관리(감량)을 위해서는<br>
                        오늘 하루 <div class="calories" id="goalCalories">2238</div>를 드셔야 합니다! <br>
                        현재 <div class="calories" id="currentCalories">0</div>kcal(<div class="calories" id="caloriesPercentage">0% </div>)를 드셨네요!<br>

                    </div>
                </div>
                <div class="image-column">
                    <canvas id="caloriesChart" width="400" height="300"></canvas>
                    <br>
                    <br>
                    <p class="imageWord2" style="font-size: 20px;">
                        일주일간 맞춤 칼로리 달성횟수 :
                    <p class="successCount" id="successCOunt" style="font-size: 20px;">5</p>
                    <p class="imageWord2" style="font-size: 20px;">/ 7
                    <p>
                    </p>
                </div>
            </div>

            <div class="container">
                <div class="btn" onclick="toggleForm()">
                    <span>식사 입력</span>
                    <div class="dot"></div>
                </div>
                <div class="modal">
                    <div class="modal_body">
                        <div class="closeDiv">
                        <button class="btn-close-popup">닫기</button>
                        </div>
                    <div class="form-container">
                    <h2>식사 입력 폼</h2>
                    <table class="foodTable">
                        <tr>
                    <th><label for="mealType">식사 시간대</label></th>
                    <td>
                    <div class="meal-buttons">
                        <input type="radio" id="morning" name="mealType" value="morning">
                        <label for="morning">아침</label>
                        <input type="radio" id="lunch" name="mealType" value="lunch">
                        <label for="lunch">점심</label>
                        <input type="radio" id="dinner" name="mealType" value="dinner">
                        <label for="dinner">저녁</label>
                    </div>
                    </td>
                        </tr>
                        <tr>
                            <th>
                                <div class="foodColName">
                                    <label for="foodInput">음식 검색</label>
                                </div>
                            </th>


                        <td>
                    <div class="foodAdd">
                        <div class = "search-food">
                            <input class="search-box" type="text" placeholder="🔍 SEARCH">
                        </div>
                        <div class="search-result" style="height: auto"></div>
                        <div class="foodInfo" id="foodInfo">
                    </div>

                    </div>
                    <button class="search-button" onclick="handleSearch()">추가</button>
                    <ul class="food-list"></ul>
                    <div class = "search-food">
                    <div class="foodColName">
                        </td>
                        </tr>
                        <th>
                        <label for="weightInput">중량 (g):</label>
                        </th>
                    </div>
                        <td>
                    <input type="number" id="weightInput" name="weightInput" placeholder="중량을 입력하세요">
                        </td>
                    </tr>
                    </div>
                    </div>
                    </table>
                    <div class="addBtn">
                        <button id="addMeal" onclick="addMeal()">등록</button>
                    </div>
                </div>
                    </div>
                </div>

            </div>
            <div class="middleCon3">
                <div class="section">
                    <div class="kcalContent">
                        아침
                    </div>
                    <div class="circle">
                        -
                    </div>
                    <div>
                        kcal
                    </div>
                    <div class="ateFood" id="ateFood">

                    </div>
                </div>
                <div class="section">
                    <div class="kcalContent">
                        점심
                    </div>
                    <div class="circle">
                        -
                    </div>
                    <div>
                        kcal
                    </div>
                    <div class="ateFood">
                    </div>
                </div>
                <div class="section">
                    <div class="kcalContent">
                        저녁
                    </div>
                    <div class="circle">
                        -
                    </div>
                    <div>
                        kcal
                    </div>
                    <div class="ateFood">

                    </div>
                </div>
            </div>
            <div class="calManageMoongoo">내 영양 성분 관리</div>
            <div class="graphContainer">
                <div class="graph-container-4">
                    <div class="graph-4" id="calories">칼로리
                    <div class="graphContenet">그래프<canvas class="graphFood" id="bar-chart-calories" width="400" height="300"></canvas></div>
                    </div>
                    <div class="graph-4" id="carbs">영양성분
                        <div class="graphContenet">그래프<canvas class="graphFood" id="combined-bar-chart" width="400" height="300"></canvas></div>
                    </div>
<%--                    <div class="graph-4" id="carbs">탄수화물--%>
<%--                        <div class="graphContenet">그래프<canvas class="graphFood" id="bar-chart-carbs" width="400" height="400"></canvas></div>--%>
<%--                    </div>--%>

<%--                    <div class="graph-4" id="protein">단백질--%>
<%--                        <div class="graphContenet">그래프 <canvas class="graphFood" id="bar-chart-protein" width="400" height="400"></canvas></div>--%>
<%--                    </div>--%>
<%--                    <div class="graph-4" id="fat">지방--%>
<%--                        <div class="graphContenet">그래프 <canvas class="graphFood" id="bar-chart-fat" width="400" height="400"></canvas></div>--%>
<%--                    </div>--%>
                </div>
            </div>
    </div>
    </main>
</div>
</div>

<footer id="footer">
    <div>Contact us | 개인정보처리방침 | 고객정보취급방침 | 건강한 소리(부정제보) | 인천 서구 에코로 167 하나금융그룹 통합데이터센터 비전센터 5층 | Copyright ©
        Hana TI 2019. ALL RIGHT RESERVE</div>
</footer>

<script>
    var caloriesCount = 0;
    var myBarChart;
    function drawChart(dailyRecommendedCalories) {


        const annotation = {
            type: 'line',
            mode: 'horizontal',
            scaleID: 'y',
            value: 1800, // 원하는 값을 설정하세요 (예: 1800)
            borderColor: '#ff0000',
            borderWidth: 2,
            label: {
                enabled: true,
                content: '1800'
            }
        }
        var currentDate = new Date();
        var labels = [];
        var dataValues = [];

        var data = {
            labels: labels,
            datasets: [
                {
                    label: '하루 총 칼로리',
                    data: dataValues,
                    backgroundColor: '#00857E',
                    barThickness: 20,
                },
                // {
                //     label: '칼로리 기준선',
                //     data: [dailyRecommendedCalories, dailyRecommendedCalories, dailyCal, dailyCal, dailyCal, 2000, 2000],
                //     borderColor: 'rgb(75, 192, 192)',
                //     borderWidth: 2,
                //     backgroundColor: '#ff0000',
                //     fill: false,
                //     type: 'line',
                // },
            ],
        };

        var options = {
            scales: {
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
        };



        var ctx = document.getElementById('caloriesChart').getContext('2d');
        if (myBarChart) {
            myBarChart.destroy();
        }
        myBarChart = new Chart(ctx, {
            type: 'bar',
            data: data,
            options: options,
        });

        // 데이터 업데이트
        fetchDataAndUpdateChart();
    }

    function fetchDataAndUpdateChart() {
        var labels = [];
        var dataValues = [];

        $.ajax({
            url: 'getChartData',
            method: 'POST',
            dataType: 'json',
            data: {
                'customerID': customerID
            },
            success: function(response) {
                for (var i = 0; i < response.length; i++) {
                    labels.push(response[i].recorddate);
                    dataValues.push(response[i].total_calories);
                    console.log("dataValues"+dataValues);
                }


                // 차트 데이터 업데이트
                myBarChart.data.labels = labels;
                myBarChart.data.datasets[0].data = dataValues;

                // 차트 업데이트
                myBarChart.update();

                var caloriesElement = document.getElementById("goalCalories");
                var caloriesText = caloriesElement.textContent; // "1800kcal"

// 숫자 부분을 추출 (정규 표현식 사용)
                var caloriesNumber = parseFloat(caloriesText.match(/\d+/)[0]);
                console.log("칼로리넘버" + caloriesNumber);
// 추출된 숫자를 출력
                for (var i = 0; i < dataValues.length; i++) {
                    if ( dataValues[i] < caloriesNumber) {
                        caloriesCount += 1;
                    }
                }
                console.log("칼로리카운트" + caloriesCount);
                // document.getElementById("successCount").textContent = caloriesCount;

            },
            error: function(error) {
                console.error('데이터를 가져오는 중 오류 발생: ', error);
            },
        });
    }
    // 초기 호출
    drawChart(dailyRecommendedCalories); // 초기 차트 생성


    function updateChart() {
        myBarChart.update();
    }
    var currentCalories = 0;
    currentCalories = Math.floor(Math.random() * dailyRecommendedCalories);
</script>
<script>
    function loginFormFunc() {
        console.log("꿀");
        // var formData = $("#loginForm").serialize();
        var customerID = $("#customerID").val();
        var password = $("#password").val();
        console.log(customerID);
        console.log(password);
        $.ajax({
            type: "POST",
            url: "/loginMember",
            data: JSON.stringify({
                customerID: customerID,
                password: password
            }),
            contentType: 'application/json',
            error: function (xhr, status, error) {
                alert(error + "error");
            },
            success: function (response) {
                if (response === "로그인 성공") {
                    alert("로그인 성공");
                    var link = document.createElement("a");
                    link.href = "/";
                    link.click();
                } else {
                    console.error("로그인 실패");
                }
            }
        });
    }

        function logout() {
        $.ajax({
            type: "POST",
            url: "/logout",
            dataType: "json", // 응답 형식을 JSON으로 설정
            success: function (response) {
                if (response.status === "success") {
                    // 로그아웃 성공 시 세션 정보 삭제 및 화면 갱신
                    alert(response.message);
                    location.reload(); // 페이지 새로고침
                } else {
                    console.error(response.message);
                }
            },
            error: function (xhr, status, error) {
                alert("서버 오류: " + error);
            }
        });
    }
</script>
<script>
    const modal = document.querySelector('.modal');
    const modal_body = document.querySelector('.modal_body');
    const form_container = document.querySelector('.form-container');
    const btnOpenPopup = document.querySelector('.btn');

    btnOpenPopup.addEventListener('click', () => {
        modal.style.display = 'block';
        form_container.style.display = 'block';
    });

    function closeModal() {
        var modal = document.querySelector(".modal");
        modal.style.display = "none"; // 모달을 숨기도록 설정
    }
    var closePopupButton = document.querySelector(".btn-close-popup");
    closePopupButton.addEventListener("click", closeModal);
</script>
</body>

</html>