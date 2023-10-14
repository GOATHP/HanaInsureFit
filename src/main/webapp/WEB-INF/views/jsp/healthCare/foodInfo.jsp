<%--
  Created by IntelliJ IDEA.
  User: ajou
  Date: 2023-09-06
  Time: 오후 2:46
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
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ujw223eqz2"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=ujw223eqz2&submodules=geocoder"></script>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<script>
    var userConsumeCal;
    var restCal;
    // function fetchDataAndUpdateChart() {
    //     $.ajax({
    //         url: 'getChartData', // 서버 엔드포인트를 지정
    //         method: 'POST', // 또는 'POST'에 따라 요청 방식 선택
    //         dataType: 'json', // 받아올 데이터 타입 (JSON 예상)
    //         success: function(response) {
    //             userConsumeCal = response[0].total_calories; // 칼로리 데이터를 data 배열에 추가
    //         },
    //         error: function(error) {
    //             console.error('데이터를 가져오는 중 오류 발생: ', error);
    //         }
    //     });
    // }
    <%
    String name = (String) session.getAttribute("name");
    String customerID = (String) session.getAttribute("customerID");
    %>
    var customerID = "<%=(String) session.getAttribute("customerID")%>";

</script>
<style>
    input[type="checkbox"]:checked {
        background-color: #00857E; /* 원하는 배경색으로 변경 */
    }
