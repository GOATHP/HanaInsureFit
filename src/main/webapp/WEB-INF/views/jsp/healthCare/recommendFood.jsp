<%--
  Created by IntelliJ IDEA.
  User: ajou
  Date: 2023-09-06
  Time: 오후 2:51
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>하나 InsureFit</title>
    <link href="resources/static/css/style.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ujw223eqz2"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=ujw223eqz2&submodules=geocoder"></script>
</head>
<script>
    <%
    String name = (String) session.getAttribute("name");
    String customerID = (String) session.getAttribute("customerID");
    %>
    var customerID = "<%=(String) session.getAttribute("customerID")%>";
    console.log(customerID);
</script>
<script>
    var restaurantArrayDesc;
    var restaurantArrayAsc;
    document.addEventListener("DOMContentLoaded", function () {
        var userConsumeCal;
        var weightManageArray = [];
        var customerID = "<%= (String) session.getAttribute("customerID") %>";
        var today = new Date(); // 현재 날짜와 시간을 가져옵니다.
        var year = today.getFullYear();
        var month = today.toLocaleDateString('en-US', { month: '2-digit' });
        var day = today.toLocaleDateString('en-US', { day: '2-digit' });

// 연도를 맨 앞에 두고 월과 일을 그대로 두기
//         var formattedDate = year.toString().slice(-2) + '/' + month + '/' + day;
        var formattedDate = '23/10/16';
        var recordDate;

        console.log("날짜" + formattedDate);

        function fetchDataAndUpdateChart() {
            $.ajax({
                url: 'getChartData', // 서버 엔드포인트를 지정
                method: 'POST', // 또는 'POST'에 따라 요청 방식 선택
                dataType: 'json', // 받아올 데이터 타입 (JSON 예상)
                data: {
                    'customerID': customerID
                },
                success: function (response) {
                    recordDate = response[response.length - 1].recorddate;
                    console.log("홈페이지 날짜" + formattedDate + "레코드 날짜" + recordDate);
                    if (formattedDate === recordDate) {
                        userConsumeCal = response[response.length - 1].total_calories; // 칼로리 데이터를 data 배열에 추가
                    } else {
                        userConsumeCal = 0;
                    }
                    sendAddressInfoToServer(customerID);
                    console.log("두번째 날짜" + recordDate);
                },
                error: function (error) {
                    console.error('데이터를 가져오는 중 오류 발생: ', error);
                }
            });
        }

        function sendAddressInfoToServer(customerID) {
            $.ajax({
                type: "POST",
                url: "/weightManage?customerID=" + customerID, // 'customerID'를 URL 파라미터로 보냄
                success: function (response) {
 // weightManageArray[0].recordDate를 날짜 객체로 변환합니다.;
                    console.log("Data received from server:", response);
                    weightManageArray.push(response);
                    var currentCaloriesElement = document.getElementById("currentCalories");

                    if (weightManageArray[0].calories)
                        if (weightManageArray[0].calories - userConsumeCal < 0) {
                        // 값이 음수인 경우, 스타일 변경
                        // weightManageArray[0].calories
                        var dailyRecommendedCalories = weightManageArray[0].calories;
                        var warningTextElement = document.getElementById('currentCalories');
                        var warningPercentageElement = document.getElementById("caloriesPercentage");
                        var warning = document.getElementById("warning");
                        warningTextElement.style.color = 'red'; // 글씨색을 빨간색으로 변경
                        warningPercentageElement.style.color = 'red'; // 글씨색을 빨간색으로 변경
                        warning.style.color ='red';
                        // 오늘의 메시지 추가
                        warningTextElement.textContent = weightManageArray[0].calories - userConsumeCal;
                        warningPercentageElement.textContent = ((userConsumeCal / dailyRecommendedCalories) * 100).toFixed(1) + '%';
                        warning.textContent = '오늘 칼로리를 모두 소비하셨습니다. 체중 감량을 위해서 내일 식사하시길 권장드립니다.';
                    } else {

                        console.log("현재 칼로리 엘리먼트" + weightManageArray[0].calories + " @@@@@@ " + userConsumeCal);
                        currentCaloriesElement.textContent = weightManageArray[0].calories - userConsumeCal;
                        var dailyRecommendedCalories = weightManageArray[0].calories;
                        var caloriesPercentageElement = document.getElementById("caloriesPercentage");
                        caloriesPercentageElement.textContent = ((userConsumeCal / dailyRecommendedCalories) * 100).toFixed(1) + '%';
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Request failed with status:", status, error);
                }
            });
        }
        fetchDataAndUpdateChart();
    });
</script>

<script>
    var long;
    var lati;
    var items;

    var options = {
        enableHighAccuracy: true,
        timeout: 5000,
        maximumAge: 0,
    };

    function success(pos) {
        var crd = pos.coords;
        lati = parseFloat(crd.latitude);
        long = parseFloat(crd.longitude);


        naver.maps.Service.reverseGeocode({
            location: new naver.maps.LatLng(lati, long),
        }, function(status, response) {
            if (status !== naver.maps.Service.Status.OK) {
                return alert('Something wrong!');
            }
            var result = response.result;
            items = result.items;
            var addressInfo = items[0].address; //여기가 주소 뽑아내는 곳
            var addressElement = document.getElementById("addressInfo");
            addressElement.textContent = addressInfo;
            console.log("addressElement" + addressElement.textContent.split(" ")[1]);
            var addressInfoGuDong = extractGuDongFromAddress(addressInfo);
            console.log(addressInfoGuDong.split(" ")[0]);
            // sendAddressInfoToServer(addressInfoGuDong.split(" ")[0]);
            sendAddressInfoToServer("광명시");
        });
    }

    function extractGuDongFromAddress(address) {
        var parts = address.split(' ');
        var gu = '';
        var dong = '';

        if (parts.length > 0) {
            gu = parts[1];
        }

        if (parts.length > 1) {
            dong = parts[2];
        }

        return gu + ' ' + dong;
    }

        function error(err) {
        console.warn(`ERROR(${err.code}): ${err.message}`);
    }

    navigator.geolocation.getCurrentPosition(success, error, options);
    naver.maps.Service.reverseGeocode({
        location: new naver.maps.LatLng(lati, long),
    }, function(status, response) {
        if (status !== naver.maps.Service.Status.OK) {
            return alert('Something wrong!');
        }
        console.log(response);
        var result = response.result, // 검색 결과의 컨테이너
            items = result.items; // 검색 결과의 배열

        // do Something
    });
</script>

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
                        <a href="Introduce.html">
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
                <a href="/weightManage" class="sideBarTab">
                    칼로리 관리
                </a>
                <a href="/recommendFood" class="sideBarTabClicked">
                    칼로리 맞춤 식당
                </a>
            </div>
        </div>
        <div id="main">
            <main>
                <div class="navInfo">Main &nbsp&nbsp> &nbsp&nbsp 건강관리&nbsp&nbsp > &nbsp&nbsp칼로리 맞춤 식당</div>
                <div class="calManageMoongoo">
                    <div style="
                    display: flex;
                    align-content: center;
                    width: 100%;
                    align-items: center;
                    justify-content: center;
                    margin-top: 20px;
                    ">
                        <div class="sideBarName" style="width: 300px; margin-bottom: 0px;">
                            칼로리 맞춤 식당
                        </div>
                    </div>
                    <div class="weightInfo1">
                        현재까지 섭취 칼로리를 고려해 근처 식당을 추천드립니다.<br>
                        현재 남은 칼로리 <div class="calories" id="currentCalories">0</div>kcal(<div class="calories" id="caloriesPercentage">0% </div>)
                        <br>
                        <div id="warning"></div>
                        <div class="myPosi">
                            현재 내 위치 : &nbsp;<span id="addressInfo"></span>
                        </div>
                    </div>
                </div>
                <br>

                <div class="custom-hr2">
                    <a id="ascKcal">칼로리 낮은순</a>
                    <a id="descKcal">칼로리 높은순</a>

                </div>
                <div class="image-row2" id="restaurantContainer">
                    <div id="warning2" style="font-size: 30px;text-align: center;color: rgba(60, 57, 57, 0.692);"> </div>
                </div>
                <button id="loadMoreBtn" style="font-size: 22px;">더보기</button>
                <script>
                    const initialItemsToShow = 3;
                    const itemsPerRow = 3;
                    var restaurantArray = [];
                    function sendAddressInfoToServer(addressInfoGudong) {
                        var xhr = new XMLHttpRequest();
                        xhr.open("POST", "/recommendFoodGuDong", true);
                        xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

                        var data = JSON.stringify(addressInfoGudong);
                        console.log(addressInfoGudong);
                        xhr.onreadystatechange = function () {
                            if (xhr.readyState === 4 && xhr.status === 200) {
                                // 서버로부터 응답을 받았을 때 처리할 로직
                                console.log("Data sent successfully!");
                                var response = JSON.parse(xhr.responseText);
                                console.log("Data received from server:", response);

                                const currentCaloriesElement = document.getElementById('currentCalories');
// currentCaloriesElement의 값을 가져오거나, 0으로 초기화합니다.
                                const calorieValue = currentCaloriesElement ? parseFloat(currentCaloriesElement.textContent) : 0;


                                for (var i = 0; i < response.length; i++) {
                                    if (calorieValue >= response[i].calories * 3){
                                    var restaurant = response[i];
                                    restaurantArray.push(restaurant);
                                    }
                                }
                                console.log(restaurantArray);

                                restaurantArrayDesc = mergeSort(restaurantArray).reverse();

                                restaurantArrayAsc = mergeSort(restaurantArray);

                                showItems(0, initialItemsToShow - 1);
                            }
                        };
                        xhr.send(data);
                    }
                    const container = document.getElementById("restaurantContainer");
                    const loadMoreBtn = document.getElementById("loadMoreBtn");
                    const ascKcal = document.getElementById("descKcal");
                    const descKcal = document.getElementById("ascKcal");
                    let visibleItems = initialItemsToShow;

                    function showItems(startIndex, endIndex) {
                        let currentRow;
                        const currentCaloriesElement = document.getElementById('currentCalories');
                        const calorieValue = currentCaloriesElement ? parseFloat(currentCaloriesElement.textContent) : 0;

                        if (calorieValue < 0) {
                            // 칼로리가 0 이하인 경우 메시지를 표시합니다.
                            const messageElement = document.getElementById("warning2");
                            messageElement.textContent = "오늘 하루 칼로리를 모두 소비하셨습니다. 내일의 식당 추천을 기대해주세요.";

                        } else {
                            for (let i = startIndex; i <= endIndex && i < restaurantArray.length; i++) {

                                if (i % itemsPerRow === 0) {
                                    currentRow = document.createElement("div");
                                    currentRow.className = "row-container"; // 새로운 레이아웃 컨테이너
                                    container.appendChild(currentRow);
                                }
                                let restaurant;
                                // console.log("칼로리 현재 칼로리 !@@@@@@@ " + calorieValue + restaurantArray[i].calories * 2.5 );
                                // if ( calorieValue >= (restaurantArray[i].calories * 2.5) ) {
                                //     restaurant = restaurantArray[i];
                                // } else {
                                //     continue;
                                // }
                                restaurant = restaurantArray[i];
                                const restaurantName = restaurant.name;
                                const address = restaurant.address; // This variable will hold the restaurant's address
                                const classification = restaurant.classification; // This variable will hold the restaurant's classification
                                const classification2 = restaurant.classification2; // This variable will hold the restaurant's secondary classification
                                const dishes = restaurant.dishes; // This variable will hold the restaurant's dishes
                                const homepage = restaurant.homepage; // This variable will hold the restaurant's homepage
                                const id = restaurant.id; // This variable will hold the restaurant's ID
                                const imgUrl = restaurant.imgUrl; // This variable will hold the restaurant's image URL
                                const liquorOrNot = restaurant.liquorOrNot; // This variable will hold whether the restaurant serves liquor
                                const location = restaurant.location; // This variable will hold the restaurant's location
                                const menu = restaurant.menu; // This variable will hold the restaurant's menu
                                const operationHours = restaurant.operationHours; // This variable will hold the restaurant's operating hours
                                const phone = restaurant.phone; // This variable will hold the restaurant's phone number
                                const phoneNumber = restaurant.phoneNumber; // This variable will hold the restaurant's phone number
                                const score = restaurant.score; // This variable will hold the restaurant's score
                                const stars = restaurant.stars; // This variable will hold the restaurant's star rating
                                const storeIntroduction = restaurant.storeIntroduction; // This variable will hold the restaurant's introduction
                                const takeOrNot = restaurant.takeOrNot; // This variable will hold whether the restaurant offers takeout
                                const views = restaurant.views;
                                const calValue = restaurant.calories;
                                const proteinValue = restaurant.protein;
                                const fatValue = restaurant.fat;
                                const carbsValue = restaurant.carbs;

                                const maxLength = 20; // 원하는 최대 길이 정의
                                let truncatedDishes = dishes; // 원래 문자열을 변수에 할당
                                if (!dishes || dishes.trim() === '') {
                                    // 만약 메뉴가 비어있거나 공백 문자열이라면
                                    truncatedDishes = "메뉴 정보 준비중입니다"; // "메뉴 정보 준비중입니다"로 설정
                                } else if (dishes.length > maxLength) {
                                    // 그렇지 않고 문자열 길이가 최대 길이보다 크다면
                                    truncatedDishes = dishes.substring(0, maxLength) + "..."; // 문자열을 자르고 "..."을 추가
                                }
                                console.log(restaurant.name);
                                const restaurantElement =
                                    '<a href="/foodInfo?name=' + restaurantName + '&prices=' + menu + '&image=' + imgUrl + '&menu=' + truncatedDishes + '">' +
                                    '<div class="image-column2">' +
                                    '<img src="' + imgUrl + '" width="254" height="206">' +
                                    '<br>' +
                                    '<div class="score">' + '★ ' + score + '</div>' +
                                    '<div class="imageWord3">' + restaurantName + '</div>' +
                                    '<div class="popMenu">인기메뉴</div>' +
                                    '<div class="menu">' + truncatedDishes + '</div>' +
                                    '<ul class="state_ul">' +
                                    '<li class="ico_st01">' +
                                    '<p>' + views + '</p>' +
                                    '</li>' +
                                    '<li class="ico_st02">' +
                                    '<p>' + stars + '</p>' +
                                    '</li>' +
                                    '<li class="ico_st03">' +
                                    '<p>' + phone + '</p>' +
                                    '</li>' +
                                    '</ul>' +
                                    '<table class = "calTable">' +
                                    '<tr>' +
                                    '<td class="calTitle">칼로리</td>' +
                                    '<td class="calValue">' + calValue * 3 + 'kcal</td>' +
                                    '</tr>' +
                                    '<tr>' +
                                    '<td class="calTitle">단백질</td>' +
                                    '<td class="proteinValue">' + proteinValue * 3+ 'g</td>' +
                                    '</tr>' +
                                    '<tr>' +
                                    '<td class="calTitle">탄수화물</td>' +
                                    '<td class="carbsValue">' +  carbsValue * 3 + 'g</td>' +
                                    '</tr>' +
                                    '<tr>' +
                                    '<td class="calTitle">지방</td>' +
                                    '<td class="fatValue">' + fatValue * 3+ 'g</td>' +
                                    '</tr>' +
                                    '</table>' +
                                    '<div class="warning">평균적인 값으로 식사량이 많아지면 더욱 많아질 수 있습니다. 적정량을 섭취해주세요.</div>' +
                                    '</div>'
                                '</a>';
                                const div = document.createElement("div");
                                const newRestaurant = document.createElement('div');
                                newRestaurant.innerHTML = restaurantElement;
                                currentRow.appendChild(newRestaurant);
                            }
                        }
                    }
                    loadMoreBtn.addEventListener("click", () => {
                        const newVisibleItems = visibleItems + initialItemsToShow;

                        if (newVisibleItems <= restaurantArray.length) {
                            showItems(visibleItems, newVisibleItems - 1);
                            visibleItems = newVisibleItems;

                            if (visibleItems >= restaurantArray.length) {
                                loadMoreBtn.style.display = "none";
                            }
                        }
                    });


                    ascKcal.addEventListener("click", ()=> {

                        const newVisibleItems = visibleItems + initialItemsToShow;
                        restaurantArray = restaurantArrayAsc;

                        while (container.firstChild) {
                            container.removeChild(container.firstChild);
                        }
                        showItems(0, Math.min(initialItemsToShow - 1, restaurantArray.length - 1));
                        // showItems(0, Math.min(initialItemsToShow - 1, restaurantArray.length - 1));
                        if (newVisibleItems <= restaurantArray.length) {
                            showItems(visibleItems, newVisibleItems - 1);
                            visibleItems = newVisibleItems;
                            if (visibleItems >= restaurantArray.length) {
                                ascKcal.style.display = "none";
                            }
                        }
                    });

                    descKcal.addEventListener("click", ()=> {
                        const newVisibleItems = visibleItems + initialItemsToShow;
                        restaurantArray = restaurantArrayDesc;
                        while (container.firstChild) {
                            container.removeChild(container.firstChild);
                        }
                        showItems(0, Math.min(initialItemsToShow - 1, restaurantArray.length - 1));
                        // showItems(0, Math.min(initialItemsToShow - 1, restaurantArray.length - 1));
                        if (newVisibleItems <= restaurantArray.length) {
                            showItems(visibleItems, newVisibleItems - 1);
                            visibleItems = newVisibleItems;
                            if (visibleItems >= restaurantArray.length) {
                                ascKcal.style.display = "none";
                            }
                        }
                    });
                    showItems(0, Math.min(initialItemsToShow - 1, restaurantArray.length - 1));
                </script>
                <!-- <div id="map" style="width:400px;height:400px;"></div> -->

                <!-- <script>
                    var mapOptions = {
                        center: new naver.maps.LatLng(37.3595704, 127.105399),
                        zoom: 10
                    };
                    var map = new naver.maps.Map('map', mapOptions);
                </script> -->
            </main>
        </div>
    </div>
</div>
    <footer style="
    display: flex;
    width: 100%;
    justify-content: center;
    background-color: #F9F9FB;
">
        <img src="resources/static/image/footer.png" style="
    width: 1400px;
">
    </footer>
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
</body>
<script>
    function mergeSort(arr) {
        if (arr.length <= 1) {
            return arr;
        }
        const middle = Math.floor(arr.length / 2);
        const left = arr.slice(0, middle);

        const right = arr.slice(middle);

        return merge(mergeSort(left), mergeSort(right));
    }
    function merge(left, right) {
        let result = [];
        let leftIndex = 0;
        let rightIndex = 0;

        while (leftIndex < left.length && rightIndex < right.length) {
            if (left[leftIndex].calories > right[rightIndex].calories) {
                result.push(left[leftIndex]);
                leftIndex++;
            } else {
                result.push(right[rightIndex]);
                rightIndex++;

            }
        }
        return result.concat(left.slice(leftIndex), right.slice(rightIndex));
    }
    // restaurantArrayDesc = mergeSort(restaurantArray).reverse();
    // restaurantArrayAsc = mergeSort(restaurantArray);
</script>
</html>