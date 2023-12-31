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
    .insuTable td {
        font-size: 11px !important;
    }
</style>
<script>
    var customerID = "<%=(String) session.getAttribute("customerID")%>";
    $(document).ready(function () {
        // AllInsusearching 요청을 보내고 서버로부터 보험 정보를 받아옵니다.
        $.ajax({
            type: "POST",  // HTTP GET 요청
            url: "/insuByCustID",  // 서버 측 URL
            dataType: "json",  // 응답 데이터 타입은 JSON
            success: function (response) {
                // 서버로부터 받은 데이터를 처리합니다.
                console.log("성공")
                console.log(response)
                // 보험 정보를 화면에 출력하거나 다른 처리를 수행합니다.
                var insuList = response
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
                        minAgeAtRegistration: insurance.minAgeAtRegistration,
                        insuranceStartDate: insurance.insuranceStartDate,
                        insuranceEndDate: insurance.insuranceEndDate
                    };
                    insuranceData.push(insuranceObj);
                    console.log(insuranceData)
                }

                // 데이터를 테이블에 추가
                appendInsuranceDataToTable(insuranceData);
                getInsuData(customerID);
            },
            error: function (xhr, status, error) {
                console.error("서버 오류: " + error);
            }
        });
    });

    // 보험 정보를 테이블에 추가하는 함수
    function appendInsuranceDataToTable(insuranceData) {
        // 테이블의 tbody 요소를 가져옵니다. 여기에 데이터를 추가할 것입니다.
        var tbody = $("#insuranceTable tbody");


        var headerRow = $("<tr class='insuHeader'>");
        headerRow.append("<th>보험명</th>");
        headerRow.append("<th>회사명</th>");
        headerRow.append("<th>보장 내용</th>");
        headerRow.append('<th>보험비</th>');
        headerRow.append("<th>가입 기간</th>");
        headerRow.append("<th>특약 내용</th>");
        tbody.append(headerRow);

        // insuranceData 배열을 순회하면서 각 보험 정보를 테이블에 추가합니다.
        for (var i = 0; i < insuranceData.length; i++) {
            var insurance = insuranceData[i];

            // 새로운 행(tr) 요소를 생성합니다.
            var newRow = $("<tr class='insuContent'>");

            // 보험 정보를 새로운 셀(td)에 추가합니다.
            newRow.append("<td>" + insurance.insuranceProductName + "</td>");
            newRow.append("<td>" + insurance.insuranceCompanyName + "</td>");
            newRow.append("<td>" + insurance.insuContent + "</td>");
            newRow.append('<td class="insuFee">' + (insurance.insuranceFee * 0.8).toFixed(0) + '원(월)</td>');
            newRow.append("<td>" + insurance.insuranceStartDate + "~" + insurance.insuranceEndDate + "</td>");
            newRow.append('<td class="specialContent">' + "이얏호" + '</td>');
            tbody.append(newRow);
        }
    }

    function redirectToInsuJoin(insuranceProductNumber) {
        // You can perform any desired actions here before redirecting
        // Redirect to the '/insuJoin' page with the insurance product number as a query parameter
        window.location.href = '/insuJoin?productNumber=' + insurance.insuranceProductNumber;
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
                    <li><a href="/recommendInsu" class="clicked">Grade보험</a></li>
                    <li><a href="/weightManage">건강관리</a></li>
                    <li><a href="/dashboardMypage">마이페이지</a></li>
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
                건강등급
            </a>
            <a href="/insuList" class="sideBarTabClicked">
                Grade보험목록
            </a>

        </div>
    </div>
    <div id="main">
        <main>
            <div class="navInfo">Main &nbsp&nbsp> &nbsp&nbspGrade보험 > &nbsp&nbspGrade보험목록&nbsp&nbsp >
                &nbsp&nbspGrade보험가입
            </div>
            <div style="display: flex;align-content: center;align-items: center;justify-content: center;
                    margin-top: 20px;">
                <div class="sideBarName" style="width: 100%; margin-bottom: 0px;">
                    보험 가입 신청 완료!
                </div>
            </div>
            <div class="insuMoongoo"><br>
                <div class="insuInfo">
                    <br>하나 InsureFit과 함께<br> <span class="colorText">보험료 할인</span>받으세요!
                </div>
            </div>
            <div class="areaContainer">
                <div class="rightArea6" style="width: 1050px;">
                    <div class="insuInfo3">
                        <%= name %>님 신청 보험 목록


                    </div>
                    <table id="insuranceTable" class="insuTable">
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>
</div>
<%--<footer id="footer">--%>
<%--    <div>Contact us | 개인정보처리방침 | 고객정보취급방침 | 건강한 소리(부정제보) | 인천 서구 에코로 167 하나금융그룹 통합데이터센터 비전센터 5층 | Copyright ©--%>
<%--        Hana TI 2019. ALL RIGHT RESERVE</div>--%>
<%--</footer>--%>
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
<script src="resources/static/js/demo/myPageInsu9.js"></script>
</html>