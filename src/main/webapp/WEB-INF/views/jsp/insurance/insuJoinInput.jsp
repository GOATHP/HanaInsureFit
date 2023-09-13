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
    </style>
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
                    String identifyNum = (String) session.getAttribute("identifyNum");
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
            <div class="insuInfo2">
            보험 가입 신청서
            </div>

            <div class="areaContainer">

                <div class="rightArea5">

                    <div class="tableContainer">
                    <table>
                        <tr>
                            가입자 정보
                        </tr>
                        <tr>
                            <th>
                                이름
                            </th>
                            <td>
                                <%= name %>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                나이/성별
                            </th>
                            <td>
                                28세(남자)
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
                                    if (healthGrade >= 1 && healthGrade <= 2) {
                                        healthGradeText = "Grade1";
                                    } else if (healthGrade >= 3 && healthGrade <= 4) {
                                        healthGradeText = "Grade2";
                                    } else if (healthGrade >= 5 && healthGrade <= 6) {
                                        healthGradeText = "Grade3";
                                    } else if (healthGrade >= 7 && healthGrade <= 9) {
                                        healthGradeText = "Grade4";
                                    } else {
                                        // 다른 경우에 대한 처리
                                        healthGradeText = "알 수 없음"; // 예를 들어, 범위를 벗어나는 값인 경우
                                    }
                                %>
                                <%=healthGrade%>등급(<%=healthGradeText%>)
                            </td>
                        </tr>
                        <tr>
                            <th>
                                주민등록번호
                            </th>
                            <td>
                                <%= identifyNum %>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                자택주소
                            </th>
                            <td>
                                서울시 강서구 화곡로 11번지
                            </td>
                        </tr>
                        <tr>
                            <th>
                                전화번호
                            </th>
                            <td>
                                010-3333-2222
                            </td>
                        </tr>

                    </table>
                </div>
                    <div class="tableContainer">
                        <table>
                            <tr>
                                보험 정보
                            </tr>
                            <tr>
                                <th>
                                    보험명
                                </th>
                                <td>
                                    무배당 Grade 건강 보험
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    보험료
                                </th>
                                <td>
                                    78,900원
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
                                    포인트
                                </th>
                                <td>
                                    <input>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    최종 가입료
                                </th>
                                <td>
                                    78,900원
                                </td>

                        </table>
                    </div>
            </div>
    </div>
    </main>
</div>
</div>
<footer id="footer">
    <div>Contact us | 개인정보처리방침 | 고객정보취급방침 | 건강한 소리(부정제보) | 인천 서구 에코로 167 하나금융그룹 통합데이터센터 비전센터 5층 | Copyright ©
        Hana TI 2019. ALL RIGHT RESERVE
    </div>
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


</div>
</html>