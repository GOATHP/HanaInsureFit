<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>하나 InsureFit</title>
    <link href="resources/static/css/style.css" rel="stylesheet">
    <link href="resources/static/css/style.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-annotation/1.0.2/chartjs-plugin-annotation.min.js"></script>
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js"
            integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH"
            crossorigin="anonymous"></script>
    <script>
        var customerID = "<%=(String) session.getAttribute("customerID")%>";
        console.log(customerID);
    </script>

    <style>

        #main3{
            padding-bottom: 10px;
        }

        #goldImg{
            margin-top:30px
        }
        #silverImg{
            margin-top:30px
        }
        #bronzeImg{
            margin-top:30px
        }

        .medal{
            background-color: #00857E;
            padding: 20px;
            color:white;
            font-size: 18px;
            margin-bottom: 20px;
            border-radius: 5px;

        }


        .medal img{
            width: 30px;display: flex;height: 50px;margin-bottom: 10px; margin-left:10px;
        }

        .main {
            width: 100%;
            height: 850px;
        }

        .menu1-1 {
            text-align: center;
            padding-top: 10px;
            color: #008485;
            font-weight: 700;
            font-size: 20px;
        }

        .traveltitle {
            text-align: left;
            left: 10px;
            color: #7a7d7d;
            font-size: 29px;
            width: 1155px;
            margin: 30px auto;
            font-weight: 600;
        }

        .traveltitle hr {
            border: 1px solid #00857E;
            height: 1px;
        }

        .contents {
            display: flex;
            margin: 30px auto;
            flex-direction: column;
        }

        .menu1 a:hover {
            background-color: #008485;
            color: white;
        }

        .menu1 a {
            text-decoration: none;
            color: #333;
            padding: 8px 10px;
            text-align: center;
            margin: 0 auto;
            border-radius: 5px;
            transition: background-color 0.2s;
        }

        .menu1 {
            display: flex;
            flex-direction: column;
            width: 200px;
            border-radius: 0px;
            padding: 10px;
            float: left;
            margin: 20px;
        }

        .menuhr hr {
            border: 2px solid #008485;
        }

        .contents-1 {
            padding: 10px 0 20px 20px;
            border-radius: 50px;
            width: 800px;
            display: table;
        }

        /*살짝다름*/
        .contentsText {
            font-weight: 600;
            font-size: 17px;
            color: #606060;
            float: left;
            padding: 13px 0;
        }

        .section-1 div:nth-child(2) {
            margin-left: auto;
        }

        .section-1 {
            display: flex;
            padding: 20px 0;
        }


        .success {
            box-sizing: border-box;
            background: #FFFFFF;
            border-width: 0px 0px 3px 0;
            border-style: solid;
            border-color: #b4b2b2;
        }

        .hanaClassText {
            color: #7d7d7d;
            text-align: center;
            padding-bottom: 60px;
        }

        .hanaClassBox {
            padding: 15px 0;
            margin: 0 auto;
            background: #FFFFFF;
            border-radius: 5px;
        }

        .hanaClass {
            font-weight: 600;
            font-size: 20px;
            text-align: center;
            color: #000000;
        }

        .applyBox {
            width: 358px;
            height: 50px;
            margin: 20px auto;
            background: rgba(0, 152, 153, 0.73);
            border: 1px solid #FFFFFF;
            border-radius: 5px;
        }

        .applyBtn {
            font-weight: 700;
            font-size: 18px;
            text-align: center;
            color: #FFFFFF;
            background: rgba(0, 152, 153, 0.73);
            border: 0;
            text-align: center;
            margin: 0 auto;
            width: 100%;
            padding: 15px 0;
        }

        .classSection {
            display: flex;
            padding: 10px;
            margin: 10px 0;
        }

        .class-1 {
            width: 50%;
            font-weight: 600;
            font-size: 18px;
            color: #878787;
            float: left;
        }

        .accountBox {
            display: grid;
            width: 50%;
            text-align: right;
            margin-left: 0;
            justify-items: end;
        }

        .accountBox > .account {

            float: right;
            text-align: right;
        }

        .account {
            width: 50%;
            float: right;
            text-align: right;
        }

        /* 스테퍼 컨테이너 */
        .stepper {
            display: flex;
            align-items: center;
        }

        /* 각 스탭 */
        .step {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-left: 50px;
            z-index: 1;
        }

        /* 원 형태 스타일 */
        .circle {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            text-align: center;
            line-height: 31px;
            background-color: #FFFFFF;
            border: 2px solid #089b9c;
            color: #089b9c;
            font-family: 'Inter';
            font-weight: 700;
            font-size: 15px;
            margin-bottom: 5px;
        }

        /* 활성 스탭 스타일 */
        .active {
            background-color: #089b9c;
            color: #FFFFFF;
        }

        /* 가로선 스타일 */
        .line {
            width: 170px;
            height: 3px;
            background-color: #DCDCDC;
            position: relative;
            left: 180px;
        }

        /* 라벨 스타일 */
        .label {
            font-family: 'Inter';
            font-weight: 600;
            font-size: 15px;
            color: #089b9c;
        }

        .newAccountImg {
            text-align: center;
            margin: 0 auto;
            width: 300px;
            display: block;
        }

        .section-4 > hr {
            border: 1.5px solid #b4b2b2;
        }

        .actBottomText {
            width: 106px;
            height: 18px;
            font-weight: 600;
            font-size: 15px;
            text-align: center;
            color: rgba(0, 152, 153, 0.73);
        }

        .bottomText-1 {
            font-weight: 600;
            font-size: 15px;
            color: #B0B0B0;
        }

        .textBox {
            padding: 10px 0;
        }

        #kakaotalk-sharing-btn {
            box-sizing: border-box;
            width: 200px;
            height: 50px;
            font-size: 18px;
            background: #00857E;
            color: #FFFFFF;
            border: 1px solid #00857E;
            border-radius: 10px;
        }
    </style>
