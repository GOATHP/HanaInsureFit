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
    <link href='fullcalendar-5.11.3/lib/main.css' rel='stylesheet' />
    <script src='fullcalendar-5.11.3/lib/main.js'></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-annotation/1.0.2/chartjs-plugin-annotation.min.js"></script>

    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
    <script>
        var customerID = "<%=(String) session.getAttribute("customerID")%>";
        console.log(customerID);
    </script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                events : [
                    {
                        title: '물주기',
                        start: '2022-09-01'
                    },
                    {
                        title: '뚜껑 닫기',
                        start: '2022-09-03',
                        end: '2022-09-05'
                    }
                ]
            });
            calendar.render();
        });
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
                    <li><a href="/weightManage">건강관리</a></li>
                    <li><a href="/dashboardMypage">마이페이지</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<div id="main3">

    <div class ="slogan">
        <div class="sideBarName" style="
    width: 400px;
">
            InsureFit Calendar
        </div>
<%--        <img src="resources/static/image/슬로건.png" width="70%">--%>
        <div class="calendar">
                <div id='calendar'></div>
        </div>
    </div>
    </div>
<div class="modal">
    <div class="modal_body">
        <div  style="
    display: flex;
    /* justify-content: space-between; */
    /* align-items: flex-end; */
    flex-direction: row-reverse;
    width: 100%;
        ">
        <button class="btn-close-popup">닫기</button>
        </div>
        식단 기록
        <div class="modal-date"></div>
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

</div>
<button class="btn-open-popup">?</button>
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
    // const dateElement = document.querySelector('.fc-day[data-date="2023-10-02"]');
    // dateElement.addEventListener('click', () => {
    //     // 클릭된 날짜와 관련된 정보를 얻어옵니다.
    //     const dataDateValue = dateElement.getAttribute('data-date');
    // });
    //
    document.addEventListener('DOMContentLoaded', function () {
        // 클릭 이벤트 핸들러 함수 정의
        function handleDayClick(event) {
            const clickedDate = event.currentTarget.getAttribute('data-date');
            console.log('Clicked date:', clickedDate);

            // 클릭한 날짜를 yy/MM/dd 형식으로 변환
            const dateParts = clickedDate.split('-');
            console.log("dateParts", dateParts);
            const year = dateParts[0].substring(2);
            console.log("year", year);
            const month = dateParts[1];
            console.log("month", month);
            const day = dateParts[2];
            console.log("day", day);
            const recordDate = year+'/'+month+'/'+day;
            console.log("formattedDate", recordDate);

            // 모달 창 열기
            const modal = document.querySelector('.modal');
            modal.style.display = 'block';

            // 모달에 날짜 표시
            const modalDateElement = document.querySelector('.modal-date');
            modalDateElement.textContent = recordDate;

            sendDateToServer(recordDate);


        }

        // 클릭 이벤트 핸들러를 등록할 날짜 요소 선택
        const dateElements = document.querySelectorAll("#calendar .fc-day.fc-day-future.fc-daygrid-day");
        const dateElements1 = document.querySelectorAll("#calendar .fc-day.fc-day-today.fc-daygrid-day");
        const dateElements2 = document.querySelectorAll("#calendar .fc-day.fc-day-past.fc-daygrid-day");


        dateElements.forEach(dateElement => {
            dateElement.addEventListener('click', handleDayClick);
        });

        dateElements1.forEach(dateElement1 => {
            dateElement1.addEventListener('click', handleDayClick);
        });

        dateElements2.forEach(dateElement2 => {
            dateElement2.addEventListener('click', handleDayClick);
        });


        // 모달 닫기 버튼 클릭 이벤트 핸들러 등록
        const closePopupButton = document.querySelector(".btn-close-popup");
        closePopupButton.addEventListener("click", () => {
            const modal = document.querySelector(".modal");

            modal.style.display = "none"; // 모달 닫기

            morningSection = document.querySelector('.section:nth-child(1) .ateFood');
            morningCircle= document.querySelector('.section:nth-child(1) .circle');
            lunchSection = document.querySelector('.section:nth-child(2) .ateFood');
            lunchCircle= document.querySelector('.section:nth-child(2) .circle');
            dinnerSection = document.querySelector('.section:nth-child(3) .ateFood');
            dinnerCircle= document.querySelector('.section:nth-child(3) .circle');

            morningSection.innerHTML = "";
            morningCircle.innerHTML = "";
            lunchSection.innerHTML = "";
            lunchCircle.innerHTML = "";
            dinnerSection.innerHTML = "";
            dinnerCircle.innerHTML = "";
        });

        const prevButton = document.querySelector('.fc-prev-button');

        // 클릭 이벤트 핸들러 함수를 정의합니다.
        function handlePrevButtonClick() {
            // 이 버튼이 클릭되었을 때 실행할 코드를 여기에 작성합니다.
            // 예를 들어 이전 달로 이동하는 기능을 구현할 수 있습니다.

            var labels = [];
            var dataValues = [];
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

            console.log('Previous button clicked');
            const dateElements = document.querySelectorAll("#calendar .fc-day.fc-day-future.fc-daygrid-day");
            const dateElements1 = document.querySelectorAll("#calendar .fc-day.fc-day-today.fc-daygrid-day");
            const dateElements2 = document.querySelectorAll("#calendar .fc-day.fc-day-past.fc-daygrid-day");


            dateElements.forEach(dateElement => {
                dateElement.addEventListener('click', handleDayClick);
            });

            dateElements1.forEach(dateElement1 => {
                dateElement1.addEventListener('click', handleDayClick);
            });

            dateElements2.forEach(dateElement2 => {
                dateElement2.addEventListener('click', handleDayClick);
            });
        }
        // 버튼에 클릭 이벤트 리스너를 추가합니다.
        prevButton.addEventListener('click', handlePrevButtonClick);
    });
