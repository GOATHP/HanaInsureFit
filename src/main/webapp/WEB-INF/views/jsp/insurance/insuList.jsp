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
            <a href="/insuList" class="sideBarTabClicked">
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
            <div class="navInfo">Main &nbsp&nbsp> &nbsp&nbsp보험추천&nbsp&nbsp > &nbsp&nbsp건강등급보험목록</div>
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
            <div class="areaContainer">

                <div class="rightArea3">
                    <div class="centerAlign">
                        건강등급 보험 목록
                    </div>
                    <div id="gradeCalculation">
                        <table>
                            <tr>
                                <th>
                                    <a href="/insuJoin">
                                        <img class="insuComLogo" src="https://www.hanafn.com:8002/assets/img/ko/info/img-hana-symbol.png">
                                        하나손해보험
                                    </a>
                                </th>
                                <td>
                                    <a href="/insuJoin">
                                        (무)하나 Grade 건강보험(다이렉트)
                                    </a>
                                </td>
                                <td>
                                    <a href="/insuJoin">
                                        70,000원/월
                                    </a>
                                </td>
                            </tr>

                            <tr>
                                <th><img class="insuComLogoLotte1"
                                         src="data:image/jpeg;base64,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">
                                    MG손해보험
                                </th>
                                <td>(무)다이렉트DIY마이플랜종합보험
                                </td>
                                <td>70,000원/월
                                </td>
                            </tr>
                            <tr>
                                <th><img class="insuComLogoLotte2"
                                         src="https://cdn.kbanker.co.kr/news/photo/202303/208721_57181_750.jpg">
                                    ABL생명
                                </th>
                                <td>(무)ABL건강하면THE소중한종신보험(해약환급금 일부지급형)
                                </td>
                                <td>70,000원/월
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