<body>

<div id="main3">

    <header>
        <div class="navAll">
            <div class="upper">
                <ul class="link_crfix">
                    <li class="item">
                        <a class="headerLink" href="https://www.hanainsure.co.kr/">
                            하나손해보험
                        </a>
                    </li>
                    <li class="item">
                        <a class="headerLink" href="/introduce">
                            서비스소개
                        </a>
                    </li>
                    <li class="item">
                        <a class="headerLink"
                           href="https://www.hanafn.com:8002/info/people/careerNonscheduledEmploy.do">
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
                    <li>
                        <div class="welcomeMent" id="customerID" data-customerID="<%=customerID%>"><%= name %>
                            (<%=customerID%>)님 환영합니다
                        </div>
                    </li>
                    <li><a class="headerLink" href="javascript:void(0);" onclick="logout();">로그아웃</a></li>
                    <%
                    } else {
                    %>
                    <li class="item"><a href="/joinMember">회원가입</a></li>
                    <li class="item">
                        <div class="loginButton">로그인</div>
                    </li>
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
                        <ul>
                            <li><a href="/introduce">하나Insure Fit이란?</a></li>
                            <li><a href="/recommendInsu">Grade보험</a></li>
                            <li><a href="/weightManage">건강관리</a></li>
                            <li><a href="/dashboardMypage" style="color:#00857E">마이페이지</a></li>
                        </ul>
                    </ul>
                </nav>
            </div>
        </div>
    </header>
    <div class="traveltitle"
         style="width:100%;/* margin: 0 auto; */display: flex;justify-content: flex-start;margin-bottom: 20px;">
        <%= name %>님의&nbsp<span class="clicked">InsureFit</span> 친구 :&nbsp
        <div id="friendCount">0</div>
    </div>
    <hr class="custom-hr2" style="height:3px; margin: 0px;
        margin-bottom:20px;
        "/>
    <div class="introContainer">
        <div class="benefit2">
            <h2>InsureFit with
                <select id="friendSelector" style="
    border: 0px;
    font-family: &quot;NanumSquareRoundEB&quot;, sans-serif;
    color: #00857E;
    font-size: 30px;
    /* border-bottom: 1px solid #00857E; */
">
                </select>
           <button onclick="getSelectedFriend()" style="width: 50px;">선택</button>
            </h2>
            <div class="graph-container-4" style="height:330px; padding-top:20px;">
                <div class="graph-4" id="calories">내 그래프
                    <hr class="custom-hr" style="width:100px;">
                    <div class="graphContenet">
                        <canvas class="graphFood" id="bar-chart-calories" width="450" height="550"
                                style="padding-top:0px;"></canvas>
                    </div>
                </div>
                <div class="graph-4" id="carbs">친구 그래프
                    <hr class="custom-hr" style="width:100px;">
                    <div class="graphContenet">
                        <canvas class="graphFood" id="bar-chart-calories-friend" width="450" height="550" style="padding-top:0px;" ></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="benefit2">
            <h2>InsureFit 순위</h2>
            <div class="graph-container-4" style="height:330px; padding-top:0px;">
                <div class="graph-4" id="goldMedal">
                    <div class="medal" style="padding:10px; display: flex; align-items: center; padding-bottom: 0px;">
                        <div><img src="resources/static/image/goldmedal.png" style="width: 30px;display: flex;"></div>
                        <div style="padding-left: 5px; font-size:26px;">1등</div>
                    </div>
                    <hr class="custom-hr" style="width:100px; height: 2px;">
                    <div id="gold">
                    <%=name%>님
                    </div>
                    <img id="goldImg" style="width:120px"></img>
                </div>
                <div class="graph-4" id="silverMedal">
                    <div class="medal" style="padding:10px; display: flex;align-items: center; padding-bottom: 0px;">
                        <div><img src="resources/static/image/silvermedal.png" style="width: 30px;display: flex;"></div>
                        <div style="padding-left: 5px; font-size:26px;">2등</div>
                    </div>
                    <hr class="custom-hr" style="width:100px;  height: 2px;">
                    <div id="silver">
                    </div>
                    <img id="silverImg" style="width:120px"></img>
                </div>
                <div class="graph-4" id="bronzeMedal">
                    <div class="medal" style="padding:10px; display: flex;align-items: center; padding-bottom: 0px;">
                        <div><img src="resources/static/image/bronzemedal.png" style="width: 30px;display: flex;"></div>
                        <div style="padding-left: 5px;font-size:26px;">3등</div>
                    </div>
                    <hr class="custom-hr" style="width:100px;  height: 2px;">
                    <div id="bronze" >
                    </div>
                    <img id="bronzeImg" style="width:120px"></img>
                </div>
            </div>
        </div>
    </div>
</div>

</div>
<div class="contents">

    <%--            <div class="section-1">--%>
    <%--                <div class="stepper">--%>
    <%--                    <div class="line"></div>--%>
    <%--                    <div class="step">--%>
    <%--                        <div class="circle">1</div>--%>
    <%--                    </div>--%>
    <%--                    <div class="step">--%>
    <%--                        <div class="circle">2</div>--%>
    <%--                    </div>--%>
    <%--                    <div class="step">--%>
    <%--                        <div class="circle active">3</div>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <div class="newAccount1"><img class="newAccountImg" src="resources/static/image/플젝로고.png"></div>
    <div class="hanaClassBox">
        <button id="kakaotalk-sharing-btn" href="javascript:;" onclick="send()">
            <span>친구 초대하기</span>
        </button>
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
</body>
<script>
    function send() {
        $.ajax({
            url: '/getMyPageInfo2',
            method: "POST",
            dataType: "json",
            data: {
                'customerID': customerID
            },
            success: function (response) {

                Kakao.Share.createDefaultButton({
                    container: '#kakaotalk-sharing-btn',
                    objectType: 'feed',
                    content: {
                        title: 'Hana InsureFit에 초대되었습니다.',
                        description: 'Hana InsureFit에 초대되었습니다.',
                        imageUrl: 'https://ibb.co/9YshwDR',
                        link: {
                            // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
                            mobileWebUrl: 'http://localhost:8080',
                            webUrl: 'http://localhost:8080',
                        },
                    },
                    buttons: [
                        {
                            title: 'InsureFitWith 시작하기',
                            link: {
                                mobileWebUrl: 'http://localhost:8080?customerID=' + customerID,
                                webUrl: 'http://localhost:8080?customerID=' + customerID
                            },
                        }
                    ],
                    serverCallbackArgs: '{"key" : "value"}',
                });
            }
        })
    }

    Kakao.init('6fa66706bdb2ae27d99cb7a2d394b4d8'); // 사용하려는 앱의 JavaScript 키 입력
</script>
<script>
    function getData(endpoint, requestData, successCallback, errorCallback) {
        $.ajax({
            url: endpoint,
            method: 'POST',
            dataType: 'json',
            data: requestData,
            success: successCallback,
            error: errorCallback
        });
    }

    var friendData;
    const customerIDs=[];
    function getFriendsCount() {

        var requestData = {'customerID': customerID};
        getData('getFriendsCount', requestData, function (response) {
            console.log(response);
            document.getElementById("friendCount").textContent = response.length + '(명)';
            friendData = response;

            friendData.forEach(friend => {
                customerIDs.push(friend.customerID);

            })
            console.log(customerIDs);
            if (customerIDs.length > 0) {
                getMyGrade(customerIDs);
            }
            populateFriendSelector();
        }, function (error) {
            console.error(error);
        });
    }

    getFriendsCount();

    // 친구 선택 목록을 동적으로 생성하는 함수
    function populateFriendSelector() {

        const selectElement = document.getElementById('friendSelector');

        friendData.forEach(friend => {

            console.log(customerID);
            const option = document.createElement('option');
            option.value = friend.customerID;
            option.textContent = friend.name;
            selectElement.appendChild(option);
        });
    }


    var myChart2;

    function getSelectedFriend() {
        const selectElement = document.getElementById('friendSelector');
        const selectedValue = selectElement.value;
        const selectedText = selectElement.options[selectElement.selectedIndex].text;
        // 선택한 친구의 값을 사용하여 작업 수행
        console.log('선택한 친구:' + selectedValue + '(ID: ' + selectedText + ')');
        sendAddressInfoToServer2(selectedValue);


        $.ajax({
            url: '/loadData',
            type: 'POST',
            dataType: "json",
            data: {
                'customerID': selectedValue
            },
            success: function (data) {
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
                console.log("영양소" + ingredients);
                for (var i = 0; i < ingredients.length; i++) {
                    if (ingredients[i] !== null) { // null 체크
                        total_calories += ingredients[i].total_calories || 0; // null이나 undefined인 경우 0으로 처리
                        total_carbs += ingredients[i].total_carbs || 0;
                        total_fat += ingredients[i].total_fat || 0;
                        total_protein += ingredients[i].total_protein || 0;
                    }
                }
                const annotation2 = {
                    type: 'line',
                    mode: 'horizontal',
                    scaleID: 'y',
                    value: dailyRecommendedCalories, // 원하는 값을 설정하세요 (예: 1800)
                    borderColor: '#ff0000',
                    borderWidth: 2,
                    label: {
                        enabled: true,
                        content: dailyRecommendedCalories
                    }
                }
                const ctx = document.getElementById('bar-chart-calories-friend').getContext('2d');
                if (myChart2) {
                    myChart2.destroy();
                }
                myChart2 = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: ['Kcal'],
                        datasets: [{
                            label: '칼로리 총합',
                            data: [total_calories],
                            backgroundColor: [
                                // 'rgba(255, 99, 132, 0.2)'
                                // 'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 1)',
                                // 'rgba(75, 192, 192, 0.2)',
                                // 'rgba(153, 102, 255, 0.2)',
                                // 'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                // 'rgba(255, 99, 132, 1)'
                                // 'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                // 'rgba(75, 192, 192, 1)',
                                // 'rgba(153, 102, 255, 1)',
                                // 'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 0.1
                        }]
                    },
                    options: {
                        barThickness: 30,
                        scales: {
                            x: {
                                beginAtZero: true,
                                max: 3000,
                                stepSize: 500,
                            },
                            y: {
                                type: 'linear', // y축의 유형을 linear로 설정
                                min: 0, // y축 최소값
                                max: 2500, // y축 최대값
                                stepSize: 500,
                            },
                        },
                        plugins: {
                            annotation: {
                                annotations: [annotation2]
                            },
                        },
                    }
                });
            },
            error: function (data) {

            },
        });
    }

