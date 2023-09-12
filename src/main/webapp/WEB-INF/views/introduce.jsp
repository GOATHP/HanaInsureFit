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
                <li class="item"><a href="/joinMember">회원가입</a></li>
                <li class="item"><a href="/loginMember">로그인</a></li>
            </ul>
        </div>
        <div class="menu">
            <nav>
                <div class="logo">
                    <a href="/">
                        <img src="image/플젝로고.png" alt="프로젝트 로고">
                    </a>
                </div>
                <ul>
                    <li><a href="/introduce" class="clicked">하나Insure Fit이란?</a></li>
                    <li><a href="/recommendInsu">건강등급보험추천</a></li>
                    <li><a href="/weightManage">내 건강관리</a></li>
                    <li><a href="/recommendFood">식당추천</a></li>
                    <li><a href="/discount">보험할인액 조회</a></li>
                    <!-- 다른 메뉴 항목 추가 -->
                </ul>
            </nav>
        </div>
    </div>
</header>
<div id="main3">
    <div class ="slogan">
        <img src="resources/static/image/슬로건.png" width="70%">
        <div class="title">
            <h1>하나 InsureFit</h1>
            <p>건강할수록 더 낮은 보험료로 든든하게!<br>
                하나 Grade 건강보험으로 합리적인 보험료 내고 동일한 보장받으세요. </p>
        </div>
    </div>

    <div class="introContainer">
        <div class="benefit">
            <h2>1. 건강 관리 X 보험료 절약</h2>
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
                "하나 InsureFit"은 다양한 협력 보험사와의 제휴를 통해 건강한 라이프스타일을
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

<footer id="footer">
    <div>Contact us | 개인정보처리방침 | 고객정보취급방침 | 건강한 소리(부정제보) | 인천 서구 에코로 167 하나금융그룹 통합데이터센터 비전센터 5층 | Copyright ©
        Hana TI 2019. ALL RIGHT RESERVE</div>
</footer>
</body>

</html>