<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link href="resources/static/css/style.css" rel="stylesheet">
</head>

<script>
    var customerID = "<%=(String) session.getAttribute("customerID")%>";
    console.log(customerID);
</script>

<style>

    .main {
        width: 100%;
        height: 850px;
    }.menu1-1{
         text-align: center;
         padding-top: 10px;
         color: #008485;
         font-weight: 700;
         font-size: 20px;
     }.traveltitle{
          text-align: left;
          left: 10px;
          color: #7a7d7d;
          font-size: 29px;
          width: 1155px;
          margin: 30px auto;
          font-weight: 600;
      }
    .traveltitle hr{
        border: 1px solid #929292;
    }.contents{
         width: 1200px;
         display: flex;
         margin: 30px auto;
     }.menu1 a:hover {
          background-color: #008485;
          color: white;
      }
    .menu1 a {
        text-decoration: none;
        color: #333;
        padding: 8px 10px;
        text-align: center;
        margin: 0 auto;
        border-radius: 5px;
        transition: background-color 0.2s;
    }.menu1 {
         display: flex;
         flex-direction: column;
         width: 200px;
         border-radius: 0px;
         padding: 10px;
         float: left;
         margin: 20px;
     }.menuhr hr{
          border: 2px solid #008485;
      }.contents-1{
           padding: 10px 0 20px 20px;
           border-radius: 50px;
           width: 800px;
           display: table;
       }
    .contentsBox{
        float: left;

    }
    .contentsText{
        font-weight: 600;
        font-size: 17px;
        color: #606060;
        float: left;
        padding-top: 7px;
    }
    .section-1 div:nth-child(2){
        margin-left: auto;
    }
    .section-1{
        display: flex;
        padding: 20px 0;
    }
    .section-2{
        display: flex;
        margin-bottom: 30px;
    }
    .section-2 div:nth-child(1), .section-2 div:nth-child(2){
        box-sizing: border-box;
        background: #FFFFFF;
        border: 2px solid #EBF1F1;
        font-weight: 600;
        font-size: 20px;
        text-align: center;
        align-items: center;
        color: #000000;
        padding: 30px 0;
        margin: 0 auto;
        width: 48%;
    }
    .section-2 div:nth-child(2){
        box-sizing: border-box;
        background: #FFFFFF;
        border: 2px solid #EBF1F1;
        font-weight: 600;
        font-size: 20px;
        text-align: center;
        align-items: center;
        color: #000000;
        padding: 30px 0;
        margin: 0 auto;
        width: 48%;
    }
    .section-3{
        box-sizing: border-box;
        background: #F7F9F9;
        border-width: 1px 0px;
        border-style: solid;
        border-color: #BEBABA;

    }
    .newAccount{
        width: 141px;
        border: 1px solid rgba(0, 152, 153, 0.73);
        border-radius: 5px;
        font-weight: 700;
        font-size: 15px;
        padding: 5px 0;
        text-align: center;
        color: #008485;
        margin: 30px auto;
    }
    .hanaClassBox{
        width: 511px;
        padding: 15px 0;
        margin: 0 auto;
        background: #FFFFFF;
        border-radius: 5px;
    }
    .hanaClass{
        font-weight: 600;
        font-size: 20px;
        text-align: center;
        color: #000000;
    }
    .applyBox{
        width: 358px;
        height: 50px;
        margin: 20px auto;
        background: rgba(0, 152, 153, 0.73);
        border: 1px solid #FFFFFF;
        border-radius: 5px;
    }
    .applyBtn{
        font-weight: 700;
        font-size: 18px;
        text-align: center;
        color: #FFFFFF;
        background: rgba(0, 152, 153, 0.73);
        border: 0;
        text-align: center;
        margin: 0 auto;
        width: 100%;
        padding: 15px 0;
    }
    .classSection{
        display: flex;
        padding: 10px;
        margin: 10px 0;
    }
    .class-1{
        width: 50%;
        font-weight: 600;
        font-size: 18px;
        color: #878787;
        float: left;
    }
    .plus{
        width: 50%;
        float: right;
        text-align: right;
    }
    /* 스테퍼 컨테이너 */
    .stepper {
        display: flex;
        align-items: center;
    }

    /* 각 스탭 */
    .step {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-left: 50px;
        z-index: 1;
    }

    /* 원 형태 스타일 */
    .circle {
        width: 30px;
        height: 30px;
        border-radius: 50%;
        text-align: center;
        line-height: 31px;
        background-color: #FFFFFF;
        border: 2px solid #089b9c;
        color: #089b9c;
        font-family: 'Inter';
        font-weight: 700;
        font-size: 15px;
        margin-bottom: 5px;
    }

    /* 활성 스탭 스타일 */
    .active {
        background-color: #089b9c;
        color: #FFFFFF;
    }

    /* 가로선 스타일 */
    .line {
        width: 170px;
        height: 3px;
        background-color: #DCDCDC;
        position: relative;
        left: 180px;
    }

    /* 라벨 스타일 */
    .label {
        font-family: 'Inter';
        font-weight: 600;
        font-size: 15px;
        color: #089b9c;
    }

    .group71{
        text-align: center;
    }


    .rec6{
        float: right;
        padding: 15px;
        width: 100%;
        box-sizing: border-box;
        height: 50px;
        text-align: left;
        background: #FFFFFF;
        border: 1px solid #CDC9C9;
        border-radius: 10px;
    }
    .pay1{
        width: 49%;
        height: 50px;
        padding: 15px;
        background: #FFFFFF;
        border: 1px solid #CDC9C9;
        border-radius: 10px;
        float: left;
    }
    .pay2{
        width: 49%;
        height: 50px;
        padding: 15px;
        background: #FFFFFF;
        border: 1px solid #CDC9C9;
        border-radius: 10px;
        margin-left: 0;
        float: right;
    }

    .gradio{
        padding: 15px;
        width: 10%;
    }
    .rec7{
        box-sizing: border-box;

        position: absolute;
        width: 141px;
        height: 50px;

        background: #FFFFFF;
        border: 1px solid rgba(0, 152, 153, 0.73);
        border-radius: 10px;

    }

    #signup{
        width: 69px;
        height: 30px;

        font-family: 'Inter';
        font-style: normal;
        font-weight: 400;
        font-size: 25px;
        line-height: 30px;
        text-align: center;

        color: #000000;
    }
    .idbox{
        padding: 10px;
        box-sizing: border-box;
        text-align: left;
        display: flex;

        font-family: 'Inter';
        font-style: normal;
        font-weight: 400;
        font-size: 15px;
        line-height: 18px;
        text-align: center;

        color: #000000;


    }

    #calculate{
        box-sizing: border-box;
        width: 800px;
        height: 50px;
        background: rgba(0, 152, 153, 0.73);
        color: #FFFFFF;
        border: 1px solid rgba(0, 152, 153, 0.73);
        border-radius: 10px;
        margin-top: 30px;
    }
    .box2 > button > span{
        width: 300.21px;
        height: 18px;
        font-family: 'Inter';
        font-style: normal;
        font-weight: 700;
        font-size: 15px;
        line-height: 18px;
        text-align: center;
        color: #008485;
    }

    .flexClass{
        display: inline-block;
        width: 800px;
    }
    .contentsText1{
        font-size: 14px;
    }
    .payBox{
        margin: 0 auto;
    }
    #selAccount{
        background-color: #f0f0f0;
    }
    .groupname{
        color: #008485;
        font-size: 20px;
        font-weight: 700;
    }
    .modal {
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

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
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

    .phone-container{
        width: 100%;
        text-align: center;
        margin-top: 30px;
    }
    /*input::placeholder{*/
    /*    text-align: center;*/
    /*}*/
    .button-container:hover{
        transform:scale(1.01);
        transition: transform .2s;
    }
</style>
<body>
<header>
    <div class="navAll">
        <div class="upper">
            <ul class="link_crfix">
                <li class="item">
                    <a class="headerLink" href="https://www.hanainsure.co.kr/">
                        하나손해보험
                    </a>
                </li>
                <li class="item">
                    <a class="headerLink" href="/introduce">
                        서비스소개
                    </a>
                </li>
                <li class="item">
                    <a class="headerLink" href="https://www.hanafn.com:8002/info/people/careerNonscheduledEmploy.do">
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
                <li><div class="welcomeMent" id="customerID" data-customerID="<%=customerID%>"><%= name %> (<%=customerID%>)님 환영합니다</div></li>
                <li><a class="headerLink" href="javascript:void(0);" onclick="logout();">로그아웃</a></li>
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
                    <ul>
                        <li><a href="/introduce">하나Insure Fit이란?</a></li>
                        <li><a href="/recommendInsu">Grade보험</a></li>
                        <li><a href="/weightManage">건강관리</a></li>
                        <li><a href="/dashboardMypage" style="color:#00857E">마이페이지</a></li>
                    </ul>
                </ul>
            </nav>
        </div>
    </div>
</header>
<div class="main">
    <section  id="hero-animated" class="hero-animated2 align-items-center">
        <div id='mask_wrap2'>
            <div id="mask"></div>
            <div id="wrap2">
                <div class="section-header mt-4">
                    <h3 style="font-family: 'Nanum Gothic', sans-serif; font-weight: 700;">가족 구성원 초대</h3>
                </div>
                <div class="container" style="width:700px;">
                    <h4 style="font-family: 'Pretendard-Regular';" class="mt-4 fw-bolder">
                        하나케어 우리가족지킴이에 ${ loginVO.name }님이 초대되셨습니다.
                    </h4>
                    <h5 class="mt-4">
                        <strong>수락하기를 누르시면 그룹에 다음 정보를 제공합니다.</strong>
                        <h5>· 건강검진 결과 정보</h5>
                        <h5>· 보유 보험 정보</h5>
                    </h5>
                    <h5 class="mt-4">
                        <strong>수락하기를 누르시면 다음 정보를 제공받을 수 있습니다.</strong>
                        <h5>· 초대 수락한 가족 건강검진 결과</h5>
                        <h5>· 가족 건강검진 결과 비교 차트</h5>
                        <h5>· 가족 보유 보험 정보</h5>

                    </h5>
                    <div class="d-flex justify-content-center" style="margin-top: 60px;">
                        <form action="${ pageContext.request.contextPath}/">

                            <input name="groupId" type="hidden">
                            <button class="btn-getstarted scrollto me-2" style="font-family: 'Pretendard-Regular';" type="submit" id="clickBtn" onclick="sure()">수락하기</button>
                        </form>
                        <a class="btn-getstarted scrollto" style="font-family: 'Pretendard-Regular';" type="button" id="clickBtn" onclick="nextStep()">거절하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
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
</div>
<script>
    // 모달창 열기
    function phoneAuth(){
        var modal = $("#myModal");
        modal.css("display", "block");
    };
    var span = $(".close").eq(0);
    span.click(function(){
        var modal = $("#myModal");
        modal.css("display", "none");
    })

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
    function submitForm() {
        // serialize 함수를 사용하여 문자열로 직렬화
        var formData = $("#groupForm").serialize();

        // 폼 데이터를 파싱하여 JSON 객체로 변환
        var formDataObj = {};
        formData.split('&').forEach(function(item) {
            var pair = item.split('=');
            formDataObj[pair[0]] = decodeURIComponent(pair[1] || '');
        });
        $.ajax({
            url: "/insertGroupDetail", // 실제 서버 URL로 변경
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify(formDataObj), // JSON 형식으로 데이터 전송
            success: function(response) {
                alert(response);
                location.href='groupInvite'
            },
            error: function(error) {
                console.error("에러 발생:", error);
            }
        });
    }
</script>
</body>
</html>