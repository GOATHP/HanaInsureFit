<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <!-- Stepper Styles -->
    <link rel="stylesheet" href="./css/step-box.css">
    <link rel="stylesheet" href="./css/terms.css">
    <link rel="stylesheet" href="./css/step2.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="./js/main.js"></script>

    <link href="resources/static/css/style.css" rel="stylesheet">
    <link href="./css/main.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/main-body.css" rel="stylesheet"/>
    <title>체중 정보 갱신 </title>
</head>
<style>

    .input-group label {
        display: inline-block;
        width: 100px; /* 원하는 너비로 조절하세요 */
        text-align: right;
        margin-right: 10px; /* 레이블과 입력 필드 사이의 간격을 조절하세요 */
    }

</style>
<script>
    <%
  String name = (String) session.getAttribute("name");
  String customerID = (String) session.getAttribute("customerID");
  %>
    var customerID = "<%=(String) session.getAttribute("customerID")%>";

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
                    <a href="Introduce.html">
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
                    <li><a href="/recommendInsu">Grade보험</a></li>
                    <li><a href="/weightManage" class="clicked">건강관리</a></li>
                    <li><a href="/dashboardMypage">마이페이지</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>

<div class="main-container">
    <%--  공통 헤더--%>
    <main>
        <%--  단계 --%>
        <div class="content" style="overflow: visible" ;>
            <%--    1002962104821--%>
            <form id="frm" name="step2-form" action="/signUp_STEP3" method="post" enctype="multipart/form-data">
                <section style="
    display: flex;
    justify-content: center;
    flex-direction: column;
    align-items: center;
">
                    <div class="titArea" style="
    display: flex;
    justify-content: center;
">
                        <h2 class="sideBarName" style="text-align: center;">체중 정보 갱신</h2>
                    </div>
                    <div class="benefit2" style="height: 600px;">
                        <div class="idCardCerti" id="idCardCerti1">
                            <div class="uniformImg"><img src="./images/registerEx.png" alt=""></div>
                            <div class="form" style="
    display: flex;
    flex-direction: column;
    align-items: center;
">
                                <div class="uploadField" style="
                         display: flex;
                         flex-direction: column;
                    ">
                                    <img src="https://cdn3d.iconscout.com/3d/premium/thumb/weight-scale-5023750-4183687.png">
                                    <label for="idCardImage"
                                           style="font-size: 16px;display: flex;justify-content: center;margin-bottom:10px;align-items: center;">인바디
                                        이미지 업로드:
                                        <input type="file" id="idCardImage" name="idCardImage"
                                               style="align-items: center;width: 200px; padding-left: 5px"
                                               accept="image/*"
                                               onchange="previewImage(event)"></label>

                                    <%--                      <span class="txt">Please upload your identification image.</span>--%>
                                </div>
                                <div class="btn_a" onclick="openModal()">
                                    <a id="certificateModalOpen" style="
    width: 100px;
    margin-top: 20px;
    background-color: #00857E;
    border: 1px solid #00857E;
">갱신</a>
                                </div>

                                <%--                                            <a id="certificateModalOpener">인증하기</a>--%>
                            </div>
                            <br/>
                            <%--                                            <span class="txt">주민등록증 하단의 발급일자를 입력해주세요.</span>--%>
                        </div>
                    </div>
                    </td>
                    </tr>

                </section>
            </form>
        </div>
    </main>
</div>

<%--
OCR API 호출: 사용자가 모달에서 'Authenticate' 버튼을 클릭하면, 서버에 이미지를 전송하고 OCR API를 호출하여 이미지에서 텍스트를 추출
텍스트 처리: OCR API의 응답에서 텍스트를 처리하고 필요한 정보를 추출
응답 표시: 추출된 텍스트를 모달의 입력 필드에 표시
--%>
<%-- 인증 페이지 --%>
<div id="certificateModal" class="modal" style="justify-content: center;">
    <div class="modal-content" style="
    width: 1000px;
    margin: 0 auto;
">
        <div class="modal-header">
            <div style="display: flex; width: 100%;justify-content: center;">
                <div class="sideBarName" style="font-size: 24px;">인바디 인증</div>
            </div>
            <span class="close">&times;</span>
        </div>

        <div class="modal-main" style="
    display: flex;
    align-items: center;
    justify-content: center;
