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
    <%
        String insuranceProductNumber = request.getParameter("insuranceProductNumber");
    %>
    <script>
        var customerID = "<%=(String) session.getAttribute("customerID")%>";
    </script>
    <style>
        /* 팝업 스타일 */
        .popup {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
        }

        .popup-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            border-radius: 5px;
        }

        .close {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
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

        .modal-content {
            background-color: #ffffff;
            margin: 15% auto;
            padding: 20px;
            width: 450px;
            height: 560px;
            border-radius: 20px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .phone-container{
            width: 100%;
            text-align: center;
            margin-top: 30px;
        }
        .login{
            color: #000000;
            text-align: center;
            display: inline-block;
        }
        .login img{
            width: 150px;
            margin: 20px auto;
        }
        #phone-number, #auth-number{
            width: 70%;
            border-radius: 10px;
            height: 50px;
            float: left;
            display: flex;
            mix-blend-mode: normal;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            margin: 10px 0 5px 0;
            background: 0;
            border: 0;
            border-bottom: solid 3px #b1b1b1;
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
            border: 1px solid #a7a9a9;
            background-color: #a7a9a9;
            mix-blend-mode: normal;
            color: white;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 10px;
            margin: 10px 0 14px 0;
            color: #010101;
            font-weight: 700;
            padding: 15px 0;
            font-size: 15px;
        }
        .authbox{
            width: 100%;
        }
    </style>
</head>
<script>
    var insuranceProductNumber = '<%= insuranceProductNumber %>';
    console.log(insuranceProductNumber);
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
                    String identifyNum = (String) session.getAttribute("identifyNum");
//                    String gender = (String) session.getAttribute("gender");
//                    String age = (String) session.getAttribute("age");
                    int healthGrade = (int) session.getAttribute("healthGrade");
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
            보험추천
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
            <div class="navInfo">Main &nbsp&nbsp> &nbsp&nbspGrade보험 > &nbsp&nbspGrade보험목록&nbsp&nbsp > &nbsp&nbspGrade보험가입</div>
            <div class="insuInfo2">
            보험 가입 신청서
            </div>
            <div class="areaContainer">
                <div class="rightArea5">
                    <div class="tableContainer">
                        <table class="insuTable">
                            <thead>
                            <tr>
                                <th colspan="2" class="col">고객 정보</th>
                                <th colspan="2" class="col">보험 정보</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th>이름</th>
                                <td><%= name %></td>
                                <th>보험명</th>
                                <td>무배당 Grade 건강 보험</td>
                            </tr>
                            <tr>
                                <th>나이/성별</th>
<%--                                <td><%=age%>(<%=gender%>)</td>--%>
                                <th>보험료</th>
                                <td>78,900원</td>
                            </tr>
                            <tr>
                                <th>주민등록번호</th>
                                <td><%= identifyNum.substring(0, 6) + "-*******"%></td>

                                <th>
                                    포인트
                                </th>
                                <td>
                                    <div class="modal">
                                        <div class="modal_body">건강등급 구간별 보험료
                                            <button class="btn-close-popup">X</button>
                                        </div>
                                    </div>
                                    <button class="btn-open-popup">?</button>
                                </td>
                            </tr>
                            <tr>

                                <th>
                                    건강등급
                                </th>
                                <td>
                                    <%
                                        String healthGradeText = ""; // 결과를 저장할 변수
                                        // 등급 계산
                                        if (healthGrade == 1) {
                                            healthGradeText = "Grade1";
                                        } else if (healthGrade == 2) {
                                            healthGradeText = "Grade2";
                                        } else if (healthGrade == 3) {
                                            healthGradeText = "Grade3";
                                        } else if (healthGrade == 4) {
                                            healthGradeText = "Grade4";
                                        } else {
                                            // 다른 경우에 대한 처리
                                            healthGradeText = "알 수 없음"; // 예를 들어, 범위를 벗어나는 값인 경우
                                        }
                                    %>
                                    <%=healthGradeText%>
<%--                                    <%=healthGrade%>등급()--%>
                                </td>
                                <th>
                                    최종 가입료
                                </th>
                                <td>
                                    78,900원
                                </td>

                            </tr>
                            </tbody>
                        </table>
                    </div>
                        <button id="insertInsuButton" onclick="phoneAuth()">본인 인증</button>
                    </div>

                <div id="myModal" class="modall">
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <div class="phone-container">
                            <div class="login">
                                <h2>휴대폰 인증</h2>
                                <p>안전하고 간편하게 로그인하세요.</p>
                                <p><c:out value="${member.name}"/>님의 휴대폰 인증</p>
                                <img src="resources/static/image/phone-call.svg" alt="">
                                <label for="phoneBrand">통신사 및 알뜰폰 선택:</label>
                                <select id="phoneBrand" name="phoneBrand">
                                    <option value="SKT">SKT</option>
                                    <option value="KT">KT</option>
                                    <option value="LG">LG</option>
                                    <option value="SKT알뜰폰">SKT 알뜰폰</option>
                                    <option value="KT알뜰폰">KT 알뜰폰</option>
                                    <option value="LG알뜰폰">LG 알뜰폰</option>
                                </select>
                                <input type ="tel" id ="phone-number" name="phone" placeholder="전화번호를 입력해주세요">
                                <button type ="button" id ="auth-req-button">인증요청</button>
                                <p id="ViewTimer"></p>
                                <div class="authbox">
                                    <input type ="password" id ="auth-number" placeholder="인증번호를 입력해주세요">
                                    <button type="button" class="confirm-button" id ="auth-res-button">확인</button>
                                    <button type="button" class="confirm-button" id ="join-insu-button" onclick="submitForm()">보험 가입하기</button>
                                </div>

                                <%--                    <a href="https://kauth.kakao.com/oauth/authorize?client_id=951e0627da48ee51855b252517b6352d--%>
                                <%--&redirect_uri=http://localhost:8080/api/social/login/kakao&response_type=code" class="kakaoa"><img class="kakao_btn" src="../../resources/images/kakaologin.png" width="30"></a>--%>
                                <%--                    <a href="https://kauth.kakao.com/oauth/logout?client_id=951e0627da48ee51855b252517b6352d&logout_redirect_uri=http://localhost:8080/logout" class="kakaoa">logout</a>--%>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </main>
    </div>

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
    $(document).ready(function() {

        $("#join-insu-button").click(function(e) {
            e.preventDefault(); // 기본 클릭 동작(페이지 이동)을 막습니다.
            $.ajax({
                type: "POST",
                url: "/insertInsu",
                success: function(response) {
                    console.log("전송 성공");
                    alert("보험 가입이 완료되었습니다.");

                    window.location.href = "/insuRead";
                },
                error: function() {
                    console.error("전송 실패");
                    // 요청이 실패했을 때 실행할 코드
                }
            });
        });
    });
</script>
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
    const modal = document.querySelector('.modal');
    const btnOpenPopup = document.querySelector('.btn-open-popup');

    btnOpenPopup.addEventListener('click', () => {
        modal.style.display = 'block';
    });

    function closeModal() {
        var modal = document.querySelector(".modal");
        modal.style.display = "none"; // 모달을 숨기도록 설정
    }
    var closePopupButton = document.querySelector(".btn-close-popup");
    closePopupButton.addEventListener("click", closeModal);
</script>
</body>
<script>
    'use strict';

    const form = document.querySelector('#form__wrap');
    const checkAll = document.querySelector('.terms__check__all input');
    const checkBoxes = document.querySelectorAll('.input__check input');
    const submitButton = document.querySelector('button');

    const agreements = {
        termsOfService: false,
        privacyPolicy: false,
        allowPromotions: false,
    };

    form.addEventListener('submit', (e) => e.preventDefault()); // 새로고침(submit) 되는 것 막음

    checkBoxes.forEach((item) => item.addEventListener('input', toggleCheckbox));

    function toggleCheckbox(e) {
        const {checked, id} = e.target;
        agreements[id] = checked;
        this.parentNode.classList.toggle('active');
        checkAllStatus();
        toggleSubmitButton();
    }

    function checkAllStatus() {
        const {termsOfService, privacyPolicy, allowPromotions} = agreements;
        if (termsOfService && privacyPolicy && allowPromotions) {
            checkAll.checked = true;
        } else {
            checkAll.checked = false;
        }
    }

    function toggleSubmitButton() {
        const {termsOfService, privacyPolicy} = agreements;
        if (termsOfService && privacyPolicy) {
            submitButton.disabled = false;
        } else {
            submitButton.disabled = true;
        }
    }

    checkAll.addEventListener('click', (e) => {
        const {checked} = e.target;
        if (checked) {
            checkBoxes.forEach((item) => {
                item.checked = true;
                agreements[item.id] = true;
                item.parentNode.classList.add('active');
            });
        } else {
            checkBoxes.forEach((item) => {
                item.checked = false;
                agreements[item.id] = false;
                item.parentNode.classList.remove('active');
            });
        }
        toggleSubmitButton();
    });

</script>
<script>

    $(".checkbox_group").on("click", "#check_all", function () {
        $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
    });

    // 체크박스 개별 선택
    $(".checkbox_group").on("click", ".normal", function () {
        var is_checked = true;

        $(".checkbox_group .normal").each(function () {
            is_checked = is_checked && $(this).is(":checked");
        });

        $("#check_all").prop("checked", is_checked);
    });

    function toggleContent(dlElement) {
        // 현재 클릭한 dl 요소에서 dd 요소 찾기
        const ddElement = dlElement.nextElementSibling;

        // dd 요소 토글
        if (ddElement.style.display === 'none' || ddElement.style.display === '') {
            ddElement.style.display = 'block';
        } else {
            ddElement.style.display = 'none';
        }
    }
    // 각 dl 요소에 클릭 이벤트 리스너를 추가합니다.
    const dlElements = document.querySelectorAll('dl');
    dlElements.forEach(dlElement => {
        dlElement.addEventListener('click', () => {
            toggleContent(dlElement);
        });
    });

    'use strict';

    const openBtn = document.querySelector('.button--open');
    const closeBtn = document.querySelector('.button--close');
    const modal = document.querySelector('.modal--bg');

    openBtn.addEventListener('click', showModal);
    closeBtn.addEventListener('click', closeModal);

    function showModal() {
        modal.classList.remove('hidden');
        modal.classList.add('visible');
    }

    function closeModal() {
        modal.classList.add('hidden');
        modal.classList.remove('visible');
    }
</script>
<script>
    function phoneAuth(){
        var modal = $("#myModal");
        modal.css("display", "block");
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
</div>
</html>