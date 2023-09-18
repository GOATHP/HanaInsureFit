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
                    <li><a href="/recommendInsu">건강등급보험추천</a></li>
                    <li><a href="/weightManage">내 건강관리</a></li>
                    <li><a href="/recommendFood">식당추천</a></li>
                    <li><a href="/discount">보험할인액 조회</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<div id="main2">
    <main>
        <div class="autoplay">
            <div class="slider">
                <div class="slide-image">
                    <a href="eventCoffee.jsp">
                        <img src="resources/static/image/운동전카페인.png" alt="운동전카페인" id="image1">
                    </a>
                    <a href="calander.jsp">
                        <img src="resources/static/image/다이어트챌린지.png" alt="다이어트챌린지" id="image2">
                    </a>
                </div>
                <div class="boxes">
                    <div class="box" style="background-color: #323850;"><a href="weightManage">체중관리</a></div>
                    <div class="box"><a href="recommendFood">식당추천</a></div>
                    <div class="box"><a href="recommendInsu">보험추천</a></div>
                    <div class="box" style="background-color: #323850;"><a href="weightManage">환급금조회</a></div>
                </div>
            </div>
        </div>
        <div class="controlBar">

        </div>
        <div class="middleCon">
            <div class="section">
                <a href="/calendar">
                    캘린더
                </a>
                <div class="subSection">
                    변화를 기록해보세요!
                </div>
            </div>
            <div class="section">
                <a href="/pastMe">
                    과거의 나
                </a>
                <div class="subSection">
                    변화를 확인해보세요!
                </div>
            </div>
            <div class="section">
                <a href="/InsureFitWith">
                    InsureFitWith
                </a>
                <div class="subSection">
                    변화를 함께해보세요!
                </div>
            </div>
            <div class="section">
                <a href="/costCheck">
                    절약비용조회
                </a>
                <div class="subSection">
                    변화를 체감해보세요!
                </div>
            </div>
        </div>
    </main>
</div>
<div class="modal">
    <div class="modal_body">
<%--        <form action="/loginMember" id="loginForm" method="post">--%>
    <img src="resources/static/image/플젝로고.png" alt="프로젝트 로고">
        로그인
        <table>
                <tr>
                    <th>
                        <label for="customerID">아이디</label>
                    </th>
                    <td>
                        <input type="text" id="customerID" name="customerID">
                    </td>
                </tr>
                <tr>
                    <th>
                        <label for="password">비밀번호</label>
                    </th>
                    <td>
                        <input type="password" id="password" name="password">
                    </td>
                </tr>
            </table>
            <input type="button" class="login-button" value="로그인" onclick="loginFormFunc()">
<%--        </form>--%>
    </div>
</div>
<footer id="footer">
    <div>Contact us | 개인정보처리방침 | 고객정보취급방침 | 건강한 소리(부정제보) | 인천 서구 에코로 167 하나금융그룹 통합데이터센터 비전센터 5층 | Copyright ©
        Hana TI 2019. ALL RIGHT RESERVE</div>
</footer>
<script>
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
</body>
</html>