">
            <div class="modal-main-left">
                <img id="preview" width="100%">
            </div>

            <div class="modal-main-right">
                <div class="mdiptWrap">
                    <div class="input-group">
                        <label style="
    padding-left: 30px;
">InbodyID
                            <div style="border: 0px;
             border-bottom: 1px solid black;"></div>
                        </label><br>
                        <input type="text" class="" maxlength="20"
                                title="InbodyID" id="id" value=""
                               name="registerName" style="border: 0px;width: 140px;
             border-bottom: 1px solid black;">
                    </div>
                    <div class="input-group">
                        <label style="
    padding-left: 30px;
">신장
                            <div style="border: 0px;
             border-bottom: 1px solid black;"></div>
                        </label><br/>
                        <input type="text" class=""

                               title="Only enter the numbers of your ID." id="height"
                               value="" name="height" style="border: 0px;width: 140px;
             border-bottom: 1px solid black;">
                    </div>
                    <div class="input-group">
                        <label style="
    padding-left: 30px;
">체중
                            <div style="border: 0px;
             border-bottom: 1px solid black;"></div>
                        </label><br/>
                        <input type="text" class="" maxlength="20"
                                title="체중"
                               id="weight" value=""
                               name="weight" style="border: 0px;width: 140px;
             border-bottom: 1px solid black;">
                    </div>
                    <div class="input-group">
                        <label style="
    padding-left: 30px;
">BMI
                            <div style="border: 0px;
             border-bottom: 1px solid black;"></div>
                        </label><br/>
                        <input type="text" class="" maxlength="20"

                               title="BMI" id="bmi"
                               value="" name="bmi"
                               style="border: 0px;width: 140px;
             border-bottom: 1px solid black;">
                    </div>
                    <div class="input-group">
                        <label style="
    padding-left: 30px;
">기초대사량
                            <div style="border: 0px;
             border-bottom: 1px solid black;"></div>
                        </label><br/>
                        <input type="text" class="" maxlength="20"

                               title="BMI" id="bmr"
                               value="" name="bmr" style="border: 0px;
             border-bottom: 1px solid black;width: 140px;">
                    </div>
                    <div class="input-group">
<%--                        <label style="--%>
<%--    padding-left: 30px;--%>
<%--">등록날짜--%>
<%--                            <div style="border: 0px;--%>
<%--             border-bottom: 1px solid black;"></div>--%>
<%--                        </label><br/>--%>
<%--                        <input type="text" class="" maxlength="20"--%>

<%--                               title="record_date" id="record_date"--%>
<%--                               value="" name="record_date" style="width: 140px;border: 0px;--%>
<%--             border-bottom: 1px solid black;">--%>
                    </div>

                </div>
            </div>

        </div>
        <form id="registrationForm" action="${pageContext.request.contextPath}/signUp_STEP3" method="post">
            <div class="btnWrap" style="
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 30px;
">
                <div class="submitButton">
                    <input type="submit" value="인증하기" class="submitBtn" id="ocrCheck" style="
    margin-right: 30px;
    background-color:#00857E;
    width: 100px;
    border: 0px;
">
                </div>

                <input type="hidden" id="hiddenName" name="hiddenName">
                <input type="hidden" id="hiddenID" name="hiddenID">
                <input type="hidden" id="hiddenIssueDate" name="hiddenIssueDate">
                <input type="hidden" id="hiddenStatus" name="hiddenStatus">
                <input type="hidden" id="hiddenLocKor" name="hiddenLocKor">
                <input type="hidden" id="hiddenLocEng" name="hiddenLocEng">
                <input type="hidden" id="hiddenCountry" name="hiddenCountry">
                <div class="submitButton">
                    <input type="submit" value="제출하기" class="submitBtn" id="submitOCR" style="
    margin-right: 30px;
    background-color:#00857E;
    width: 100px;
    border: 0px;
">
                    <div id="loadingScreen" class="spinner-border text-success" role="status">
                        <span class="sr-only"></span>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</div>

