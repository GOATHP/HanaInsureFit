<%--
  Created by IntelliJ IDEA.
  User: ajou
  Date: 2023-09-06
  Time: 오후 2:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>하나 InsureFit</title>
    <link href="resources/static/css/style.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ujw223eqz2"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=ujw223eqz2&submodules=geocoder"></script>

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
                    String name = (String) session.getAttribute("name");
                    String customerID = (String) session.getAttribute("customerID");
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
                    <a href="main.html">
                        <img src="resources/static/image/플젝로고.png" alt="프로젝트 로고">
                    </a>
                </div>
                <ul>
                    <li><a href="/introduce">하나Insure Fit이란?</a></li>
                    <li><a href="/recommendInsu">건강등급보험추천</a></li>
                    <li><a href="/weightManage">내 건강관리</a></li>
                    <li><a href="/recommendFood" class="clicked">식당추천</a></li>
                    <li><a href="/discount">보험할인액 조회</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<div class="mainSideContainer">
    <div class="sideBar">
        <div class="sideBarName">
            식당추천
        </div>
        <div class="sideBarContents">
            <a href="/recommendFood" class="sideBarTab">
                식당목록
            </a>
            <a href="/foodInfo" class="sideBarTabClicked">
                식당정보
            </a>
        </div>
    </div>
    <div id="main">
        <main>
            <div class="navInfo">Main &nbsp&nbsp> &nbsp&nbsp식당 목록&nbsp&nbsp > &nbsp&nbsp식당 정보</div>
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
                            <table class="info-table">
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
                                        <ul>
                                            <li>꽃등심(150g) - 64,000 원 (300kcal)</li>
                                            <li>양념갈비(260g) - 64,000 원 (600kcal)</li>
                                            <li>생고기(150g) - 64,000 원 (300kcal)</li>
                                            <!-- 나머지 메뉴 항목 -->
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td>
                                        서울특별시 강남구 도산대로101길 6<br><br>
                                        지번 서울특별시 강남구 청담동 129-10
                                    </td>
                                </tr>
                                <tr>
                                    <th>전화번호</th>
                                    <td>02-546-5739</td>
                                </tr>
                                <tr>
                                    <th>예상칼로리</th>
                                    <td>1200kcal</td>
                                </tr>

                            </table>
                        </div>
                    </div>

                    <div id="map"></div>
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
<script>
    const urlParams = new URLSearchParams(window.location.search);
    const restaurantName = urlParams.get('name');
    const restaurantMenu = urlParams.get('menu');
    const restaurantImage = decodeURIComponent(urlParams.get('image'));
    const stateUlValues = urlParams.get('state_ul')?.split(',') || [];

    const restaurantNameElement = document.getElementById('restaurant-name');
    const restaurantMenuElement = document.getElementById('restaurant-menu');

    if (restaurantName && restaurantMenu) {
        restaurantNameElement.textContent = restaurantName;
        restaurantMenuElement.textContent = restaurantMenu;
        restaurantImageElement.innerHTML = `<img src="${restaurantImage}" width="254" height="206">`;

        stateUlValues.forEach((value, index) => {
            const li = document.createElement('li');
            li.textContent = `State Value ${index + 1}: ${value}`;
            restaurantStateElement.appendChild(li);
        });
    } else {
        restaurantNameElement.textContent = '정보를 찾을 수 없습니다.';
        // restaurantMenuElement.textContent = '';
        // restaurantImageElement.textContent = '';
    }
</script>


<script> //나중에 여기에다가 위경도 데이터프레임으로 넣어주면 됨
var long;
var lati;


var options = {
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 0,
};



function success(pos) {
    var crd = pos.coords;
    var lati = parseFloat(crd.latitude);
    var long = parseFloat(crd.longitude);

    console.log("Your current position is:");
    console.log(`Latitude : ${crd.latitude}`);
    console.log(`Longitude: ${crd.longitude}`);
    console.log(`More or less ${crd.accuracy} meters.`);

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

    naver.maps.Event.addListener(map, 'click', function (e) {
        marker.setPosition(e.latlng);
    });
}

function error(err) {
    console.warn(`ERROR(${err.code}): ${err.message}`);
}

navigator.geolocation.getCurrentPosition(success, error, options);

// function success(pos) {
//     var crd = pos.coords;
//     lati = parseFloat(crd.latitude);
//     long = parseFloat(crd.longitude);

//     console.log("Your current position is:");
//     console.log(`Latitude : ${crd.latitude}`);
//     console.log(`Longitude: ${crd.longitude}`);
//     console.log(`More or less ${crd.accuracy} meters.`);
// }

// function error(err) {
//     console.warn(`ERROR(${err.code}): ${err.message}`);
// }

//         var mapOptions = {
//             center: new naver.maps.LatLng(lati, long),
//             zoom: 10 // 확대 수준 조정
//         };



//         var map = new naver.maps.Map('map', mapOptions);

//         var markerOptions = {
//             position: new naver.maps.LatLng(lati, long),
//             map: map,
//             icon: {
//                 url: "images/marker2.png",
//                 size: new naver.maps.Size(100, 100),
//                 origin: new naver.maps.Point(0, 0),
//                 anchor: new naver.maps.Point(25, 26)
//             }
//         };
//         var marker = new naver.maps.Marker(markerOptions);

//         naver.maps.Event.addListener(map, 'click', function (e) {
//             marker.setPosition(e.latlng);
//         });


</script>

</body>

</html>