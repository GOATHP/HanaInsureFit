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
<style>
    .insuTable th{
        border: 1px solid #001e1f;
        border-collapse : collapse;
        padding: 10px 5px;
        background-color: #009490;
        color:white;
    }
    .insuTable td{
        border: 1px solid #001e1f;
        border-collapse : collapse;
        padding: 10px 5px;
        font-size: 12px;
        text-align: left;
    }
</style>
<script>
    $(document).ready(function () {
        // AllInsusearching 요청을 보내고 서버로부터 보험 정보를 받아옵니다.
        $.ajax({
            type: "POST",  // HTTP GET 요청
            url: "/AllInsusearching",  // 서버 측 URL
            dataType: "json",  // 응답 데이터 타입은 JSON
            success: function (response) {
                // 서버로부터 받은 데이터를 처리합니다.
                if (response.status === "success") {
                    console.log("데이터 불러오기 성공")
                    // 보험 정보를 화면에 출력하거나 다른 처리를 수행합니다.
                    var insuList = response.data;
                    var insuranceData = [];

                    for (var i = 0; i < insuList.length; i++) {
                        var insurance = insuList[i];
                        var insuranceObj = {
                            insuContent: insurance.insuContent,
                            insuranceCompanyCode: insurance.insuranceCompanyCode,
                            insuranceCompanyName: insurance.insuranceCompanyName,
                            insuranceFee: insurance.insuranceFee,
                            insuranceProductName: insurance.insuranceProductName,
                            insuranceProductNumber: insurance.insuranceProductNumber,
                            maxAgeAtRegistration: insurance.maxAgeAtRegistration,
                            minAgeAtRegistration: insurance.minAgeAtRegistration
                        };
                        insuranceData.push(insuranceObj);
                    }

                    // 데이터를 테이블에 추가
                    appendInsuranceDataToTable(insuranceData);
                } else {
                    console.log("데이터 불러오기 실패")
                    console.error(response.message);
                }
            },
            error: function (xhr, status, error) {
                console.error("서버 오류: " + error);
            }
        });
    });

    function numberWithCommas(number) {
        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
    // 보험 정보를 테이블에 추가하는 함수
    function appendInsuranceDataToTable(insuranceData) {
        // 테이블의 tbody 요소를 가져옵니다. 여기에 데이터를 추가할 것입니다.
        var tbody = $("#insuTable tbody");


        var headerRow = $("<tr class='insuHeader'>");
        headerRow.append("<th>보험 번호</th>");
        headerRow.append("<th>회사명</th>");
        headerRow.append("<th>보험 상품명</th>");
        headerRow.append("<th>보험 내용</th>");
        headerRow.append("<th>가입 연령</th>");
        headerRow.append("<th>보험료</th>");
        tbody.append(headerRow);

        // insuranceData 배열을 순회하면서 각 보험 정보를 테이블에 추가합니다.
        for (var i = 0; i < insuranceData.length; i++) {
            var insurance = insuranceData[i];

            // 새로운 행(tr) 요소를 생성합니다.
            var newRow = $("<tr class='insuContent'>");

            // 보험 정보를 새로운 셀(td)에 추가합니다.
            newRow.append("<td><a href='/insuAgreement?insuranceProductNumber=" + insurance.insuranceProductNumber + "'>" + insurance.insuranceProductNumber + "</a></td>");
            newRow.append("<td><a href='/insuAgreement' onclick='redirectToInsuJoin(" + insurance.insuranceProductNumber + ")'>" + insurance.insuranceCompanyName + "</a></td>");
            newRow.append("<td><a href='/insuAgreement' onclick='redirectToInsuJoin(" + insurance.insuranceProductNumber + ")'>" + insurance.insuranceProductName + "</a></td>");
            newRow.append("<td><a href='/insuAgreement' onclick='redirectToInsuJoin(" + insurance.insuranceProductNumber + ")'>" + insurance.insuContent + "</a></td>");
            newRow.append("<td><a href='/insuAgreement' onclick='redirectToInsuJoin(" + insurance.insuranceProductNumber + ")'>" + insurance.minAgeAtRegistration + "세 ~ " +
                insurance.maxAgeAtRegistration + "세</a></td>");
            newRow.append("<td><a href='/insuAgreement' onclick='redirectToInsuJoin(" + insurance.insuranceProductNumber + ")'>" + numberWithCommas(insurance.insuranceFee) + "원(월)</a></td>");
            tbody.append(newRow);
        }
    }
    function redirectToInsuJoin(insuranceProductNumber) {
        // You can perform any desired actions here before redirecting
        // Redirect to the '/insuJoin' page with the insurance product number as a query parameter
        window.location.href = '/insuAgreement?productNumber=' + insurance.insuranceProductNumber;
    }
</script>
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
                <li>
                    <div class="welcomeMent"><%= name %> (<%=customerID%>)님 환영합니다</div>
                </li>
                <li><a href="javascript:void(0);" onclick="logout();">로그아웃</a></li>
                <%
                } else {
                %>
                <li class="item"><a href="/joinMember">회원가입</a></li>
                <li class="item">
                    <div class="loginButton">로그인</div>
                </li>
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
                    <li><a href="/recommendInsu"  class="clicked">Grade보험</a></li>
                    <li><a href="/weightManage">건강관리</a></li>
                    <li><a href="/myPage">마이페이지</a></li>
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
            <a href="/recommendInsu" class="sideBarTab">
                건강등급
            </a>
<%--            <a href="/insuGradeSubmit" class="sideBarTab">--%>
<%--                건강등급등록--%>
<%--            </a>--%>
            <a href="/insuList" class="sideBarTabClicked">
                Grade보험목록
            </a>
<%--            <a href="/insuJoin" class="sideBarTab">--%>
<%--                Grade보험가입--%>
<%--            </a>--%>
<%--            <a href="/insuRead" class="sideBarTab">--%>
<%--                내 건강등급보험 조회--%>
<%--            </a>--%>
        </div>
    </div>
    <div id="main">
        <main>
            <div class="navInfo">Main &nbsp&nbsp > &nbsp&nbspGrade보험&nbsp&nbsp > &nbsp&nbspGrade보험목록&nbsp&nbsp</div>
            <div style="display: flex;align-content: center;align-items: center;justify-content: center;">
                <div class="sideBarName" style="width: 100%;">
                    건강등급 보험목록
                </div>
            </div>
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

                    <span class="basis">상품 내용을 클릭하시면 가입 페이지로 이동합니다.</span>
                    <div id="gradeCalculation">
                        <table id="insuTable" class="insuTable">
                            <tbody>

                            </tbody>
                        </table>
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
</body>

</html>