<script>

    function openModal() {
        let modal = document.getElementById("certificateModal");
        modal.style.display = "block";
    }

    // 모달 창을 닫기 위한 함수
    function closeModal() {
        let modal = document.getElementById("certificateModal");
        modal.style.display = "none";
    }

    // 모달 창 바깥을 클릭했을 때 닫기 위한 함수
    function outsideModalClick(event) {
        let modal = document.getElementById("certificateModal");
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    <%--    인증 모달 끄기--%>
    document.addEventListener("DOMContentLoaded", function () {
        let closeButton = document.querySelector(".close");
        let modal = document.getElementById("certificateModal");
        closeButton.addEventListener("click", closeModal);
        window.addEventListener("click", outsideModalClick);
    });

    // 첨부한 이미지 받아오기
    function previewImage(event) {
        let reader = new FileReader();
        reader.onload = function () {
            let output = document.getElementById('preview');
            output.src = reader.result;
        }
        reader.readAsDataURL(event.target.files[0]);
    }

    // ocr 추출 값 받아오기
    document.querySelector("#ocrCheck").addEventListener("click", function (event) {
        event.preventDefault();

        let formData = new FormData();
        formData.append("image", document.getElementById("idCardImage").files[0]);

        $.ajax({
            type: "POST",
            url: "/authenticateAction",
            data: formData,
            processData: false,
            contentType: false,
            success: function (data) {
                // Populate the input fields with the extracted data
                console.log(data);
                // document.getElementById("record_date").value = data.record_date;
                document.getElementById("id").value = data.id.match(/\d+/);
                document.getElementById("height").value = data.height.replace("cm", "");
                document.getElementById("weight").value = data.weight;
                document.getElementById("bmi").value = data.bmi;
                document.getElementById("bmr").value = data.bmr;


                console.log("클라이언트사이드: " + data.record_date + " " + data.id + " "
                    + data.height + " " + data.weight + data.bmi + " " + data.bmr)
            },
            error: function (error) {
                console.error(error);
            }
        });
    });
    // 제출
    document.querySelector("#submitOCR").addEventListener("click", function (event) {
        alert("체중 정보가 갱신되었습니다.")
        event.preventDefault();
        // Show loading screen
        var requestData = {
            InbodyID: document.getElementById("id").value,
            weight: document.getElementById("weight").value,
            height: document.getElementById("height").value,
            bmi: document.getElementById("bmi").value,
            // record_date: document.getElementById("record_date").value,
            bmr: document.getElementById("bmr").value,
            customerID: customerID // customerID 값을 여기에 입력하세요
        };
        // console.log(requestData);
        // var dateParts = requestData.record_date.split(' ');
        // var dateParts1 = dateParts[0].split('.');
        // // var dateParts2 = dateParts[1].split(':');
        // var newDate = dateParts1[0].substring(2) + "/" + dateParts1[1] + "/" + dateParts1[2]

// height에서 "cm" 제거
        var height = requestData.height.replace("cm", "");

// InbodyID에서 숫자만 추출
        var inbodyID = requestData.InbodyID.match(/\d+/);

// 가공된 데이터 객체
        var inbodyInfo = {
            InbodyID: inbodyID[0],
            bmi: parseFloat(requestData.bmi),
            bmr: parseFloat(requestData.bmr),
            customerID: requestData.customerID,
            height: parseFloat(height),
            // record_date: newDate,
            weight: parseFloat(requestData.weight)
        };
        console.log(inbodyInfo);

        $.ajax({
            type: 'POST',
            url: '/renewInbody', // 실제 엔드포인트 URL로 변경하세요
            contentType: 'application/json',
            data: JSON.stringify(inbodyInfo),
            success: function (data) {
                console.log('POST 요청 성공:', data);
                // 성공적으로 요청을 보냈을 때 할 작업을 수행할 수 있습니다.
                alert("체중정보 갱신이 완료되었습니다.")
                let modal = document.getElementById("certificateModal");
                modal.style.display = "none";

            },
            error: function (xhr, status, error) {
                console.error('POST 요청 실패:', error);
                // 요청이 실패했을 때 할 작업을 수행할 수 있습니다.
            }
        });
    });

    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("loadingScreen").style.display = "none";
    });
</script>
</body>
</html>