</script>

<script>

    function sendDateToServer(recordDate) {
        $.ajax({
            type: 'POST', // HTTP 요청 방식 선택 (GET, POST, PUT, DELETE 등)
            url: '/calandarData', // 서버 엔드포인트 URL
            dataType: "json",
            data: { recordDate: recordDate,
                    customerID : customerID
            }, // 서버로 보낼 데이터
            success: function (response) {
                // 서버로부터 성공적인 응답을 받았을 때 실행할 코드
                console.log('날짜가 성공적으로 서버로 전송되었습니다.');
                console.log('서버 응답:', response);
                console.log(response.foodNames);
                console.log(response.ingredients);
                var foodNames = response.foodNames;
                var ingredients = response.ingredients;

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

                console.log('foodNames:');
                for (var i = 0; i < foodNames.length; i++) {
                    // console.log('Food Name: ' + foodNames[i].foodName);
                    // console.log('Meal Code: ' + foodNames[i].mealCode);
                    var foodInfo = foodNames[i];
                    var foodEntry = foodInfo.foodName;
                    console.log('!@!@!@!' + foodEntry);

                    if (foodInfo.mealCode === 0) {
                        morningSection = document.querySelector('.section:nth-child(1) .ateFood');
                        morningCircle= document.querySelector('.section:nth-child(1) .circle');

                        if (morningSection.innerHTML.trim() !== '') {
                            morningSection.innerHTML += ', ';
                        }
                        morningSection.innerHTML += foodEntry;
                        // morningCircle.innerHTML = ingredients.find(ingredient => ingredient.mealCode === foodInfo.mealCode)?.total_calories;

                    } else if (foodInfo.mealCode === 1) {
                        lunchSection = document.querySelector('.section:nth-child(2) .ateFood');
                        lunchCircle= document.querySelector('.section:nth-child(2) .circle');
                        if (lunchSection.innerHTML.trim() !== '') {
                            lunchSection.innerHTML += ', ';
                        }
                        lunchSection.innerHTML += foodEntry;
                        // lunchCircle.innerHTML = ingredients.find(ingredient => ingredient.mealCode === foodInfo.mealCode)?.total_calories;
                    } else if (foodInfo.mealCode === 2) {
                        dinnerSection = document.querySelector('.section:nth-child(3) .ateFood');
                        dinnerCircle= document.querySelector('.section:nth-child(3) .circle');
                        if (dinnerSection.innerHTML.trim() !== '') {
                            dinnerSection.innerHTML += ', ';
                        }
                        dinnerSection.innerHTML += foodEntry;
                        // dinnerCircle.innerHTML = ingredients.find(ingredient => ingredient.mealCode === foodInfo.mealCode)?.total_calories;
                    }
                }
                for (var i = 0; i < ingredients.length; i++) {
                    var foodInfo = ingredients[i];

                    if (foodInfo.mealCode === 0) {
                        morningCircle = document.querySelector('.section:nth-child(1) .circle');
                        var currentCalories = parseInt(morningCircle.innerHTML) || 0;
                        morningCircle.innerHTML = (currentCalories + parseInt(foodInfo.total_calories)).toFixed(0);
                    } else if (foodInfo.mealCode === 1) {
                        lunchCircle = document.querySelector('.section:nth-child(2) .circle');
                        var currentCalories = parseInt(lunchCircle.innerHTML) || 0;
                        lunchCircle.innerHTML = (currentCalories + parseInt(foodInfo.total_calories)).toFixed(0);
                    } else if (foodInfo.mealCode === 2) {
                        dinnerCircle = document.querySelector('.section:nth-child(3) .circle');
                        var currentCalories = parseInt(dinnerCircle.innerHTML) || 0;
                        dinnerCircle.innerHTML = (currentCalories + parseInt(foodInfo.total_calories)).toFixed(0);
                    }
                }
            },
            error: function (error) {
                // 오류 발생 시 실행할 코드
                console.error('오류 발생:', error);
            }
        });
    }
</script>

</html>