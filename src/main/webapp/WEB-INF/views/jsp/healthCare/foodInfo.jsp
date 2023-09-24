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
    function fetchDataAndUpdateChart() {
        $.ajax({
            url: 'getChartData', // 서버 엔드포인트를 지정
            method: 'POST', // 또는 'POST'에 따라 요청 방식 선택
            dataType: 'json', // 받아올 데이터 타입 (JSON 예상)
            success: function(response) {
                userConsumeCal = response[0].total_calories; // 칼로리 데이터를 data 배열에 추가
            },
            error: function(error) {
                console.error('데이터를 가져오는 중 오류 발생: ', error);
            }
        });
    }
</script>
<script>
    <%
    String name = (String) session.getAttribute("name");
    String customerID = (String) session.getAttribute("customerID");
    %>
    var customerID = "<%=(String) session.getAttribute("customerID")%>";
    console.log(customerID);
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var userConsumeCal;
        var weightManageArray = [];
        var customerID = "<%= (String) session.getAttribute("customerID") %>";

        function fetchDataAndUpdateChart() {
            $.ajax({
                url: 'getChartData', // 서버 엔드포인트를 지정
                method: 'POST', // 또는 'POST'에 따라 요청 방식 선택
                dataType: 'json', // 받아올 데이터 타입 (JSON 예상)
                success: function (response) {

                    console.log(response);
                    // userConsumeCal = response[response.length - 1].total_calories; // 칼로리 데이터를 data 배열에 추가
                    userConsumeCal = response[0].total_calories; // 칼로리 데이터를 data 배열에 추가

                    sendAddressInfoToServer(customerID);
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
                    console.log("Data received from server:", response);
                    weightManageArray.push(response);
                    var currentCaloriesElement = document.getElementById("currentCalories");
                    currentCaloriesElement.textContent = weightManageArray[0].calories - userConsumeCal;
                    var dailyRecommendedCalories = weightManageArray[0].calories;
                    var caloriesPercentageElement = document.getElementById("caloriesPercentage");
                    caloriesPercentageElement.textContent = ((userConsumeCal / dailyRecommendedCalories) * 100).toFixed(1) + '%';
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
                    <li><a href="/myPage">마이페이지</a></li>
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
            <div class="navInfo">Main &nbsp&nbsp> &nbsp&nbsp건강관리&nbsp&nbsp > &nbsp&nbsp칼로리 맞춤 정보</div>
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
                            <table class="info-table" id="info-table">
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
                                    <th>예상칼로리</th>
                                    <td id="restaurantCalories"></td>
                                </tr>

                            </table>
                        </div>
                    </div>

                    <div id="map"></div>
                    <a id="findRoad">길찾기</a>
                </div>
            </div>
    </div>

    </main>
</div>

<footer id="footer">
    <div>Contact us | 개인정보처리방침 | 고객정보취급방침 | 건강한 소리(부정제보) | 인천 서구 에코로 167 하나금융그룹 통합데이터센터 비전센터 5층 | Copyright ©
        Hana TI 2019. ALL RIGHT RESERVE</div>
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

<script> //나중에 여기에다가 위경도 데이터프레임으로 넣어주면 됨

    <%--var long;--%>
    <%--var lati;--%>
    <%--var addressInfo;--%>

    <%--var options = {--%>
    <%--    enableHighAccuracy: true,--%>
    <%--    timeout: 5000,--%>
    <%--    maximumAge: 0,--%>
    <%--};--%>
    <%--function loadScripts(){--%>
    <%--    function success(pos) {--%>
    <%--        console.log("위도 찍기" + latiRestaurant);--%>
    <%--        var crd = pos.coords;--%>
    <%--        var lati = parseFloat(crd.latitude);--%>
    <%--        var long = parseFloat(crd.longitude);--%>

    <%--        console.log("Your current position is:");--%>
    <%--        console.log(`Latitude : ${crd.latitude}`);--%>
    <%--        console.log(`Longitude: ${crd.longitude}`);--%>
    <%--        console.log(`More or less ${crd.accuracy} meters.`);--%>

    <%--        naver.maps.Service.reverseGeocode({--%>
    <%--            location: new naver.maps.LatLng(lati, long),--%>
    <%--        }, function(status, response) {--%>
    <%--            if (status !== naver.maps.Service.Status.OK) {--%>
    <%--                return alert('Something wrong!');--%>
    <%--            }--%>
    <%--            var result = response.result;--%>
    <%--            items = result.items;--%>
    <%--            addressInfo = items[0].address; //여기가 주소 뽑아내는 곳--%>
    <%--            var addressElement = document.getElementById("addressInfo");--%>
    <%--            addressElement.textContent = addressInfo;--%>
    <%--            console.log("addressElement" + addressElement);--%>
    <%--            // 이후 주소 정보를 처리하는 로직을 추가할 수 있습니다.--%>
    <%--            var url = "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=%2C%2C523953%2C1084098&rt1=" + addressInfo + "&rt2=" + combinedString;--%>
    <%--            console.log(url);--%>
    <%--            document.getElementById("findRoad").href = url;--%>
    <%--        });--%>

    <%--        var mapOptions = {--%>
    <%--            center: new naver.maps.LatLng(lati, long),--%>
    <%--            zoom: 10 // 확대 수준 조정--%>
    <%--        };--%>
    <%--        var map = new naver.maps.Map('map', mapOptions);--%>
    <%--        var markerOptions = {--%>
    <%--            position: new naver.maps.LatLng(lati, long),--%>
    <%--            map: map,--%>
    <%--            icon: {--%>
    <%--                url: "resources/static/image/marker2.png",--%>
    <%--                size: new naver.maps.Size(100, 100),--%>
    <%--                origin: new naver.maps.Point(0, 0),--%>
    <%--                anchor: new naver.maps.Point(25, 26)--%>
    <%--            }--%>
    <%--        };--%>
    <%--        var marker = new naver.maps.Marker(markerOptions);--%>

    <%--        var restaurantMarker = {--%>
    <%--            position: new naver.maps.LatLng(latiRestaurant, longRestaurant),--%>
    <%--            map : map,--%>
    <%--            icon: {--%>
    <%--                url: "resources/static/image/marker2.png",--%>
    <%--                size: new naver.maps.Size(100, 100),--%>
    <%--                origin: new naver.maps.Point(0, 0),--%>
    <%--                anchor: new naver.maps.Point(25, 26)--%>
    <%--            }--%>
    <%--        };--%>
    <%--        new naver.maps.Marker(restaurantMarker);--%>

    <%--            naver.maps.Event.addListener(map, 'click', function (e) {--%>
    <%--                marker.setPosition(e.latlng);--%>
    <%--            });--%>
    <%--        }--%>
    <%--        function error(err) {--%>
    <%--            console.warn(`ERROR(${err.code}): ${err.message}`);--%>
    <%--        }--%>
    <%--        navigator.geolocation.getCurrentPosition(success, error, options);--%>
    <%--    }--%>
</script>

<script>

    document.addEventListener("DOMContentLoaded", function () {
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
                console.log("위도 찍기" + latiRestaurant);
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
                        url: "resources/static/image/marker2.png",
                        size: new naver.maps.Size(100, 100),
                        origin: new naver.maps.Point(0, 0),
                        anchor: new naver.maps.Point(25, 26)
                    }
                };
                var marker = new naver.maps.Marker(markerOptions);

                var restaurantMarker = {
                    position: new naver.maps.LatLng(latiRestaurant, longRestaurant),
                    map : map,
                    icon: {
                        url: "resources/static/image/marker2.png",
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
        var latiRestaurant;
        var longRestaurant;
        var combinedString
        var menus;
        var prices;
        var address;
        var restaurantCalories;

        const urlParams = new URLSearchParams(window.location.search);
        const restaurantName = urlParams.get('name');
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
                    if (response.restaurant.dishes ===null) {
                        menus = ['정보가 없습니다.'];
                        prices = '';
                    } else {
                        menus = response.restaurant.dishes.split(', ');
                        prices = response.restaurant.menu.split(', ');
                    }
                    address = response.restaurant.address.substring(2);
                    restaurantCalories = response.calories;
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

                            // 메뉴 셀 (td) 생성 및 추가
                            var menuCell = document.createElement("td");
                            menuCell.textContent = menus[i];
                            menuRow.appendChild(menuCell);

                            // 가격 셀 (td) 생성 및 추가
                            var priceCell = document.createElement("td");
                            priceCell.textContent = prices[i];
                            menuRow.appendChild(priceCell);

                            // 테이블에 행 추가
                            menuTableBody.appendChild(menuRow);
                        }
                    });
                    loadScripts();
                    },
                error: function (xhr, status, error) {
                    // 오류 응답 처리
                    console.error('오류 발생:', status, error);
                }
            });
        }
        getRestaurantInfo(restaurantName);
    });


</script>

</body>
</html>