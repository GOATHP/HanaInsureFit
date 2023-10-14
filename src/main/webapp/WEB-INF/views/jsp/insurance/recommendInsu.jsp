<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>하나 InsureFit</title>
    <link href="resources/static/css/style.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        /*html,*/
        /*body {*/
        /*    padding: 0;*/
        /*    margin: 0;*/
        /*}*/

        /*html,*/
        /*body,*/
        /*input,*/
        /*button,*/
        /*textarea {*/
        /*    !*font: 100%/1.4 "Source Sans Pro", "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;*!*/
        /*}*/
        /*.wrapper {*/
        /*    min-width: 290px;*/
        /*    max-width: 800px;*/
        /*    padding-left: 1em;*/
        /*    padding-right: 1em;*/
        /*    margin-left: auto;*/
        /*    margin-right: auto;*/
        /*}*/

        .text-giga { line-height: 1; font-size: 24px; font-weight: 300; }
        .pad-top    { padding-top: 1em; }
        .space-out { margin: 100px; }


        /*-------------------------------------------
            $ Loaders
        -------------------------------------------*/

        .loader {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin: 3em;
            display: inline-block;
            position: relative;
            vertical-align: middle;
        }
        .loader,
        .loader:before,
        .loader:after {
            animation: 1s infinite ease-in-out;
        }
        .loader:before,
        .loader:after {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            position: absolute;
            top: 0;
            left: 0;
        }

        .loader-9,
        .loader-10 {
            background-color: white;
            animation: loader9 0.4s infinite linear;
        }
        .loader-10 {
            animation: loader10 60s infinite ease-in-out;
        }
        .loader-9:before,
        .loader-10:before {
            content: '';
            width: 80%;
            height: 80%;
            background-color: white;
            top: 10%;
            left: 10%;
            box-shadow: 5px -3px 0 rgba(255,100,100,0.7),
            5px 5px 0 rgba(100,255,100,0.7),
            -3px 5px 0 rgba(100,100,255,0.7),
            -5px -5px 0 rgba(240,240,120,0.7);
        }
        .loader-9:after,
        .loader-10:after {
            content: '';
            border: 3px solid white;
            z-index: 2;
            top: -3px;
            left: -3px;
        }

        @keyframes loader9 {
            0%   { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        @keyframes loader10 {
            0%   { transform: rotate(0deg); }
            100% { transform: rotate(360000deg); }
        }
        .modall {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background: #00000075;
        }
        .modall2 {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background: #00000075;
        }

        .modal-content {
            background-color: #ffffff;
            margin: 15% auto;
            padding: 20px;
            width: 450px;
            height: 650px;
            border-radius: 20px;
            margin-top:100px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close2 {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .phone-container{
            width: 100%;
            text-align: center;
            margin-top: 30px;
            display: flex;
            justify-content: center;
        }
        .login{
            color: #000000;
            text-align: center;
            display: inline-block;
        }
        .login img{
            width: 300px;
            margin: 50px auto;
        }
        #phone-number, #auth-number{
            width: 100%;
            /*border-radius: 10px;*/
            height: 50px;
            float: left;
            display: flex;
            border: 1px solid gainsboro;
            /*mix-blend-mode: normal;*/
            /*box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);*/
            /*margin: 10px 0 5px 0;*/
            /*background: 0;*/

            /*border-bottom: solid 3px #b1b1b1;*/
            color: black;
        }
        #phone-number::placeholder, #auth-number::placeholder{
            text-align: left;
            color: white;
            background: 0;
        }
        .confirm-button,  #auth-req-button{
            align-items: center;
            justify-content: center;
            width: 25%;
            float: right;
            /*border: 1px solid #a7a9a9;*/
            background-color: #a7a9a9;
            mix-blend-mode: normal;
            color: white;
            /*box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);*/
            border-radius: 0px;
            height:50px;
            /*margin: 10px 0 14px 0;*/
            color: white;
            font-weight: 700;
            border: 1px solid gainsboro;
            /*padding: 15px 0;*/
            /*font-size: 15px;*/

        }
        .authbox{
            width: 100%;
        }
    </style>
    <script>
        function collapse(element) {
            var before = document.getElementsByClassName("active")[0]               // 기존에 활성화된 버튼
            if (before && document.getElementsByClassName("active")[0] != element) {  // 자신 이외에 이미 활성화된 버튼이 있으면
                before.nextElementSibling.style.maxHeight = null;   // 기존에 펼쳐진 내용 접고
                before.classList.remove("active");                  // 버튼 비활성화
            }
            element.classList.toggle("active");         // 활성화 여부 toggle

            var content = element.nextElementSibling;
            if (content.style.maxHeight != 0) {         // 버튼 다음 요소가 펼쳐져 있으면
                content.style.maxHeight = null;         // 접기
            } else {
                content.style.maxHeight = content.scrollHeight + "px";  // 접혀있는 경우 펼치기
            }
        }
    </script>
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
                <%
                    String name = (String) session.getAttribute("name");
                    String customerID = (String) session.getAttribute("customerID");
                    if (name != null) {
                %>
                <div class="welcomeMent" id="customerID" data-customerID="<%=customerID%>"><%= name %> (<%=customerID%>)님 환영합니다</div>
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
                    <li><a href="/recommendInsu" class="clicked">Grade보험</a></li>
                    <li><a href="/weightManage">건강관리</a></li>
                    <li><a href="/dashboardMypage">마이페이지</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<div class="mainSideContainer">
    <div class="sideBar">
        <div class="sideBarName">
            Grade보험
        </div>
        <div class="sideBarContents">
            <a href="/recommendInsu" class="sideBarTabClicked">
                건강등급
            </a>
<%--            <a href="/insuGradeSubmit" class="sideBarTab">--%>
<%--                건강등급등록--%>
<%--            </a>--%>
            <a href="/insuList" class="sideBarTab">
                Grade보험목록
            </a>
<%--            <a href="/insuJoin" class="sideBarTab">--%>
<%--                Grade보험가입--%>
<%--            </a>--%>

        </div>
    </div>

    <div id="main">
        <main>
            <div class="navInfo">Main &nbsp&nbsp> &nbsp&nbspGrade보험 &nbsp&nbsp> &nbsp&nbsp건강등급&nbsp&nbsp</div>

            <div class="areaContainer" style="flex-direction: column;
                 align-items: center";>
                <div style="display: flex">
                    <img src="resources/static/image/Grades.png" style="width: 520px;height: 250px;margin-top: 20px;">
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
                </div>

<%--                    <div id="gradeCalculation">--%>

                <a href="#" id="recommendInsuLink">
                    <div class="box" style="justify-content: center;align-items: center;color:#fff;margin: 0 auto; width: 160px; height: 80px" onclick="phoneAuth2()">건강등급 산출</div>
                </a>

                <%--                        <table>--%>
<%--                            <tr>--%>
<%--                                <th><img class="insuComLogo1"--%>
<%--                                         src="https://www.hanafn.com:8002/assets/img/ko/info/img-hana-symbol.png">--%>

<%--                                    <!-- <img class="QRCode" src="images/하나손해보험QR.png"> -->--%>
<%--                                </th>--%>
<%--                                <td>하나손해보험에서 산출하기--%>
<%--                                    <div class="qr-description">QR를 촬영하시면, 건강등급 산출 화면으로 이동합니다. <img class="QRCode" src="resources/static/image/하나손해보험QR.png"></div>--%>
<%--                                </td>--%>
<%--                            </tr>--%>

<%--                            <tr>--%>
<%--                                <th><img class="insuComLogo"--%>
<%--                                         src="https://logo-resources.thevc.kr/products/200x200/3598ce6f965b2481fe26316c06b30950c46ac7f8e7229f104aa78f579997668d_1689313853784586.jpg">--%>
<%--                                    <!-- <img class="QRCode" src="images/로그QR.png"> -->--%>
<%--                                </th>--%>
<%--                                <td>로그어플에서 산출하기--%>

<%--                                    <div class="qr-description">QR를 촬영하시면, 건강등급 산출 화면으로 이동합니다. <img class="QRCode" src="resources/static/image/로그QR.png"></div>--%>

<%--                                </td>--%>
<%--                            </tr>--%>
<%--                        </table>--%>
                    </div>

            <br>
            <h2>보장내용</h2>
            <button type="button" class="collapsible" onclick="collapse(this);">건강등급이란?</button>
            <div class="content">
                <p><ul>
                <li class="txt_dot">피보험자의 건강등급에 해당하는 건강등급별 할인율에 따라 보험료를 할인하여
                    드립니다.</li>
                <li class="txt_dot">건강등급이란 성별, 연령, 건강상태, 의료이용정보 등을 기준으로 피보험자의
                    상대적인 건강상태 수준을 등급화한 지표를 말합니다. 건강등급은 1등급부터 9등급까지 산정되며 1등급에 가까울수록 건강상태가
                    양호하다는 것을 의미합니다.</li>
                <li class="txt_dot">건강등급은 건강등급 산출 시스템을 운영하고 건강등급 정보를 제공하는 회사의
                    건강등급 산출시스템을 통해 산출됩니다.</li>
                <li class="txt_dot">건강등급은 청약 시 산정된 건강등급을 최초로 적용하며, 1년 주기로 재산정하여
                    건강등급이 변경된 경우에는 변경된 건강등급을 기준으로 보험료를 할인하여 드립니다.</li>
                <li class="txt_dot">건강등급은 보험료 할인을 제공하기 위해 사용하는 건강 지표로,
                    계약인수심사기준으로는 활용되지 않습니다.</li>
                </ul>
                <div class="img mt30"><img src="resources/static/image/건강등급산출과정.jpg" style="width:100%;"></div>
                <p class="stit">[건강등급별 보험료 할인율]</p>
                <table class="insuTable">
                    <colgroup>
                        <col style="width: 8%;">
                        <col style="width: 11%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">

                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">구분</th>
                        <th scope="col">건강등급</th>
                        <th scope="col">Grade 1</th>
                        <th scope="col">Grade 2</th>
                        <th scope="col">Grade 3</th>
                        <th scope="col">Grade 4</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th rowspan="2" scope="row">할인율</th>
                        <td class="center">주계약</td>
                        <td class="center">38.0%</td>
                        <td class="center">18.0%</td>
                        <td class="center">0.0%</td>
                        <td class="center">0.0%</td>
                    </tr>
                    <tr>
                        <td class="center">선택특약</td>
                        <td class="center">40.0%</td>
                        <td class="center">20.0%</td>
                        <td class="center">0.0%</td>
                        <td class="center">0.0%</td>
                    </tr>
                    </tbody>
                </table>
                <ul>
                    <li class="txt_dot">건강등급이 Grade 1 ~ 2경우에 한하여 보험료 할인이 적용되며, 해당하지 않는 경우에는 보험료 할인이 적용되지 않습니다.</li>
                    <li class="txt_dot">건강등급은 건강등급 적용 특약의 보험기간 중 1년 주기로 재산정하여 변경
                        적용하며, 건강등급이 변경된 경우에는 변경된 건강등급을 기준으로 보험료 할인이 적용됩니다.</li>
                    <li class="txt_dot">[ 0등급 ] 피보험자의 건강등급 정보가 충분하지 않아 건강등급 산출이 불가능한
                        경우</li>
                    <li class="txt_dot">[ 등급정보 없음 ] 피보험자가 건강등급을 산출하지 않거나, 건강등급 미적용을
                        선택한 경우</li>
                </ul>
                </p>
            </div>
            <button type="button" class="collapsible" onclick="collapse(this);">가입을 위한 안내</button>
            <div class="content">
                <p>
                <p class="stit">주계약</p>
                <table class="insuTable">

                    <colgroup>
                        <col style="width: 150px;">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th colspan="3" scope="col">구분</th>
                        <th scope="col">보험기간</th>
                        <th scope="col">보험료 납입기간</th>
                        <th scope="col">피보험자 가입나이</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row" class="left" rowspan="6">Grade 건강보험<br>
                            THE소중한종신보험<br>
                            (해약환급금<br> 일부지급형)2304</th>
                        <th scope="row" rowspan="2" class="left">1종(평준형)</th>
                        <th scope="row" class="left">해약환급금<br> 일부지급형(50%)</th>
                        <td class="center" rowspan="6">종신</td>
                        <td class="center" rowspan="6">5년납, 7년납,<br>
                            10년납, 15년납,<br>
                            20년납, 55세납,<br>
                            60세납, 65세납,<br>
                            70세납, 75세납,<br> 80세납</td>
                        <td class="center" rowspan="6">만 15세 ~ 70세</td>
                    </tr>
                    <tr>
                        <th scope="row" class="left">기본형</th>
                    </tr>
                    <tr>
                        <th scope="row" rowspan="2" class="left">2종(체감형)</th>
                        <th scope="row" class="left">해약환급금<br> 일부지급형(50%)</th>
                    </tr>
                    <tr>
                        <th scope="row" class="left">기본형</th>
                    </tr>
                    <tr>
                        <th scope="row" rowspan="2" class="left">3종(체증형)</th>
                        <th scope="row" class="left">해약환급금<br> 일부지급형(50%)</th>
                    </tr>
                    <tr>
                        <th scope="row" class="left">기본형</th>
                    </tr>
                    </tbody>
                </table>
                <ul>
                    <li class="txt_dot">피보험자 가입나이는 보험종별, 보험기간, 보험료 납입기간에 따라 달라질 수 있습니다.</li>
                    <li class="txt_dot">특약별 보험기간, 보험료 납입기간, 피보험자 가입나이는 주계약과 상이하므로 보험약관 및 상품설명서를 확인하시기바 랍니다.</li>
                </ul>
                </p>
            </div>
            <button type="button" class="collapsible" onclick="collapse(this);">보험료 예시표</button>
            <div class="content">

                <p>
                <p class="stit">주계약 보험료<span class="basis">*기준 : 주계약 보험가입금액 1억원, 20년납, 월납, 단위:원</span></p>
                <table class="insuTable">

                <colgroup>
                    <col style="width: 11%;">
                    <col style="width: 12%;">
                    <col style="width: 11%;">
                    <col style="width: 11%;">
                    <col style="width: 11%;">
                    <col style="width: 11%;">
                    <col style="width: 11%;">
                    <col style="width: 11%;">
                </colgroup>
                <thead>
                <tr>
                    <th class="left" colspan="3" rowspan="2" scope="col">구 분</th>
                    <th colspan="3" scope="col">남자</th>
                    <th colspan="3" scope="col">여자</th>
                </tr>
                <tr>
                    <th scope="col">30세</th>
                    <th scope="col">40세</th>
                    <th scope="col">50세</th>
                    <th scope="col">30세</th>
                    <th scope="col">40세</th>
                    <th scope="col">50세</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th class="left" rowspan="8" scope="row">1종(평준형)</th>
                    <th class="left" colspan="2" scope="row">해약환급금 일부지급형(50%)</th>
                    <td class="right">185,000</td>
                    <td class="right">229,000</td>
                    <td class="right">290,000</td>
                    <td class="right">163,000</td>
                    <td class="right">199,000</td>
                    <td class="right">247,000</td>
                </tr>
                <tr>
                    <th class="left" rowspan="3" scope="row">건강등급</th>
                    <th class="left" scope="row">Grade 1</th>
                    <td class="right">170,200</td>
                    <td class="right">210,680</td>
                    <td class="right">266,800</td>
                    <td class="right">149,960</td>
                    <td class="right">183,080</td>
                    <td class="right">227,240</td>
                </tr>
                <tr>
                    <th class="left" scope="row">Grade 2</th>
                    <td class="right">172,050</td>
                    <td class="right">212,970</td>
                    <td class="right">269,700</td>
                    <td class="right">151,590</td>
                    <td class="right">185,070</td>
                    <td class="right">229,710</td>
                </tr>
                <tr>
                    <th class="left" scope="row">기타</th>
                    <td class="right">175,750</td>
                    <td class="right">217,550</td>
                    <td class="right">275,500</td>
                    <td class="right">154,850</td>
                    <td class="right">189,050</td>
                    <td class="right">234,650</td>
                </tr>
                <tr>
                    <th class="left" colspan="2" scope="row">기본형</th>
                    <td class="right">206,000</td>
                    <td class="right">256,000</td>
                    <td class="right">324,000</td>
                    <td class="right">181,000</td>
                    <td class="right">223,000</td>
                    <td class="right">278,000</td>
                </tr>
                <tr>
                    <th class="left" rowspan="3" scope="row">건강등급</th>
                    <th class="left" scope="row">Grade 1</th>
                    <td class="right">189,520</td>
                    <td class="right">235,520</td>
                    <td class="right">298,080</td>
                    <td class="right">166,520</td>
                    <td class="right">205,160</td>
                    <td class="right">255,760</td>
                </tr>
                <tr>
                    <th class="left" scope="row">Grade 2</th>
                    <td class="right">191,580</td>
                    <td class="right">238,080</td>
                    <td class="right">301,320</td>
                    <td class="right">168,330</td>
                    <td class="right">207,390</td>
                    <td class="right">258,540</td>
                </tr>
                <tr>
                    <th class="left" scope="row">기타</th>
                    <td class="right">195,700</td>
                    <td class="right">243,200</td>
                    <td class="right">307,800</td>
                    <td class="right">171,950</td>
                    <td class="right">211,850</td>
                    <td class="right">264,100</td>
                </tr>

                <tr>
                    <th class="left" rowspan="8" scope="row">2종(체감형)</th>
                    <th class="left" colspan="2" scope="row">해약환급금 일부지급형(50%)</th>
                    <td class="right">121,000</td>
                    <td class="right">145,000</td>
                    <td class="right">177,000</td>
                    <td class="right">101,000</td>
                    <td class="right">120,000</td>
                    <td class="right">144,000</td>
                </tr>
                <tr>
                    <th class="left" rowspan="3" scope="row">건강등급</th>
                    <th class="left" scope="row">Grade 1</th>
                    <td class="right">111,320</td>
                    <td class="right">133,400</td>
                    <td class="right">162,840</td>
                    <td class="right">92,920</td>
                    <td class="right">110,400</td>
                    <td class="right">132,480</td>
                </tr>
                <tr>
                    <th class="left" scope="row">Grade 2</th>
                    <td class="right">112,530</td>
                    <td class="right">134,850</td>
                    <td class="right">164,610</td>
                    <td class="right">93,930</td>
                    <td class="right">111,600</td>
                    <td class="right">133,920</td>
                </tr>
                <tr>
                    <th class="left" scope="row">기타</th>
                    <td class="right">114,950</td>
                    <td class="right">137,750</td>
                    <td class="right">168,150</td>
                    <td class="right">95,950</td>
                    <td class="right">114,000</td>
                    <td class="right">136,800</td>
                </tr>
                <tr>
                    <th class="left" colspan="2" scope="row">기본형</th>
                    <td class="right">131,000</td>
                    <td class="right">157,000</td>
                    <td class="right">191,000</td>
                    <td class="right">109,000</td>
                    <td class="right">130,000</td>
                    <td class="right">156,000</td>
                </tr>
                <tr>
                    <th class="left" rowspan="3" scope="row">건강등급</th>
                    <th class="left" scope="row">Grade 1</th>
                    <td class="right">120,520</td>
                    <td class="right">144,440</td>
                    <td class="right">175,720</td>
                    <td class="right">100,280</td>
                    <td class="right">119,600</td>
                    <td class="right">143,520</td>
                </tr>
                <tr>
                    <th class="left" scope="row">Grade 2</th>
                    <td class="right">121,830</td>
                    <td class="right">146,010</td>
                    <td class="right">177,630</td>
                    <td class="right">101,370</td>
                    <td class="right">120,900</td>
                    <td class="right">145,080</td>
                </tr>
                <tr>
                    <th class="left" scope="row">기타</th>
                    <td class="right">124,450</td>
                    <td class="right">149,150</td>
                    <td class="right">181,450</td>
                    <td class="right">103,550</td>
                    <td class="right">123,500</td>
                    <td class="right">148,200</td>
                </tr>

                <tr>
                    <th class="left" rowspan="8" scope="row">3종(체증형)</th>
                    <th class="left" colspan="2" scope="row">해약환급금 일부지급형(50%)</th>
                    <td class="right">261,000</td>
                    <td class="right">323,000</td>
                    <td class="right">404,000</td>
                    <td class="right">229,000</td>
                    <td class="right">282,000</td>
                    <td class="right">351,000</td>
                </tr>
                <tr>
                    <th class="left" rowspan="3" scope="row">건강등급</th>
                    <th class="left" scope="row">Grade 1</th>
                    <td class="right">240,120</td>
                    <td class="right">297,160</td>
                    <td class="right">371,680</td>
                    <td class="right">210,680</td>
                    <td class="right">259,440</td>
                    <td class="right">322,920</td>
                </tr>
                <tr>
                    <th class="left" scope="row">Grade 2</th>
                    <td class="right">242,730</td>
                    <td class="right">300,390</td>
                    <td class="right">375,720</td>
                    <td class="right">212,970</td>
                    <td class="right">262,260</td>
                    <td class="right">326,430</td>
                </tr>
                <tr>
                    <th class="left" scope="row">기타</th>
                    <td class="right">247,950</td>
                    <td class="right">306,850</td>
                    <td class="right">383,800</td>
                    <td class="right">217,550</td>
                    <td class="right">267,900</td>
                    <td class="right">333,450</td>
                </tr>

                <tr>
                    <th class="left" colspan="2" scope="row">기본형</th>
                    <td class="right">296,000</td>
                    <td class="right">367,000</td>
                    <td class="right">456,000</td>
                    <td class="right">258,000</td>
                    <td class="right">320,000</td>
                    <td class="right">399,000</td>
                </tr>
                <tr>
                    <th class="left" rowspan="3" scope="row">건강등급</th>
                    <th class="left" scope="row">Grade 1</th>
                    <td class="right">272,320</td>
                    <td class="right">337,640</td>
                    <td class="right">419,520</td>
                    <td class="right">237,360</td>
                    <td class="right">294,400</td>
                    <td class="right">367,080</td>
                </tr>
                <tr>
                    <th class="left" scope="row">Grade 2</th>
                    <td class="right">275,280</td>
                    <td class="right">341,310</td>
                    <td class="right">424,080</td>
                    <td class="right">239,940</td>
                    <td class="right">297,600</td>
                    <td class="right">371,070</td>
                </tr>
                <tr>
                    <th class="left" scope="row">기타</th>
                    <td class="right">281,200</td>
                    <td class="right">348,650</td>
                    <td class="right">433,200</td>
                    <td class="right">245,100</td>
                    <td class="right">304,000</td>
                    <td class="right">379,050</td>
                </tr>
                </tbody>
            </table>
                <div class="text_wrap">
                    <ul>
                        <li class="txt_dot">주계약 청약 시 건강등급의 “적용”을 선택하는 경우 피보험자는 청약일까지 건강등급을 산출해야 하며, 청약시 적용하는 건강등급은 청약일을 기준으로 그 날을 포함하여 직전 60일 이내에 산출한 건강등급 중 가장 최근에 산출한 건강등급으로 적용합니다.</li>
                        <li class="txt_dot">상기 예시는 주계약 건강등급별 할인율을 적용한 주계약 보험료 예시입니다. 선택특약을 가입하시는 경우 선택특약의 보험료는 선택특약의 건강등급별 할인율이 적용됩니다.</li>
                        <li class="txt_dot">건강등급은 건강등급 적용 특약의 보험기간 중 1년 주기로 재산정하여 변경 적용하며, 피보험자는 매년 연계약해당월의 직전월 1일부터 말일까지 건강등급을 산출해야 합니다.</li>
                        <li class="txt_dot">건강등급이 변경된 경우에는 변경된 건강등급을 기준으로 영업보험료를 할인합니다.</li>
                    </ul></div>
                </p>
            </div>
            <div id="myModal2" class="modall2">
                <div class="modal-content">
                    <span class="close2">&times;</span>
                    <div class="phone-container">
                        <div class="login">
                            <h2 class="sideBarName">건강검진이용정보동의</h2>
                            <p style="
    font-size: 18px;
">고객님의 국민건강보험공단 건강검진결과를 통해</p>
                            <p style="
    font-size: 18px;
">건강등급을 산출하고자 합니다.<br>
                            <p style="
    font-size: 18px;
"> 이를 위해 휴대폰 본인인증을 해주세요.</p>
                            <img src="https://api.linkareer.com/attachments/38236" alt="">
                            <%--                            <input type ="tel" id ="phone-number" name="phone" placeholder="전화번호를 입력해주세요">--%>
                            <%--                            <button type ="button" id ="auth-req-button">인증요청</button>--%>
                            <%--                            <p id="ViewTimer"></p>--%>

                                <button type="button" class="confirm-button" style="width: 100%;border-top: 0px; font-size:16px; background-color: #00857E;" onclick="phoneAuth()">본인인증하기</button>
                            </div>
                </div>
                </div>
            </div>

                <div id="myModal" class="modall">
                <div class="modal-content">
                    <span class="close2">&times;</span>
                    <div class="phone-container">
                        <div class="login">
                            <h2 class="sideBarName">휴대폰 인증</h2>
                            <p>안전하고 간편하게 로그인하세요.</p>
                            <p><%=name%>님의 휴대폰 인증</p>
                            <img src="resources/static/image/플젝로고.png" alt="">
<%--                            <input type ="tel" id ="phone-number" name="phone" placeholder="전화번호를 입력해주세요">--%>
<%--                            <button type ="button" id ="auth-req-button">인증요청</button>--%>
<%--                            <p id="ViewTimer"></p>--%>
                            <div class="authbox">
<%--                                <div class="loader loader-9"></div>--%>
                                <div style="display: flex;align-items: center;justify-content: center;">
                                <select id="phoneBrand" name="phoneBrand" style="height: 50px;border: 1px solid gainsboro; border-bottom: 0px;">
                                    <option value="SKT">SKT</option>
                                    <option value="KT">KT</option>
                                    <option value="LG">LG</option>
                                    <option value="SKT알뜰폰">SKT 알뜰폰</option>
                                    <option value="KT알뜰폰">KT 알뜰폰</option>
                                    <option value="LG알뜰폰">LG 알뜰폰</option>
                                </select>
                                <input type ="tel" id ="phone-number" name="phone" placeholder="전화번호를 입력해주세요" style="border-bottom: 0px; border-left:0px; border-right: 0px;">
                                <button type ="button" id ="auth-req-button" style="border-bottom: 0px; width: 106px;">인증요청</button>
                                <p id="ViewTimer"></p>
                                </div>
                                    <div style="display: flex;align-items: center;justify-content: center;">
                                <input type ="password" id ="auth-number" placeholder="인증번호를 입력해주세요">
                                <button type="button" class="confirm-button" id ="auth-res-button" style="border-left:0px; width: 77px;">확인</button>
                                    </div>
                                <button type="button" class="confirm-button" id ="join-insu-button" style="width: 100%;border-top: 0px;background-color: #00857E;">건강등급 산출하기</button>
                            </div>

                            <%--                    <a href="https://kauth.kakao.com/oauth/authorize?client_id=951e0627da48ee51855b252517b6352d--%>
                            <%--&redirect_uri=http://localhost:8080/api/social/login/kakao&response_type=code" class="kakaoa"><img class="kakao_btn" src="../../resources/images/kakaologin.png" width="30"></a>--%>
                            <%--                    <a href="https://kauth.kakao.com/oauth/logout?client_id=951e0627da48ee51855b252517b6352d&logout_redirect_uri=http://localhost:8080/logout" class="kakaoa">logout</a>--%>
                        </div>
                    </div>
                </div>
            </div>

        </main>
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
<script src="resources/static/vendor/sendCustomerIDToAWS/sendCustomerID.js"></script>
<script>
    function phoneAuth(){
        var modal = $("#myModal");
        modal.css("display", "block");
        var modal2 = $("#myModal2");
        modal2.css("display", "none");
    };
    var span = $(".close").eq(0);
    span.click(function(){
        var modal = $("#myModal");
        modal.css("display", "none");
    })
    $("#auth-res-button").click(function(){
        alert("본인 인증이 완료되었습니다.");
    });
    $("#auth-req-button").click(function() {
        $.ajax({
            type: "POST",
            url: "/checkPhone",
            dataType: "json",
            data: {
                'customerID': customerID
            },
            success: function(response) {
                console.log(response);
                alert("인증번호 전송이 완료되었습니다.")
                // $("#auth-number").val(response);
            },
            error: function(error) {
                console.error("로그인 실패 : ", error);
            }
        });
    });
</script>
<script>
    function phoneAuth2(){
        var modal = $("#myModal2");
        modal.css("display", "block");
    };
    var span = $(".close2").eq(0);
    span.click(function(){
        var modal = $("#myModal2");
        modal.css("display", "none");
    });
    // $("#auth-res-button").click(function(){
    //     alert("본인 인증이 완료되었습니다.");
    // });
    // $("#auth-req-button").click(function() {
    //     $.ajax({
    //         type: "POST",
    //         url: "/checkPhone",
    //         dataType: "json",
    //         data: {
    //             'customerID': customerID
    //         },
    //         success: function(response) {
    //             console.log(response);
    //             alert("인증번호 전송이 완료되었습니다.")
    //             // $("#auth-number").val(response);
    //         },
    //         error: function(error) {
    //             console.error("로그인 실패 : ", error);
    //         }
    //     });
    // });

</script>

</body>

</html>