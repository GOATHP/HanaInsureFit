<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>하나 InsureFit</title>
    <link href="resources/static/css/style.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<script>
    function showGradeCalculation() {
        document.getElementById('gradeCalculation').style.display = 'block';
        document.getElementById('gradeRegistration').style.display = 'none';
    }

    function showGradeRegistration() {
        document.getElementById('gradeRegistration').style.display = 'block';
        document.getElementById('gradeCalculation').style.display = 'none';
    }
</script>

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
                    <a href="/Introduce">
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
                    <a href="main.html">
                        <img src="resources/static/image/플젝로고.png" alt="프로젝트 로고">
                    </a>
                </div>
                <ul>
                    <li><a href="/introduce">하나Insure Fit이란?</a></li>
                    <li><a href="/recommendInsu" class="clicked">건강등급보험추천</a></li>
                    <li><a href="/weightManage">내 건강관리</a></li>
                    <li><a href="/recommendFood">식당추천</a></li>
                    <li><a href="/discount">보험할인액 조회</a></li>
                    <!-- 다른 메뉴 항목 추가 -->
                </ul>
            </nav>
        </div>
    </div>
</header>
<div class="mainSideContainer">
    <div class="sideBar">
        <div class="sideBarName">
            보험추천
        </div>
        <div class="sideBarContents">
            <a href="/recommendInsu" class="sideBarTab">
                건강등급산출
            </a>
            <a href="/insuGradeSubmit" class="sideBarTab">
                건강등급등록
            </a>
            <a href="/insuList" class="sideBarTab">
                건강등급보험목록
            </a>
            <a href="/insuJoin" class="sideBarTabClicked">
                건강등급보험가입
            </a>
            <a href="/insuRead" class="sideBarTab">
                내 건강등급보험 조회
            </a>
        </div>
    </div>
    <div id="main">
        <main>
            <div class="navInfo">Main &nbsp&nbsp> &nbsp&nbsp건강등급보험추천&nbsp&nbsp > &nbsp&nbsp건강등급보험가입</div>


            <div class="areaContainer">

                <div class="rightArea3">
                    <div class="centerAlign">
                        하나 Grade 건강보험 가입
                    </div>
                    <div class="gradeInsurance">
                        하나InsureFit<br>
                        무배당 하나 Grade 건강보험(다이렉트)<br>
                        보험사 : 하나InsureFit<br>
                        가입나이 : 19~60세<br>
                        납입방법 : 보장(담보)총3종, 80세만기, 20년납, 순수보장형, 해지환급금이 없는 유형<br>
                        전화로 가입을 권유하지 않으니, 안심하고 보험가입 진행하세요.<br>

                    </div>
                    <a href="/insuAgreement" class="joinButton">
                        보험 가입하기
                    </a>
                    </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<footer id="footer">
    <div>Contact us | 개인정보처리방침 | 고객정보취급방침 | 건강한 소리(부정제보) | 인천 서구 에코로 167 하나금융그룹 통합데이터센터 비전센터 5층 | Copyright ©
        Hana TI 2019. ALL RIGHT RESERVE</div>
</footer>

</body>

</div>
</html>