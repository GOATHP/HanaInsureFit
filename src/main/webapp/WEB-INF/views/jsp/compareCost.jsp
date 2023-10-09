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
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-annotation/1.0.2/chartjs-plugin-annotation.min.js"></script>


    <script>
        var customerID = "<%=(String) session.getAttribute("customerID")%>";
        console.log(customerID);
    </script>

    <style>
        #loginForm{
            width: 80%;
            margin: 0 auto;
        }
        .form-group > label{
            width: 300px;
        }
        .form-group > input{

            width: 500px;
        }
        .login-button{
            margin: 0 auto;
            width: 80%;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
                    <a href="/introduce">
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
                <li><div class="welcomeMent" id="customerID" data-customerID="<%=customerID%>"><%= name %> (<%=customerID%>)님 환영합니다</div></li>
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
                    <li><a href="/weightManage">건강관리</a></li>
                    <li><a href="/dashboardMypage">마이페이지</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<div id="main3">

    <div class ="slogan" style="width:1000px;">
        <div class="fourBtn">
            <button id="grade1Btn" style="
    width: 150px;
    margin: 30px;
    font-size: 15px;
    background-color: #00857E;
     border: 1px solid #00857E;
">Grade1 보험료 조회</button>
            <button id="grade2Btn" style="
    width: 150px;
    margin: 30px;
    font-size: 15px;
    background-color: #00857E;
     border: 1px solid #00857E;
">Grade2 보험료 조회</button>
            <button id="grade3Btn" style="
    width: 150px;
    margin: 30px;
    font-size: 15px;
    background-color: #00857E;
     border: 1px solid #00857E;
">Grade3 보험료 조회</button>
            <button id="grade4Btn" style="
    width: 150px;
    margin: 30px;
    font-size: 15px;
    background-color: #00857E;
     border: 1px solid #00857E;
">Grade4 보험료 조회</button>
        </div>
        <div class="insuInfo" style="width:100%;/* margin: 0 auto; */display: flex;justify-content: center;">
            <div style="
    display: flex;
    flex-direction: row;
    align-items: center;
    height: 20px;
">
            <span class="colorText"><%=name%></span>(Grade<p id="grade"></p>) 님의 할인 혜택
            </div>
        </div>

        <img id="gradeImg" style="width: 500px; height:420px;  padding-top: 50px; padding-bottom:0px;">
        <hr class="custom-hr" style="
    width: 70%;
    margin-bottom: 20px;
">
    <div style="
    display: flex;
    flex-direction: column;
    align-items: center;
">
    <div class="sideBarName" style="
    width: 400px;
">
        할인액
    </div>
        <div style="width:100%;/* margin: 0 auto; */display: flex;justify-content: center;margin-bottom: 20px;">
            <%=name%>님의 할인된 보험금은&nbsp<div id="insuFeeCell" style="color:#00857E"></div>입니다.
        </div>
        <div>
            <table class="insuTable2" style="
    margin-bottom: 30px;
    width: 600px;">
                <colgroup>
                    <col style="width: 10%;">
                    <col style="width: 11%;">
                    <col style="width: 10%;">
                    <col style="width: 10%;">
                    <col style="width: 10%;">
                    <col style="width: 10%;">

                </colgroup>
                <thead>
                <tr>
                    <th scope="col">구분</th>
                    <th scope="col">납입기간</th>
                    <th scope="col">6개월</th>
                    <th scope="col">1년</th>
                    <th scope="col">5년</th>
                    <th scope="col">10년</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th rowspan="3" scope="row">보험료 비교</th>
                    <td scope="col" id="myGrade">할인 보험료</td>
                    <td class="center" id="halfYearDiscount"></td>
                    <td class="center" id="aYearDiscount"></td>
                    <td class="center" id="fiveYearDiscount"></td>
                    <td class="center" id="decadeDiscount"></td>
                </tr>
                <tr>
                    <td class="center">기본 보험료</td>
                    <td class="center" id="halfYear"></td>
                    <td class="center" id="aYear"></td>
                    <td class="center" id="fiveYear"></td>
                    <td class="center" id="decade"></td>
                </tr>
                <tr>
                    <td class="center">차액</td>
                    <td class="center" id="halfYearGap"></td>
                    <td class="center" id="aYearGap"></td>
                    <td class="center" id="fiveYearGap"></td>
                    <td class="center" id="decadeGap"></td>
                </tr>
                </tbody>
            </table>
        </div>
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
<%--<script>
    const modal = document.querySelector('.modal');
    const btnOpenPopup = document.querySelector(".loginButton");

    btnOpenPopup.addEventListener('click', () => {
        modal.style.display = 'block';
    });

    function closeModal() {
        var modal = document.querySelector(".modal");
        modal.style.display = "none"; // 모달을 숨기도록 설정
    }
    var closePopupButton = document.querySelector(".btn-close-popup");
    closePopupButton.addEventListener("click", closeModal);
</script>
<script>
    const images = document.querySelectorAll('.slider img');
    let currentImageIndex = 0;
    images[currentImageIndex].style.display = 'block';

    function toggleSlider() {
        images[currentImageIndex].style.display = 'none';
        currentImageIndex = (currentImageIndex + 1) % images.length;
        images[currentImageIndex].style.display = 'block';
    }

    setInterval(toggleSlider, 7000); // 7초마다 슬라이드 변경
</script>--%>
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
    function setDayBottomTextByDate(targetDate, newText) {
        // 해당 날짜를 가진 <td> 요소를 선택합니다.
        var tdElement = document.querySelector('td[data-date="' + targetDate + '"]');

        // 선택한 <td> 요소의 하위 요소인 <div class="fc-daygrid-day-bottom">을 찾습니다.
        var dayBottomElement = tdElement ? tdElement.querySelector('.fc-daygrid-day-bottom') : null;

        // 텍스트를 설정합니다.
        if (dayBottomElement) {
            dayBottomElement.textContent = newText;
        }
    }


    function convertDateFormat(dateString) {
        // 날짜를 파싱합니다.
        var parts = dateString.split('/');
        var year = parts[0];
        var month = parts[1];
        var day = parts[2];

        // 2자리 연도를 4자리로 변환합니다. (예: "23" => "2023")
        if (year.length === 2) {
            year = '20' + year;
        }

        // 월과 일이 한 자리 수인 경우 앞에 0을 추가합니다.
        if (month.length === 1) {
            month = '0' + month;
        }
        if (day.length === 1) {
            day = '0' + day;
        }

        // 변환된 날짜를 "yyyy-MM-dd" 형식으로 반환합니다.
        return year + '-' + month + '-' + day;
    }

    // 날짜 형식 변환을 수행한 결과 배열


    // 사용 예시:
    // document.addEventListener('DOMContentLoaded', function() {
    //     var formattedLabels = labels.map(convertDateFormat);
    //     for (var i = 0; i < formattedLabels.length; i++) {
    //         var newText = dataValues[i] + ' kcal';
    //         setDayBottomTextByDate(formattedLabels[i], newText);
    //     }
    //     setDayBottomTextByDate(targetDate, newText);
    // });
</script>
<script>
    var labels = [];
    var dataValues = [];
    document.addEventListener('DOMContentLoaded', function() {
        $.ajax({
            url: 'getChartData2',
            method: 'POST',
            dataType: 'json',
            data: {
                'customerID': customerID
            },
            success: function (response) {
                for (var i = 0; i < response.length; i++) {
                    labels.push(response[i].recorddate);
                    dataValues.push(response[i].total_calories);
                    console.log("dataValues" + dataValues);
                    var formattedLabels = labels.map(convertDateFormat);
                }
                for (var i = 0; i < formattedLabels.length; i++) {
                    var newText = dataValues[i] + ' kcal';
                    setDayBottomTextByDate(formattedLabels[i], newText);
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
    });
</script>

<script>
    // JavaScript 코드
    // 버튼 클릭 이벤트 처리
    document.getElementById("grade1Btn").addEventListener("click", function() {
        // Grade1에 해당하는 그래프 이미지로 변경
        document.getElementById("gradeImg").src = "resources/static/image/Grade1Graph.png";
    });

    document.getElementById("grade2Btn").addEventListener("click", function() {
        // Grade2에 해당하는 그래프 이미지로 변경
        document.getElementById("gradeImg").src = "resources/static/image/Grade2Graph.png";
    });

    document.getElementById("grade3Btn").addEventListener("click", function() {
        // Grade3에 해당하는 그래프 이미지로 변경
        document.getElementById("gradeImg").src = "resources/static/image/Grade3Graph.png";
    });

    document.getElementById("grade4Btn").addEventListener("click", function() {
        // Grade4에 해당하는 그래프 이미지로 변경
        document.getElementById("gradeImg").src = "resources/static/image/Grade4Graph.png";
    });

    var insuranceFeee;



    function numberWithCommas(number) {
        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    document.getElementById("grade1Btn").addEventListener("click", function() {
        // Grade1에 해당하는 그래프 이미지로 변경
        var intPartt = numberWithCommas(Math.floor(insuranceFeee * 0.6));
        var intPart = Math.floor(insuranceFeee * 0.6);
        console.log(insuranceFeee);
        console.log(intPart);
        document.getElementById("insuFeeCell").textContent = intPartt + "원(월)";
        document.getElementById("halfYearDiscount").textContent = numberWithCommas(intPart*6) + "원";
        document.getElementById("aYearDiscount").textContent = numberWithCommas(intPart*12) + "원";
        document.getElementById("fiveYearDiscount").textContent = numberWithCommas(intPart*60) + "원";
        document.getElementById("decadeDiscount").textContent = numberWithCommas(intPart*120) + "원";

        document.getElementById("halfYearGap").textContent = numberWithCommas(insuranceFeee*6 - intPart*6) + "원";
        document.getElementById("aYearGap").textContent = numberWithCommas(insuranceFeee*12-intPart*12) + "원";
        document.getElementById("fiveYearGap").textContent = numberWithCommas(insuranceFeee*60-intPart*60) + "원";
        document.getElementById("decadeGap").textContent = numberWithCommas(insuranceFeee*120 - intPart*120) + "원";
    });

    document.getElementById("grade2Btn").addEventListener("click", function() {
        // Grade2에 해당하는 그래프 이미지로 변경
        var intPartt = numberWithCommas(Math.floor(insuranceFeee * 0.8));
        var intPart = Math.floor(insuranceFeee * 0.8);

        document.getElementById("insuFeeCell").textContent = intPartt + "원(월)";
        document.getElementById("halfYearDiscount").textContent = numberWithCommas(intPart*6) + "원";
        document.getElementById("aYearDiscount").textContent = numberWithCommas(intPart*12) + "원";
        document.getElementById("fiveYearDiscount").textContent = numberWithCommas(intPart*60) + "원";
        document.getElementById("decadeDiscount").textContent = numberWithCommas(intPart*120) + "원";

        document.getElementById("halfYearGap").textContent = numberWithCommas(insuranceFeee*6 - intPart*6) + "원";
        document.getElementById("aYearGap").textContent = numberWithCommas(insuranceFeee*12-intPart*12) + "원";
        document.getElementById("fiveYearGap").textContent = numberWithCommas(insuranceFeee*60-intPart*60) + "원";
        document.getElementById("decadeGap").textContent = numberWithCommas(insuranceFeee*120 - intPart*120) + "원";
    });

    document.getElementById("grade3Btn").addEventListener("click", function() {
        // Grade3에 해당하는 그래프 이미지로 변경
        var intPartt = numberWithCommas(Math.floor(insuranceFeee));
        var intPart = Math.floor(insuranceFeee);
        document.getElementById("insuFeeCell").textContent = intPartt + "원(월)";
        document.getElementById("halfYearDiscount").textContent = numberWithCommas(intPart*6) + "원";
        document.getElementById("aYearDiscount").textContent = numberWithCommas(intPart*12) + "원";
        document.getElementById("fiveYearDiscount").textContent = numberWithCommas(intPart*60) + "원";
        document.getElementById("decadeDiscount").textContent = numberWithCommas(intPart*120) + "원";

        document.getElementById("halfYearGap").textContent = numberWithCommas(insuranceFeee*6 - intPart*6) + "원";
        document.getElementById("aYearGap").textContent = numberWithCommas(insuranceFeee*12-intPart*12) + "원";
        document.getElementById("fiveYearGap").textContent = numberWithCommas(insuranceFeee*60-intPart*60) + "원";
        document.getElementById("decadeGap").textContent = numberWithCommas(insuranceFeee*120 - intPart*120) + "원";
    });

    document.getElementById("grade4Btn").addEventListener("click", function() {
        // Grade4에 해당하는 그래프 이미지로 변경
        var intPartt = numberWithCommas(Math.floor(insuranceFeee));
        var intPart = Math.floor(insuranceFeee);

        document.getElementById("insuFeeCell").textContent = intPartt + "원(월)";
        document.getElementById("halfYearDiscount").textContent = numberWithCommas(intPart*6) + "원";
        document.getElementById("aYearDiscount").textContent = numberWithCommas(intPart*12) + "원";
        document.getElementById("fiveYearDiscount").textContent = numberWithCommas(intPart*60) + "원";
        document.getElementById("decadeDiscount").textContent = numberWithCommas(intPart*120) + "원";

        document.getElementById("halfYearGap").textContent = numberWithCommas(insuranceFeee*6 - intPart*6) + "원";
        document.getElementById("aYearGap").textContent = numberWithCommas(insuranceFeee*12-intPart*12) + "원";
        document.getElementById("fiveYearGap").textContent = numberWithCommas(insuranceFeee*60-intPart*60) + "원";
        document.getElementById("decadeGap").textContent = numberWithCommas(insuranceFeee*120 - intPart*120) + "원";

    });
</script>

<script src="resources/static/js/demo/myPageInfo2.js"></script>
<script src="resources/static/js/demo/myPageInsu2.js"></script>
</html>