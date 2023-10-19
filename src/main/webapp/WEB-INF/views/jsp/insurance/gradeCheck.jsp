<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>하나 InsureFit</title>
    <link href="resources/static/css/style.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
</head>
<script>
    var customerID = "<%=(String) session.getAttribute("customerID")%>";
    console.log(customerID);
</script>
<style>
    #datatablesSimple th{
        background-color: #00857E;
        color: white;
    }

    #datatablesSimple{

    }
        /* 초록색 텍스
        트 스타일 */
    .green-text {
        color: green;
    }

    /* 빨간색 텍스트 스타일 */
    .red-text {
        color: red;
    }

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
            newRow.append("<td><a href='/insuAgreement' onclick='redirectToInsuJoin(" + insurance.insuranceProductNumber + ")'>" + insurance.insuranceFee + "원(월)</a></td>");
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

                <div class="insuInfo" style="
    text-align: center;
    margin-top: 30px;
    width: 800px;
">
                    <span class="colorText"><%=name%></span>님 건강등급은 <span class="colorText" id="grade"></span>입니다!
                </div>

            <div class="areaContainer">

                <div class="rightArea3">

                    <div class="sideBarName">
                        건강등급 산출 결과</span>
                    </div>

                        <div id="gradeCalculation">
                    <div style="display: flex;flex-direction: column;align-items: center;">
                        <table border="1"  width="100%" class="mb-5" id="datatablesSimple">
                            <tr class="text-center" id="list" >
                                <th>검진항목</th>
                                <th>검진수치</th>
                                <th>검진결과</th>
                                <th>참고범위</th>
                            </tr>
                        </table>
                        <a href="/compareCost" style="
    width: 150px;
    margin: 30px;
    font-size: 15px;
    background-color: #00857E;
     border: 1px solid #00857E;
    padding: 8px;
    height: auto;
    color: #fff;
    cursor: pointer;
    border-radius: 15px;