</script>
<script>
    var weightManageArray = [];
    var dailyRecommendedCalories;

    function sendAddressInfoToServer(customerID) {
        $.ajax({
            type: "POST",
            url: "/weightManage",
            dataType: "json",
            data: {
                'customerID': customerID
            },
            success: function (response) {
                console.log("Data received from server:", response);
                weightManageArray.push(response);
                // var currentCaloriesElement = document.getElementById("goalCalories");
                // currentCaloriesElement.textContent = weightManageArray[0].calories + "kcal";
                dailyRecommendedCalories = weightManageArray[0].calories;

            },
            error: function (xhr, status, error) {
                console.error("Request failed with status:", status, error);
            }
        });
    }

    function sendAddressInfoToServer2(customerID) {
        $.ajax({
            type: "POST",
            url: "/weightManage",
            dataType: "json",
            data: {
                'customerID': customerID
            },
            success: function (response) {

                console.log("Datadd received from server:", response);
                weightManageArray.push(response);
                // var currentCaloriesElement = document.getElementById("goalCalories");
                // currentCaloriesElement.textContent = weightManageArray[0].calories + "kcal";
                dailyRecommendedCalories = response.calories;

            },
            error: function (xhr, status, error) {
                console.error("Request failed with status:", status, error);
            }
        });
    }

    // sendAddressInfoToServer(customerID);