</style>
<script>
    // document.addEventListener("DOMContentLoaded", function () {
    //     var userConsumeCal;
    //     var weightManageArray = [];
    //
    //     console.log(customerID);
    //     function fetchDataAndUpdateChart() {
    //         $.ajax({
    //             url: 'getChartData', // 서버 엔드포인트를 지정
    //             method: 'POST', // 또는 'POST'에 따라 요청 방식 선택
    //             dataType: 'json', // 받아올 데이터 타입 (JSON 예상)
    //             data: {
    //                 'customerID' : customerID
    //             },
    //             success: function (response) {
    //                 console.log(response);
    //                 // userConsumeCal = response[response.length - 1].total_calories; // 칼로리 데이터를 data 배열에 추가
    //                 userConsumeCal = response[0].total_calories; // 칼로리 데이터를 data 배열에 추가
    //                 sendAddressInfoToServer(customerID);
    //             },
    //             error: function (error) {
    //                 console.error('데이터를 가져오는 중 오류 발생: ', error);
    //             }
    //         });
    //     }
    document.addEventListener("DOMContentLoaded", function () {
        var userConsumeCal;
        var weightManageArray = [];
        var customerID = "<%= (String) session.getAttribute("customerID") %>";
        var today = new Date(); // 현재 날짜와 시간을 가져옵니다.
        var year = today.getFullYear();
        var month = today.toLocaleDateString('en-US', { month: '2-digit' });
        var day = today.toLocaleDateString('en-US', { day: '2-digit' });

// 연도를 맨 앞에 두고 월과 일을 그대로 두기
        var formattedDate = year.toString().slice(-2) + '/' + month + '/' + day;
        var recordDate;


        function fetchDataAndUpdateChart() {
            $.ajax({
                url: 'getChartData', // 서버 엔드포인트를 지정
                method: 'POST', // 또는 'POST'에 따라 요청 방식 선택
                dataType: 'json', // 받아올 데이터 타입 (JSON 예상)
                data: {
                    'customerID': customerID
                },
                success: function (response) {
                    recordDate = response[0].recorddate;
                    if (formattedDate === recordDate) {
                        userConsumeCal = response[0].total_calories; // 칼로리 데이터를 data 배열에 추가
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
        // fetchDataAndUpdateChart 함수 호출
        fetchDataAndUpdateChart();
    });

</script>

<%--<script>--%>
<%--    var weightManageArray = [];--%>

<%--    // function sendAddressInfoToServer(customerID) {--%>
<%--    $(document).ready(function () {--%>
<%--        fetchDataAndUpdateChart();--%>
<%--        $.ajax({--%>
<%--            type: "POST",--%>
<%--            url: "/weightManage?customerID=" + customerID, // 'customerID'를 URL 파라미터로 보냄--%>
<%--            success: function (response) {--%>
<%--                console.log("Data received from server:", response);--%>
<%--                weightManageArray.push(response);--%>
<%--                var currentCaloriesElement = document.getElementById("currentCalories");--%>
<%--                console.log("유저콘슘칼" + userConsumeCal);--%>
<%--                currentCaloriesElement.textContent = weightManageArray[0].calories - userConsumeCal;--%>
<%--                dailyRecommendedCalories = weightManageArray[0].calories;--%>
<%--                restCal = dailyRecommendedCalories - userConsumeCal;--%>
<%--                var caloriesPercentageElement = document.getElementById("caloriesPercentage");--%>
<%--                caloriesPercentageElement.textContent = ( ( userConsumeCal  / dailyRecommendedCalories) * 100 ).toFixed(1) + '%';--%>

<%--            },--%>
<%--            error: function (xhr, status, error) {--%>
<%--                console.error("Request failed with status:", status, error);--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>
<%--    document.addEventListener("DOMContentLoaded", function () {--%>
<%--        // 페이지가 로드될 때 실행할 코드--%>
<%--        // sendAddressInfoToServer 함수 호출--%>
<%--        sendAddressInfoToServer(customerID);--%>
<%--    });--%>

<%--</script>--%>


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
            <div class="navInfo">Main &nbsp&nbsp> &nbsp&nbsp건강관리&nbsp&nbsp > &nbsp&nbsp칼로리 맞춤 식당</div>
            <div class="calManageMoongoo">식당 정보<br>
                <div class="weightInfo1">
                    현재 남은 칼로리 <div class="calories" id="currentCalories">0</div>kcal(<div class="calories"
                                                                                          id="caloriesPercentage">0% </div>)
                    <br>
                    <div class="myPosi">
                        현재 내 위치 : &nbsp;<span id="addressInfo"></span>
                    </div>
                </div>
            </div>
            <div class="concontainer">
                <div class="row-container">
                    <div class="image-column3">
                        <div class="restaurant-details">
                            <h1 id="restaurant-name">식당 이름</h1>
                            <table class="insuTable" id="info-table">
                                <tr>
                                    <th>영업시간</th>
                                    <td>매일 00:00 ~ 00:00 OPEN</td>
                                </tr>
                                <tr>
                                    <th>주차</th>
                                    <td>주차, 발렛</td>
                                </tr>
                                <tr>
                                    <th>메뉴</th>
                                    <td>
                                        <div id="menuTableBody">
                                    <!-- 여기에 메뉴와 가격이 동적으로 추가될 것입니다. -->

                                        </div>
                                        <div class="foodAddClass" style="
                                            display: flex;
                                            width: 100%;
                                            align-items: center;
                                            justify-content: center;
                                        ">
                                        <button id="logSelectedMenusButton" class="logSelectedMenusButton" style="
                                                margin-top: 10px;
                                                width: 100px;
                                                border-radius: 5px;
                                                ">식단 추가</button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <div>
                                        <th>주소</th>
                                        <td id="restaurantAddress">
                                            서울특별시 강남구 도산대로101길 6<br><br>
                                            지번 서울특별시 강남구 청담동 129-10
                                        </td>
                                    </div>
                                </tr>
                                <tr>
                                    <th>전화번호</th>
                                    <td>02-546-5739</td>
                                </tr>
                                <tr>
                                    <th>영양성분 평균</th>
                                    <td id="restaurantCalories"></td>
                                </tr>

                            </table>
                        </div>
                    </div>
                    <div class="mapContainer" style="
    display: flex;
    flex-direction: column;
    align-items: center;
">
                        <div id="map"></div>
                        <button style="
                                                margin-top: 10px;
                                                width: 100px;
                                                border-radius: 5px;
                                                ">
                            <a id="findRoad" >길찾기</a>
                        </button>
                    </div>
                </div>
                <div class="container">

                    <div class="modal">
                        <div class="modal_body2" style="width:700px;">
                            <div class="closeDiv">
                                <button class="btn-close-popup"
                                        style="width: 22px;height: 22px;font-size: 14px;">X</button>
                            </div>
                            <div class="form-container" style="margin-top: 15px;display: block;width: 600px;">
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
                                            <div class="foodAdd2" style="width: 450px;">
                                                <div class="foodInfo2" id="foodInfo2">
                                                </div>

                                            </div>
                                                <div class="foodColName">
                                        </td>
                                    </tr>
<%--                                    <tr>--%>
<%--                                    <th>--%>
<%--                                        <label for="weightInput">중량 (g):</label>--%>
<%--                                    </th>--%>
<%--                            </div>--%>
<%--                            <td>--%>
<%--                                <input type="number" id="weightInput" name="weightInput" placeholder="중량을 입력하세요">--%>
<%--                            </td>--%>
<%--                            </tr>--%>
                        </div>
                    </div>
                    </table>
                    <div class="addBtn">
                        <button id="addMeal" style="width: 100px;border-radius: 5px;">등록</button>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

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
        var combinedString
        var menus;
        var prices;

        var kcal;
        var protein;
        var carbs;
        var fat;

        var address;
        var restaurantCalories;
        var latiRestaurant;
        var longRestaurant;
        var dishes;
        function getRestaurantInfo(restaurantName) {
            $.ajax({
                url: '/getRestaurant', // 컨트롤러 엔드포인트 URL
                method: 'POST', // 또는 'GET' 또는 다른 HTTP 메서드를 사용할 수 있습니다.
                contentType: 'text/plain', // 데이터 타입을 일반 텍스트로 설정
                data: restaurantName, // 데이터를 POST 요청 본문에 직접 넣음
                dataType: 'json', // 서버에서 받을 데이터 타입 (JSON 예상)
                success: function (response) {
                    // 성공적인 응답 처리
                    console.log('서버에서 받은 데이터:', response);
                    console.log(response.restaurant)
                    dishes = response.restaurant.dishes;

                    if (response.restaurant.dishes ===null) {
                        menus = ['메뉴 정보 준비중입니다.'];
                        prices = '';
                    } else {
                        menus = response.restaurant.dishes.split(', ');
                        if (response.restaurant.menu !== null) {
                            prices = response.restaurant.menu.split(', ');
                        } else {
                            prices ='';
                        }
                    }
                    kcal = response.menuIngre;
                    address = response.restaurant.address.substring(2);
                    restaurantCalories = response.restaurantInfo;
                    var pattern = /(\D+)(\d+)-(\d+)/; // 동 이름과 동 뒤의 숫자를 추출하기 위한 정규 표현식
                    console.log(address + "시작전 어드레스 함 찍는다.");
                    var match = address.match(pattern); // 정규 표현식과 주소 문자열을 비교
                        if (match) {
                            var dongName = match[1].trim(); // 동 이름 (trim 함수로 공백 제거)
                        var dongNumber = match[2]; // 동 뒤의 숫자
                        console.log("동 이름: " + dongName);
                        console.log("동 뒤의 숫자: " + dongNumber);
                        combinedString = dongName + " " + dongNumber; // 두 문자열을 합침
                        console.log("결합된 문자열: " + combinedString);
                        if (combinedString.startsWith("서울특별시")) {
                            combinedString = combinedString.replace("서울특별시", "서울");
                        }
                    } else {
                        console.log("동 이름과 동 뒤의 숫자를 찾을 수 없음");
                    }
                    console.log(combinedString);
                    naver.maps.Service.geocode({
                        query: combinedString
                    }, function (status, response) {
                        if (status !== naver.maps.Service.Status.OK) {
                            return alert('Something wrong!');
                        }
                        var result = response.v2, // 검색 결과의 컨테이너
                            itemss = result.addresses; // 검색 결과의 배열
                        console.log("주소!!!!!!!" + result.addresses[0].y);
                        latiRestaurant = result.addresses[0].y;
                        console.log(latiRestaurant);
                        longRestaurant = result.addresses[0].x;
                        console.log(longRestaurant);
                        loadScripts();
                        const restaurantNameElement = document.getElementById('restaurant-name');
                        restaurantNameElement.textContent = restaurantName;
                        var restaurantAddress = document.getElementById("restaurantAddress");
                        restaurantAddress.innerHTML = address;
                        var restaurantContent = document.getElementById("restaurantCalories");
                        restaurantContent.innerHTML = restaurantCalories + "Kcal";
                        var menuTableBody = document.getElementById("menuTableBody");
                        // 메뉴와 가격을 동적으로 추가합니다.

                        for (var i = 0; i < menus.length; i++) {

                            var menuRow = document.createElement("tr");
                            var checkboxCell = document.createElement("td");
                            var checkboxInput = document.createElement("input");
                            checkboxInput.type = "checkbox";
                            checkboxInput.name = "selectedMenus"; // 다중 선택을 위해 같은 이름을 사용합니다.
                            checkboxInput.value = menus[i];

                            checkboxCell.appendChild(checkboxInput);
                            menuRow.appendChild(checkboxCell);

                            // 메뉴 셀 (td) 생성 및 추가
                            var menuCell = document.createElement("th");
                            if (menus[i] !=='메뉴 정보 준비중입니다.') {
                                menuCell.classList.add("menuCell");
                                menuCell.textContent = menus[i];
                            } else {
                                menuCell.classList.add("menuReadyCell");
                                menuCell.textContent = menus[i];
                            }
                            menuRow.appendChild(menuCell);
                            // 가격 셀 (td) 생성 및 추가
                            var priceCell = document.createElement("td");
                            priceCell.classList.add("priceCell");
                            if (menus[i] !=='메뉴 정보 준비중입니다.') {
                                priceCell.textContent = prices[i];
                                menuRow.appendChild(priceCell);
                            }
                            var kcalCell = document.createElement("td");
                            kcalCell.classList.add("kcal-cell");
                            if (menus[i] !=='메뉴 정보 준비중입니다.') {
                                if (kcal[menus[i]].calories === 0) {
                                    kcalCell.textContent = "메뉴 정보가 없습니다."
                                } else {
                                    kcalCell.textContent = "칼로리: " + kcal[menus[i]].calories * 3 + "kcal";
                                    kcalCell.textContent += " 탄수화물:" + kcal[menus[i]].carbs * 3 + "g";
                                    kcalCell.textContent += " 단백질:" + kcal[menus[i]].protein * 3 + "g";
                                    kcalCell.textContent += " 지방:" + kcal[menus[i]].fat * 3 + "g";
                                    }
                                menuRow.appendChild(kcalCell);
                            }
                            menuTableBody.appendChild(menuRow);
                        }
                        var restauCalories = document.getElementById("restaurantCalories");
                        restauCalories.textContent = "칼로리: " + restaurantCalories.calories * 3 + "kcal";
                        restauCalories.textContent += " 탄수화물:" + restaurantCalories.carbs * 3 + "g";
                        restauCalories.textContent += " 단백질:" + restaurantCalories.protein * 3 + "g";
                        restauCalories.textContent += " 지방:" + restaurantCalories.fat * 3 + "g";
                    });

                    },
                error: function (xhr, status, error) {
                    // 오류 응답 처리
                    console.error('오류 발생:', status, error);
                }

            });
        }

    const urlParams = new URLSearchParams(window.location.search);
    const restaurantName = urlParams.get('name');


        getRestaurantInfo(restaurantName);
        console.log("위도 확인 @@@@@@@@@@@@@@@@:" +     latiRestaurant);
        var long;
        var lati;
        var addressInfo;

        var options = {
            enableHighAccuracy: true,
            timeout: 5000,
            maximumAge: 0,
        };


        function loadScripts(){
            function success(pos) {

                var crd = pos.coords;
                var lati = parseFloat(crd.latitude);
                var long = parseFloat(crd.longitude);

                console.log("Your current position is:");
                console.log(`Latitude : ${crd.latitude}`);
                console.log(`Longitude: ${crd.longitude}`);
                console.log(`More or less ${crd.accuracy} meters.`);

                naver.maps.Service.reverseGeocode({
                    location: new naver.maps.LatLng(lati, long),
                }, function(status, response) {
                    if (status !== naver.maps.Service.Status.OK) {
                        return alert('Something wrong!');
                    }
                    var result = response.result;
                    items = result.items;
                    addressInfo = items[0].address; //여기가 주소 뽑아내는 곳
                    var addressElement = document.getElementById("addressInfo");
                    addressElement.textContent = addressInfo;
                    console.log("addressElement" + addressElement);
                    // 이후 주소 정보를 처리하는 로직을 추가할 수 있습니다.
                    var url = "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=%2C%2C523953%2C1084098&rt1=" + addressInfo + "&rt2=" + combinedString;
                    console.log(url);
                    document.getElementById("findRoad").href = url;
                });

                var mapOptions = {
                    center: new naver.maps.LatLng(lati, long),
                    zoom: 10 // 확대 수준 조정
                };
                var map = new naver.maps.Map('map', mapOptions);
                var markerOptions = {
                    position: new naver.maps.LatLng(lati, long),
                    map: map,
                    icon: {
                        url: "resources/static/image/marker_blue2.png",
                        size: new naver.maps.Size(100, 100),
                        origin: new naver.maps.Point(0, 0),
                        anchor: new naver.maps.Point(25, 26)
                    }
                };
                var marker = new naver.maps.Marker(markerOptions);
                console.log("위도확인@@@@" + latiRestaurant);
                var restaurantMarker = {
                    position: new naver.maps.LatLng(latiRestaurant, longRestaurant),
                    map : map,
                    icon: {
                        url: "resources/static/image/marker_pink2.png",
                        size: new naver.maps.Size(100, 100),
                        origin: new naver.maps.Point(0, 0),
                        anchor: new naver.maps.Point(25, 26)
                    }
                };
                new naver.maps.Marker(restaurantMarker);

                naver.maps.Event.addListener(map, 'click', function (e) {
                    marker.setPosition(e.latlng);
                });
            }
            function error(err) {
                console.warn(`ERROR(${err.code}): ${err.message}`);
            }
            navigator.geolocation.getCurrentPosition(success, error, options);
            }
</script>
<script>
    const modal = document.querySelector('.modal');
    const modal_body = document.querySelector('.modal_body2');
    const form_container = document.querySelector('.form-container');
    const btnOpenPopup = document.querySelector('.logSelectedMenusButton');

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
<script>
    var selectedFoodData = {};
    function getSelectedCheckboxes() {
    var selectedCheckboxes = document.querySelectorAll('input[name="selectedMenus"]:checked');
    console.log("셀렉티드 박시스 " + selectedCheckboxes);
    return selectedCheckboxes;
    }

    function logSelectedMenus() {
        var selectedCheckboxes = getSelectedCheckboxes();

        var foodInfo = document.getElementById("foodInfo2");
        foodInfo.innerHTML = ""; // 기존 내용 초기화

        var table = document.createElement("table");
        table.classList.add("foodInfo3");
        table.id = "foodInfo3";
        table.border = "1";
        table.style.borderCollapse = "collapse";
        var headerRow = document.createElement("tr");
        // var header0 = document.createElement("th");
        // header0.textContent = "";
        var header1 = document.createElement("th");
        header1.textContent = "메뉴명";
        var header2 = document.createElement("th");
        header2.textContent = "칼로리";
        var header3 = document.createElement("th");
        header3.textContent = "탄수화물";
        var header4 = document.createElement("th");
        header4.textContent = "단백질";
        var header5 = document.createElement("th");
        header5.textContent = "지방";
        var header6 = document.createElement("th");
        header6.textContent = "총량";
        // headerRow.appendChild(header0);
        headerRow.appendChild(header1);
        headerRow.appendChild(header2);
        headerRow.appendChild(header3);
        headerRow.appendChild(header4);
        headerRow.appendChild(header5);
        headerRow.appendChild(header6);

        table.appendChild(headerRow);
        if (selectedCheckboxes.length > 0) {
            console.log("선택한 메뉴:");

            // 선택한 각 체크박스의 값을 출력하고 테이블에 행을 추가
            selectedCheckboxes.forEach(function (checkbox) {
                console.log(checkbox.value);
                console.log(kcal[checkbox.value].calories);
                var checkboxValue = checkbox.value;
                var foodData = kcal[checkboxValue];
                var dataRow = document.createElement("tr");

                var cell1 = document.createElement("td");
                cell1.textContent = checkboxValue;
                var cell2 = document.createElement("td");
                cell2.textContent = foodData.calories;
                var cell3 = document.createElement("td");
                cell3.textContent = foodData.carbs;
                var cell4 = document.createElement("td");
                cell4.textContent = foodData.protein;
                var cell5 = document.createElement("td");
                cell5.textContent = foodData.fat;
                var cell6 = document.createElement("td");
                var inputElement = document.createElement("input");
                inputElement.classList.add("amountInput");
                cell6.appendChild(inputElement);

                // var checkboxCell = document.createElement("td");
                // var checkboxInput = document.createElement("input");
                // checkboxInput.type = "checkbox";
                // checkboxInput.name = "selectedMenus"; // 다중 선택을 위해 같은 이름을 사용합니다.
                // checkboxCell.appendChild(checkboxInput);


                // dataRow.appendChild(checkboxCell);
                dataRow.appendChild(cell1);
                dataRow.appendChild(cell2);
                dataRow.appendChild(cell3);
                dataRow.appendChild(cell4);
                dataRow.appendChild(cell5);
                dataRow.appendChild(cell6);

                table.appendChild(dataRow);

                selectedFoodData[checkboxValue] = {
                    Name: checkboxValue,
                    Calories: foodData.calories,
                    Carbs: foodData.carbs,
                    Protein: foodData.protein,
                    Fat: foodData.fat
                };
            });

            // // 테이블을 foodInfo에 추가합니다.
            foodInfo.appendChild(table);
            // });
        } else {
            console.log("선택한 메뉴가 없습니다.");
        }
    }
    // "선택한 메뉴 출력" 버튼을 클릭하면 체크된 메뉴를 콘솔에 출력
    var logButton = document.getElementById("logSelectedMenusButton");
    logButton.addEventListener("click", logSelectedMenus);
</script>
    <script>
        var addMealButton = document.getElementById("addMeal");
        var radioButtons = document.querySelectorAll('input[name="mealType"]');

        // 클릭된 값을 저장할 배열을 생성합니다.
        selectedValues = [];
        var data = [];
        addMealButton.addEventListener('click', function () {
            radioButtons.forEach(function (radioButton, index) {
                if (radioButton.checked) {
                    selectedValues.push(index);
                }
            });

            // 테이블 요소를 선택합니다.
            var table = document.getElementById("foodInfo3");

            // 첫 번째 행은 헤더이므로 무시하고 나머지 행들을 가져옵니다.
            var rows = table.querySelectorAll("tr");
            // 헤더 셀의 텍스트를 가져옵니다.
            var headerCells = rows[0].querySelectorAll("th");
            var headers = [];
            headerCells.forEach(function (cell) {
                headers.push(cell.textContent);
            });

            // 나머지 행들을 순회하며 데이터를 추출합니다.
            for (var i = 1; i < rows.length; i++) {
                var row = rows[i];
                var cells = row.querySelectorAll("td");
                var rowData = {};
                // 각 셀의 데이터를 가져와서 객체에 추가합니다.
                for (var j = 0; j < cells.length; j++) {
                    var cell = cells[j];
                    // if (j === 0) {
                    // headers[j] = "mealCode";
                    // var header = headers[j];
                    // rowData[header] = selectedValues[0];
                    // } else {
                    var header = headers[j];
                    rowData[header] = cell.textContent;
                    // }
                    // 총량(input) 값을 가져와 추가합니다.
                    if (header === "총량") {
                        var inputElement = cell.querySelector("input.amountInput");
                        if (inputElement) {
                            rowData[header] = inputElement.value;
                        }
                    }
                    rowData["customerID"] = customerID;
                    rowData["mealCode"] = selectedValues[0];
                }
                data.push(rowData);

            }
            // 선택된 라디오 버튼의 값을 추가합니다.
            console.log("테이블 데이터: ", data);
            data.forEach(function (item) {
                item.foodname = item.메뉴명;
                delete item.메뉴명;

                item.calories = item.칼로리;
                delete item.칼로리;

                item.carbs = item.탄수화물;
                delete item.탄수화물;

                item.protein = item.단백질;
                delete item.단백질;

                item.fat = item.지방;
                delete item.지방;

                item.amountPerOnce = item.총량;
                delete item.총량;
                if (item.amountPerOnce !== undefined) {
                    if (item.calories !== undefined) {
                        item.calories = item.calories *  (item.amountPerOnce / 100);
                    }

                    if (item.carbs !== undefined) {
                        item.carbs = item.carbs * (item.amountPerOnce/100);
                    }

                    if (item.protein !== undefined) {
                        item.protein = item.protein * (item.amountPerOnce/100);
                    }

                    if (item.fat !== undefined) {
                        item.fat = item.fat * (item.amountPerOnce/100);
                    }
                }
            });
        $.ajax({
            type: "POST", // HTTP 요청 메서드 (POST로 설정)
            url: "/insertSelectedMenu", // 요청을 보낼 서버 엔드포인트 URL을 수정해야 합니다.
            data: JSON.stringify(data),
            contentType: 'application/json', // 요청 데이터의 컨텐츠 타입 설정
            dataType: 'json', // 서버에서의 응답 데이터 타입 (JSON으로 예상)
            error: function (xhr, status, error) {
                alert("식사 등록이 완료되었습니다.");
            },
            success: function (response) {
                console.log(response);
                }
            });
        });
    </script>


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
</body>
</html>