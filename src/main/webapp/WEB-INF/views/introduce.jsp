<%--
  Created by IntelliJ IDEA.
  User: ajou
  Date: 2023-09-05
  Time: 오후 7:26
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
                    <li><a href="/introduce" class="clicked">하나Insure Fit이란?</a></li>
                    <li><a href="/recommendInsu">Grade보험</a></li>
                    <li><a href="/weightManage">건강관리</a></li>
                    <li><a href="/myPage">마이페이지</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<div id="main3">
    <div style="
                    display: flex;
                    align-content: center;
                    width: 100%;
                    align-items: center;
                    justify-content: center;
                    margin-top: 20px;
                    ">
        <div class="sideBarName" style="width: 200px; margin-top:20px; margin-bottom: 0px; text-align: center;">
            서비스 소개
        </div>
    </div>
    <div class ="slogan" style="margin-top:20px;">
        <img src="resources/static/image/슬로건.png" width="70%">
        <div class="title" >
            <h1>하나 InsureFit</h1>
            <p>건강할수록 더 낮은 보험료로 든든하게!<br>
                하나 Grade 건강보험으로 합리적인 보험료 내고 동일한 보장받으세요. </p>
        </div>
    </div>

    <div class="introContainer">
        <div class="benefit">
            <h2>1. 건강 관리 & 보험료 절약</h2>
            <p>"하나 InsureFit"은 건강한 라이프스타일을 촉진하고 보험료를 절약하는 혁신적인 서비스입니다. <br>
                건강한 체중을 유지하면 만성 질환의 위험을 줄이고 더 나은 생활을 즐길 수 있습니다.<br>
                우리의 서비스는 건강 관리 성공으로 얻을 수 있는 보험료 할인을 통해 이러한 두 가지 이점을 연결합니다.</p>
        </div>
        <div class="benefit">
            <h2>2. 개인 맞춤 건강 관리</h2>
            <p>"하나 InsureFit"은 개인의 건강 상태, 목표 및 선호도를 고려하여 맞춤형 체중 관리 계획을 제공합니다.<br>
                영양 전문가와 트레이너의 지도 아래에서 효과적이고 지속 가능한 체중감량을 달성하실 수 있습니다.</p>
        </div>
    </div>
    <div class="introContainer">
        <div class="benefit">
            <h2>3. 보험료 할인 혜택</h2>
            <p>우리와 함께하는 회원들은 건강한 체중 관리 성공으로 얻을 수 있는 혜택을 누릴 수 있습니다.<br>
                "하나 InsureFit"은 다양한 하나손해보험과의 제휴를 통해 건강한 라이프스타일을
                증명한 회원들에게 보험료 할인 혜택을 제공합니다.</p>
        </div>
        <div class="benefit">
            <h2>4. 건강한 미래를 위한 커뮤니티</h2>
            <p>"하나 InsureFit" 회원들은 건강한 미래를 향한 공동체에 참여하게 됩니다.<br>
                영감을 주고 서로를 지지하는 커뮤니티를 통해 건강한 라이프스타일을 유지하는 데 동기를 얻으세요.
            </p>
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