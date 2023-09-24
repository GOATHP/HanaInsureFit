<%@ page import="ac.kr.kopo.HanaInsureFit.insurance.vo.Insurance" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%
    String insuranceProductNumber = request.getParameter("insuranceProductNumber");

%>

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
<script>
    // 페이지 로드 시 실행되는 함수
    window.onload = function () {
        // insuranceProductNumber 변수 값을 JavaScript로 가져옵니다.
        var insuranceProductNumber = '<%= request.getParameter("insuranceProductNumber") %>';
        console.log(insuranceProductNumber)
        // Ajax 요청을 사용하여 컨트롤러로 변수를 전달합니다.
        $.ajax({
            type: "POST", // 또는 "POST" 요청을 사용하실 수도 있습니다.
            url: "/Insusearching", // 컨트롤러의 엔드포인트 URL
            data: {
                input: insuranceProductNumber
            },
            success: function (data) {
            },
            error: function () {
                // Ajax 요청이 실패한 경우 처리할 코드를 작성합니다.
            }
        });
    };
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
                    String insuranceProductName = (String) session.getAttribute("insuranceProductName");
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
                    <li><a href="/recommendInsu" class="clicked">Grade보험</a></li>
                    <li><a href="/weightManage">건강관리</a></li>
                    <li><a href="/myPage">마이페이지</a></li>
                    <!-- 다른 메뉴 항목 추가 -->
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
<%--            <a href="/insuJoin" class="sideBarTabClicked">--%>
<%--                Grade보험가입--%>
<%--            </a>--%>
            <%--            <a href="/insuRead" class="sideBarTab">--%>
            <%--                내 건강등급보험 조회--%>
            <%--            </a>--%>
        </div>
    </div>
    <div id="main">
        <main>
            <div class="navInfo">Main &nbsp&nbsp> &nbsp&nbspGrade보험 > &nbsp&nbspGrade보험목록&nbsp&nbsp > &nbsp&nbspGrade보험가입 </div>


            <div class="areaContainer">

                <div class="rightArea3">
                    <div class="centerAlign">

                        하나 Grade 건강보험 가입
                    </div>
                    <div class="gradeInsurance">

                        하나InsureFit<br>
                        <%=insuranceProductName %><br>
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

</div>
</html>