</script>
<script>
    var myChart1;
    document.addEventListener("DOMContentLoaded", function () {
        sendAddressInfoToServer(customerID);
        $.ajax({
            url: '/loadData',
            type: 'POST',
            dataType: "json",
            data: {
                'customerID': customerID
            },
            success: function (data) {
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
                console.log("영양소" + ingredients);
                for (var i = 0; i < ingredients.length; i++) {
                    if (ingredients[i] !== null) { // null 체크
                        total_calories += ingredients[i].total_calories || 0; // null이나 undefined인 경우 0으로 처리
                        total_carbs += ingredients[i].total_carbs || 0;
                        total_fat += ingredients[i].total_fat || 0;
                        total_protein += ingredients[i].total_protein || 0;
                    }
                }
                const annotation2 = {
                    type: 'line',
                    mode: 'horizontal',
                    scaleID: 'y',
                    value: dailyRecommendedCalories, // 원하는 값을 설정하세요 (예: 1800)
                    borderColor: '#ff0000',
                    borderWidth: 2,
                    label: {
                        enabled: true,
                        content: dailyRecommendedCalories
                    }
                }
                const ctx = document.getElementById('bar-chart-calories').getContext('2d');
                myChart1 = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: ['Kcal'],
                        datasets: [{
                            label: '칼로리 총합',
                            data: [total_calories],
                            backgroundColor: [
                                'rgba(255, 99, 132, 1)'
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
                        barThickness: 30,
                        scales: {
                            x: {
                                beginAtZero: true,
                                max: 3000,
                                stepSize: 500,
                            },
                            y: {
                                type: 'linear', // y축의 유형을 linear로 설정
                                min: 0, // y축 최소값
                                max: 2500, // y축 최대값
                                stepSize: 500,
                            },
                        },
                        plugins: {
                            annotation: {
                                annotations: [annotation2]
                            },
                        },
                    }
                });
            },
            error: function (data) {

            },
        });
    });
