<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>하나 InsureFit</title>
    <link href="resources/static/css/style.css" rel="stylesheet">

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
            <a href="/recommendInsu" class="sideBarTabClicked">
                건강등급산출
            </a>
            <a href="/insuGradeSubmit" class="sideBarTab">
                건강등급등록
            </a>
            <a href="/insuList" class="sideBarTab">
                건강등급보험목록
            </a>
            <a href="/insuJoin" class="sideBarTab">
                건강등급보험가입
            </a>
            <a href="/insuRead" class="sideBarTab">
                내 건강등급보험 조회
            </a>
        </div>
    </div>
    <div id="main">
        <main>
            <div class="navInfo">Main &nbsp&nbsp> &nbsp&nbsp보험추천&nbsp&nbsp > &nbsp&nbsp건강등급등록</div>

            <div class="areaContainer">

                <div class="insuMoongoo"><br>
                    <div class="insuInfo">
                        <span class="colorText">건강등급</span> 확인하고<br> <span class="colorText">보험료 할인</span>받으세요!
                        <div class="explainInsu">
                            에너지 효율이 높은 등급의 전기제품을 구입하여<br>
                            전기료를 절약하고 계신가요?<br>
                            이젠 보험도 건강 등급이 높으면 보험료를 할인하여<br>
                            드립니다.
                        </div>
                    </div>
                </div>



                <div class="rightArea">
                    <div class="centerAlign">
                        건강등급을 산출해주세요!
                    </div>
                    <div id="gradeCalculation">
                        <table>
                            <tr>
                                <th><img class="insuComLogo1"
                                         src="https://www.hanafn.com:8002/assets/img/ko/info/img-hana-symbol.png">

                                    <!-- <img class="QRCode" src="images/하나손해보험QR.png"> -->
                                </th>
                                <td>하나손해보험에서 산출하기
                                    <div class="qr-description">QR를 촬영하시면, 건강등급 산출 화면으로 이동합니다. <img class="QRCode" src="resources/static/image/하나손해보험QR.png"></div>
                                </td>
                            </tr>

                            <tr>
                                <th><img class="insuComLogo"
                                         src="https://logo-resources.thevc.kr/products/200x200/3598ce6f965b2481fe26316c06b30950c46ac7f8e7229f104aa78f579997668d_1689313853784586.jpg">
                                    <!-- <img class="QRCode" src="images/로그QR.png"> -->
                                </th>
                                <td>로그어플에서 산출하기

                                    <div class="qr-description">QR를 촬영하시면, 건강등급 산출 화면으로 이동합니다. <img class="QRCode" src="resources/static/image/로그QR.png"></div>

                                </td>
                            </tr>
                        </table>
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

</html>