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
        input:focus {
            outline: none;
        }

    </style>
    <script>var customerID = "<%=(String) session.getAttribute("customerID")%>";</script>
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
                    <ul>
                        <li><a href="/introduce">하나Insure Fit이란?</a></li>
                        <li><a href="/recommendInsu">Grade보험</a></li>
                        <li><a href="/weightManage">건강관리</a></li>
                        <li><a href="/dashboardMypage">마이페이지</a></li>
                    </ul>
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
                    <div class="box" style="background-color: #323850;"><a href="/weightManage">체중관리</a></div>
                    <div class="box"><a href="/recommendFood">식당추천</a></div>
                    <div class="box"><a href="/recommendInsu">Grade보험</a></div>
                    <div class="box" style="background-color: #323850;"><a href="/dashboardMypage">마이페이지</a></div>
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
                    변화를 확인해보세요!
                </div>
            </div>
<%--            <div class="section">--%>
<%--                <a href="/pastMe">--%>
<%--                    과거의 나--%>
<%--                </a>--%>
<%--                <div class="subSection">--%>
<%--                    변화를 확인해보세요!--%>
<%--                </div>--%>
<%--            </div>--%>
            <div class="section">
                <a href="/InsureFitWith">
                    InsureFitWith
                </a>
                <div class="subSection">
                    변화를 함께해보세요!
                </div>
            </div>
            <div class="section">
                <a href="/compareCost">
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
    <div>
    <div class="modal_body" style="display: flex;flex-direction: column;justify-content: center; width:700px; height:500px">
<%--        <form action="/loginMember" id="loginForm" method="post">--%>
    <div class="closeDiv">
        <button class="btn-close-popup">X</button>
    </div>
    <div>
    <img src="resources/static/image/loginImage.png" alt="프로젝트 로고">
<%--        style="margin-right: 30px;"--%>
        <div style="display: flex;flex-direction: column;">
            <div style="padding:14px 17px 13px;border:1px solid gray;border-radius:6px 6px 0 0;font-family: inherit;display: flex;">
            <img src="resources/static/image/IDImg.png" style="width:15px"  ><input type="text" id="customerID" name="customerID" placeholder="아이디"
            style="border:0px; font-family: inherit;">
            </div>
            <div style="padding:14px 17px 13px;border:1px solid gray;font-family: inherit;display: flex;">
            <img src="resources/static/image/PWImg.png" style="width:15px"><input type="password" id="password" name="password" placeholder="비밀번호"
            style="border:0px; border-top:0px;font-family: inherit;">
            </div>
            <input type="button" class="login-button"  value="로그인" onclick="loginFormFunc()"
                   style="margin:0px; width:330px !important; padding:14px 17px 13px;height: 50px;border-radius: 0 0 6px 6px;background-color: #00857E;font-size: 18px;font-family: inherit;">
        </div>
    </div>
</div>

    </div>
    </div>

</div>
<%--<footer id="footer">--%>

<%--        Hana TI 2019. ALL RIGHT RESERVE</div>--%>
<%--</footer>--%>
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
                    if (customerID === "admin") {
                        // If customerID is 'admin', redirect to the admin dashboard
                        window.location.href = "/dashboardAdmin";
                    }
                    else if(friendID) {
                            window.location.href = "/acceptInvite";
                    } else {
                        // If customerID is not 'admin', redirect to the default page "/"
                        window.location.href = "/";
                    }
                    // var link = document.createElement("a");
                    // link.href = "/";
                    // link.click();
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

    const currentURL = window.location.href;
    const urlParams = new URLSearchParams(currentURL.split('?')[1]);

    let friendID = null;
    try {
        friendID = urlParams.get('customerID');

        console.log(friendID);
    } catch (error) {
        console.error('파라미터를 추출하는 동안 오류가 발생했습니다.', error);
    }
    // customerID가 null 또는 빈 문자열인 경우에 대한 예외 처리
    if (!friendID) {
        console.warn('customerID 파라미터가 없습니다.');
    } else {
        // customerID를 세션에 저장합니다.
        sessionStorage.setItem('friendID', friendID);
        console.log(friendID);
    }
    var friendsID = sessionStorage.getItem('friendID');
    var friends = {
        customerID : customerID,
        friendID: friendsID  // friendID를 사용합니다.
    };
</script>
<script>
    console.log(friendsID);
    console.log(customerID);
    console.log(friends);
    document.addEventListener("DOMContentLoaded", function () {
        if (friendsID && customerID) {
            // friendID가 존재하는 경우에만 AJAX 요청을 보냅니다.
            $.ajax({
                url: '/insertFriend',
                type: "POST",
                contentType: 'application/json',
                dataType: "json",
                data: JSON.stringify(friends),
                success: function (response) {
                    console.log(response);

                },
                error: function (error) {
                    console.error(error);

                }
            });
        }
    });
</script>
</html>