</script>
<script>
    var friendGrades;
    function getMyGrade() {
        console.log("customerIDs", customerIDs);
        $.ajax({
            url: '/getMyGrade',
            type: 'POST',
            contentType: 'application/json', // JSON 데이터를 보낼 때 필수
            data: JSON.stringify(customerIDs),
            success: function (data) {
                console.log(data);
                friendGrades = data;

                friendGrades.push(newFriendData);

                friendGrades.sort(function(a, b) {
                    return a.healthGrade - b.healthGrade;
                });

                document.getElementById('gold').textContent = friendGrades[0].name + "님";
                var healthGrade = friendGrades[0].healthGrade;
                var gradeImgElement = document.getElementById("goldImg");
                if (healthGrade === 1) {
                    gradeImgElement.setAttribute("src", "resources/static/image/Grade1.png");
                } else if (healthGrade === 2) {
                    gradeImgElement.setAttribute("src", "resources/static/image/Grade2.png");
                } else if (healthGrade === 3) {
                    gradeImgElement.setAttribute("src", "resources/static/image/Grade3.png");
                } else if (healthGrade === 4) {
                    gradeImgElement.setAttribute("src", "resources/static/image/Grade4.png");
                }
                document.getElementById('silver').textContent = friendGrades[1].name + "님";
                var healthGrade = friendGrades[1].healthGrade;
                var gradeImgElement = document.getElementById("silverImg");
                if (healthGrade === 1) {
                    gradeImgElement.setAttribute("src", "resources/static/image/Grade1.png");
                } else if (healthGrade === 2) {
                    gradeImgElement.setAttribute("src", "resources/static/image/Grade2.png");
                } else if (healthGrade === 3) {
                    gradeImgElement.setAttribute("src", "resources/static/image/Grade3.png");
                } else if (healthGrade === 4) {
                    gradeImgElement.setAttribute("src", "resources/static/image/Grade4.png");
                }

                document.getElementById('bronze').textContent = friendGrades[2].name + "님";
                var healthGrade = friendGrades[2].healthGrade;
                var gradeImgElement = document.getElementById("bronzeImg");

                if (healthGrade === 1) {
                    gradeImgElement.setAttribute("src", "resources/static/image/Grade1.png");
                } else if (healthGrade === 2) {
                    gradeImgElement.setAttribute("src", "resources/static/image/Grade2.png");
                } else if (healthGrade === 3) {
                    gradeImgElement.setAttribute("src", "resources/static/image/Grade3.png");
                } else if (healthGrade === 4) {
                    gradeImgElement.setAttribute("src", "resources/static/image/Grade4.png");
                }

                // friendGrades 배열을 콘솔에 출력하여 확인
                console.log(friendGrades);
            },
            error: function (data) {
            }
        });
    }
</script>
<script src="resources/static/js/demo/myPageInfo3.js"></script>
<script>
    var name = "<%=name%>";

</script>

</html>