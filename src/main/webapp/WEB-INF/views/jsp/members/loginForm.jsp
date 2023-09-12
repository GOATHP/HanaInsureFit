<%--
  Created by IntelliJ IDEA.
  User: ajou
  Date: 2023-09-05
  Time: 오후 8:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript">
        if('${msg}')
            alert('${msg}')
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h1>로그인 페이지 입니다.</h1>
<%-- <h1><spring:message code="label.title"/></h1> --%>
<div align="left">
    <form id="loginForm" method="post">
        <div class="form-group">
            <label for="username">이메일</label>
            <input type="text" id="username" name="email">
        </div>
        <div class="form-group">
            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password">
        </div>
        <input type="button" class="login-button " value="로그인" onclick="loginFormFunc(); return false;">
    </form>
</div>
</body>
<script>
    // 모달 열기 함수
    function openModalLogin() {
        document.getElementById("myModalLogin").style.display = "block";
    }
    // 모달 닫기 함수
    function closeModalLogin() {
        document.getElementById("myModalLogin").style.display = "none";
    }

    // 로그인
    function loginFormFunc() {
        console.log("꿀");
        // var formData = $("#loginForm").serialize();
        var email = $("#username").val();
        var password = $("#password").val();

        console.log(email);
        console.log(password);

        $.ajax({
            type: "POST",
            url: "/loginMember",
            data: JSON.stringify({
                email: email,
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
</script>
</html>