">내 할인률 알아보기</a>
                        <div style="display: flex;width: 100%;justify-content: flex-end;">
                        <span class="basis">
                        </div>
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
<script>
    $(document).ready(function () {
        $.ajax({
            type: "POST",
            url: "/getCheckUp",
            dataType: "json",
            data: {
                'customerID': customerID
            },
            success: function (response) {
                console.log(response);
                console.log(response.chk_YEAR)
                document.querySelector(".basis").textContent = response.chk_YEAR+'-06-09 검진';
                var table = document.querySelector("table");
                for (var key in response) {
                    if (response.hasOwnProperty(key)) { // 객체 자체의 속성인지 확인
                        if (key !== "sex" && key !== "customerId" && key !== "weight" && key !== "height" && key !== "waist" && key !=="chk_YEAR") {
                            var row = table.insertRow();
                            var cell1 = row.insertCell(0);
                            var cell2 = row.insertCell(1);
                            var cell3 = row.insertCell(2);
                            var cell4 = row.insertCell(3);
                            // cell1.innerHTML = key; // 검진항목 (객체 속성 이름)
                            cell2.innerHTML = response[key]; // 검진수치 (객체 속성 값)
                            if (key=="bp_HIGH") {
                                cell1.innerHTML = "혈압(수축기)";
                                var bpHigh = parseInt(response[key]);
                                if (bpHigh <= 120) {
                                    cell3.innerHTML = "정상"; // 혈압(수축기) 검진결과
                                    cell3.classList.add("green-text")
                                } else {
                                    cell3.innerHTML = "고혈압"; // 혈압(수축기) 검진결과
                                    cell3.classList.add("red-text")
                                }
                                cell4.innerHTML = "정상: 0-119, 고혈압(위험): 120 이상"; // 참고범위 값
                            }
                            if (key=="bp_LWST") {
                                cell1.innerHTML = "혈압(이완기)";
                                var bpLWST = parseInt(response[key]);
                                if (bpLWST <= 80) {
                                    cell3.innerHTML = "정상"; // 혈압(수축기) 검진결과
                                    cell3.classList.add("green-text")
                                } else {
                                    cell3.innerHTML = "고혈압"; // 혈압(수축기) 검진결과
                                    cell3.classList.add("red-text")
                                }
                                cell4.innerHTML = "정상: 0-79, 고혈압(위험): 120 이상"; // 참고범위 값
                            }
                            if (key=="creatinine") {
                                cell1.innerHTML = "혈청크레아티닌(신장 기능 관련)";
                                var creatinine = parseInt(response[key]);
                                if (creatinine <= 0.7) {
                                    cell3.innerHTML = "정상"; // 혈압(수축기) 검진결과
                                    cell3.classList.add("green-text")
                                } else if(creatinine <= 1.4) {
                                    cell3.innerHTML ="경도이상"
                                    cell3.classList.add("red-text")
                                } else {
                                    cell3.innerHTML = "중증도 이상"; // 혈압(수축기) 검진결과
                                    cell3.classList.add("red-text")
                                }
                                cell4.innerHTML = "정상: 0-0.7, 경도 이상: 0.7-1.4, 중등도이상: 1.4 이상"; // 참고범위 값
                            }
                            if (key == "gamma_GTP") {
                                cell1.innerHTML = "감마지티피(간 기능 관련)";
                                var gammaGTP = parseFloat(response[key]);

                                if (gammaGTP <= 100) {
                                    cell3.innerHTML = "미달"; // 감마지티피(간 관련) 검진결과
                                    cell3.classList.add("red-text")

                                } else if (gammaGTP <= 200) {
                                    cell3.innerHTML = "정상"; // 감마지티피(간 관련) 검진결과
                                    cell3.classList.add("green-text")
                                } else {
                                    cell3.innerHTML = "초과"; // 감마지티피(간 관련) 검진결과
                                    cell3.classList.add("red-text")
                                }
                                cell4.innerHTML = "미달: 0-100, 정상: 100-200, 초과: 200 이상"; // 감마지티피(간 관련) 참고범위
                            }
                            if(key=='sgot_AST'){
                                cell1.innerHTML = "AST(간 기능 관련)";
                                var sgotAST = parseFloat(response[key]);
                                if (sgotAST <= 40) {
                                    cell3.innerHTML = "정상"; // SGOT AST(간 기능 관련) 검진결과
                                    cell3.classList.add("green-text")
                                } else {
                                    cell3.innerHTML = "이상"; // SGOT AST(간 기능 관련) 검진결과
                                    cell3.classList.add("red-text")
                                }
                                cell4.innerHTML = "정상: 0-40, 이상: 40 이상"; // SGOT AST(간 기능 관련) 참고범위
                            }
                            if(key=='sgpt_ALT'){
                                cell1.innerHTML = "ALT(간 기능 관련)";
                                var sgotAST = parseFloat(response[key]);
                                if (sgotAST <= 35) {
                                    cell3.innerHTML = "정상"; // SGOT AST(간 기능 관련) 검진결과
                                    cell3.classList.add("green-text")
                                } else {
                                    cell3.innerHTML = "이상"; // SGOT AST(간 기능 관련) 검진결과
                                    cell3.classList.add("red-text")
                                }
                                cell4.innerHTML = "정상: 0-40, 이상: 40 이상"; // SGOT AST(간 기능 관련) 참고범위
                            }
                            if (key == 'olig_PROTE_CD') {
                                cell1.innerHTML = "요단백(신장 관련)";
                                var oligProteCD = parseFloat(response[key]);

                                if (oligProteCD <= 30) {
                                    cell3.innerHTML = "정상"; // 요단백(신장 관련) 검진결과
                                    cell3.classList.add("green-text")
                                } else if (oligProteCD <= 300) {
                                    cell3.innerHTML = "미세단백뇨"; // 요단백(신장 관련) 검진결과
                                    cell3.classList.add("red-text")
                                } else {
                                    cell3.innerHTML = "단백뇨"; // 요단백(신장 관련) 검진결과
                                    cell3.classList.add("red-text")
                                }
                                cell4.innerHTML = "정상: 0-30, 미세단백뇨: 30-300, 단백뇨: 300 이상"; // 요단백(신장 관련) 참고범위
                            }
                            if (key == 'blds') {
                                cell1.innerHTML = "혈당(공복혈당)";
                                var blds = parseFloat(response[key]);

                                if (blds <= 80) {
                                    cell3.innerHTML = "저혈당"; // 혈당(공복혈당) 검진결과
                                    cell3.classList.add("red-text")
                                } else if (blds <= 130) {
                                    cell3.innerHTML = "정상"; // 혈당(공복혈당) 검진결과
                                    cell3.classList.add("green-text")
                                } else {
                                    cell3.innerHTML = "고혈당"; // 혈당(공복혈당) 검진결과
                                    cell3.classList.add("red-text")
                                }
                                cell4.innerHTML = "저혈당: 0-80, 정상: 80-130, 고혈당: 130 이상"; // 혈당(공복혈당) 참고범위
                            }
                            if (key == 'smk_STAT_TYPE_CD') {
                                cell1.innerHTML = "흡연 여부";
                                var smkStatTypeCd = parseInt(response[key]);

                                if (smkStatTypeCd === 0) {
                                    cell3.innerHTML = "비흡연"; // 흡연 여부 검진결과
                                    cell3.classList.add("green-text")
                                } else if (smkStatTypeCd === 1) {
                                    cell3.innerHTML = "흡연"; // 흡연 여부 검진결과
                                    cell3.classList.add("red-text")
                                } else {
                                    cell3.innerHTML = "데이터 부족"; // 데이터 부족으로 검진결과 표시
                                }
                                cell4.innerHTML = "비흡연: 0, 흡연: 1"; // 흡연 여부 참고범위
                            }
                            if (key == 'drk_YN') {
                                cell1.innerHTML = "음주 여부";
                                var drkYn = parseInt(response[key]);

                                if (drkYn === 0) {
                                    cell3.innerHTML = "비음주"; // 음주 여부 검진결과
                                    cell3.classList.add("green-text")
                                } else if (drkYn === 1) {
                                    cell3.innerHTML = "음주"; // 음주 여부 검진결과
                                    cell3.classList.add("red-text")
                                } else {
                                    cell3.innerHTML = "데이터 부족"; // 데이터 부족으로 검진결과 표시
                                }
                                cell4.innerHTML = "비음주: 0, 음주: 1"; // 음주 여부 참고범위
                            } else if (key == 'hchk_OE_INSPEC_YN') {
                                cell1.innerHTML = "구강검진 수검 여부";
                                var hchkOeInspecYn = parseInt(response[key]);

                                if (hchkOeInspecYn === 0) {
                                    cell3.innerHTML = "미수검"; // 구강검진 수검 여부 검진결과
                                    cell3.classList.add("red-text")
                                } else if (hchkOeInspecYn === 1) {
                                    cell3.innerHTML = "수검"; // 구강검진 수검 여부 검진결과
                                    cell3.classList.add("green-text")
                                } else {
                                    cell3.innerHTML = "데이터 부족"; // 데이터 부족으로 검진결과 표시
                                }
                                cell4.innerHTML = "미수검: 0, 수검: 1"; // 구강검진 수검 여부 참고범위
                            } else if (key == 'hmg') {
                                cell1.innerHTML = "혈색소";
                                var hmg = parseFloat(response[key]);

                                if (hmg < 12) {
                                    cell3.innerHTML = "저혈색소"; // 혈색소 검진결과
                                } else if (hmg >= 12 && hmg < 15) {
                                    cell3.innerHTML = "정상"; // 혈색소 검진결과
                                    cell3.classList.add("green-text")
                                } else if (hmg >= 15 && hmg < 16) {
                                    cell3.innerHTML = "고혈색소"; // 혈색소 검진결과
                                } else {
                                    cell3.innerHTML = "초고혈색소"; // 혈색소 검진결과
                                }
                                cell4.innerHTML = "저혈색소: 0-12, 정상: 12-15, 고혈색소: 15-16, 초고혈색소: 16 이상"; // 혈색소 참고범위
                            }
                        }
                    }
                }
                var bmiRow = table.insertRow();
                var bmiLabelCell = bmiRow.insertCell(0);
                var bmiValueCell = bmiRow.insertCell(1);
                var bmiResultCell = bmiRow.insertCell(2);
                var bmiReferenceCell = bmiRow.insertCell(3);

                bmiLabelCell.innerHTML = "BMI"; // BMI 항목 이름
                if (response.hasOwnProperty("height") && response.hasOwnProperty("weight")) {
                    var height = response["height"];
                    var weight = response["weight"];
                    if (height > 0 && weight > 0) {
                        var bmi = calculateBMI(height, weight);
                        bmiValueCell.innerHTML = bmi.result; // BMI 계산 결과
                        bmiResultCell.innerHTML = bmi.reference;
                        if (bmi.reference === "정상") {
                            bmiResultCell.classList.add("green-text"); // bmi.reference가 정상인 경우 초록색 스타일 추가
                        }// BMI 계산 결과를 검진결과 칸에 표시하지 않음
                        bmiReferenceCell.innerHTML = '저체중: 18.5 이하, 정상: 18.5-23, 과체중: 23-25, 25-30: 비만, 30 이상: 고도비만'; // BMI 참고 범위
                    } else {
                        bmiValueCell.innerHTML = "데이터 부족"; // 데이터 부족으로 계산 불가
                        bmiResultCell.innerHTML = ""; // 계산 결과가 없으므로 비움
                        bmiReferenceCell.innerHTML = "데이터 부족"; // 데이터 부족으로 참고 범위 없음
                    }
                } else {
                    bmiValueCell.innerHTML = "데이터 부족"; // 데이터 부족으로 계산 불가
                    bmiResultCell.innerHTML = ""; // 계산 결과가 없으므로 비움
                    bmiReferenceCell.innerHTML = "데이터 부족"; // 데이터 부족으로 참고 범위 없음
                }
                $('#datatablesSimple').DataTable();
                    //     autoWidth: false,
                    //     searching: true, //검색 여부
                    //     language: { //언어 설정
                    //         paginate: {
                    //             previous: "이전",
                    //             next: "다음"
                    //         },
                    //         zeroRecords: "검색 결과가 없습니다.",
                    //         info: "전체 거래내역 _TOTAL_개 중에서 _START_ 번부터 _END_ 번까지의 결과",
                    //         lengthMenu: "_MENU_ 행까지 조회"
                    //     }
                    //     , columnDefs: [
                    //         {
                    //             targets: -1,
                    //             className: 'dt-body-center'
                    //         },
                    //
                    //     ]
                    // })
            },
            error: function (xhr, status, error) {
                alert("서버 오류: " + error);
            }
        });
    })
</script>
<script>
    var rows = document.querySelectorAll("#datatablesSimple tbody tr");
    rows.forEach(function(row) {
        var resultCell = row.querySelector("td:nth-child(3)");
        if (resultCell.textContent === "정상" || resultCell.textContent === "비흡연" || resultCell.textContent === "비음주" || resultCell.textContent === "수검") {
            resultCell.classList.add("green-text"); // 초록색 스타일 클래스 추가
        } else {
            resultCell.classList.add("red-text"); // 빨간색 스타일 클래스 추가
        }
    });
</script>
<script>
    function calculateBMI(height, weight) {
        var bmi = (weight / ((height / 100) ** 2)).toFixed(1); // BMI 계산
        var reference = ""; // 참고 범위 초기화

        // BMI 범주화
        if (bmi < 18.5) {
            reference = "저체중";
        } else if (bmi < 23) {
            reference = "정상";
        } else if (bmi < 25) {
            reference = "과체중";
        } else if (bmi < 30) {
            reference = "경도비만";
        } else {
            reference = "고도비만";
        }

        return {
            result: bmi, // BMI 값
            reference: reference // 참고 범위
        };
    }
</script>
<script src="resources/static/js/demo/myPageInfo4.js"></script>
</body>

</html>