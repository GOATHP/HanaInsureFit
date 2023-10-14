<%--
  Created by IntelliJ IDEA.
  User: ajou
  Date: 2023-09-21
  Time: 오후 6:38
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>마이 페이지 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="resources/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" rel="stylesheet">
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <style type="text/css">
        .modal {
            font-family: "NanumSquareRoundB", sans-serif;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: none;
            z-index: 2;
            background-color: rgba(0, 0, 0, 0.4);
        }

        #pointTable {
            width: 670px;
        }

        .modal.show {
            display: block;
        }

        .modal_body {
            display: flex;
            align-items: center;
            position: absolute;
            top: 50%;
            left: 50%;
            width: 1000px;
            /*height: 600px;*/
            padding: 40px;
            text-align: center;
            background-color: rgb(255, 255, 255);
            border-radius: 10px;
            box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
            flex-direction: column;
            transform: translateX(-50%) translateY(-50%);
        }

        /* Chart.js */
        @keyframes chartjs-render-animation {
            from {
                opacity: .99
            }
            to {
                opacity: 1
            }
        }

        .middleCon {
            align-items: center;
            /* background-color: #ecf0f1; */
            background-color: #ecf0f1;
            width: 250px;
            height: 100%;
            padding-top: 20px;
            padding-bottom: 20px;
            display: flex;
            border-radius: 25px;
            box-shadow: 1px 1px 12px 0px rgb(0 0 0 /20%);
            box-sizing: border-box;

            .chartjs-render-monitor {
                animation: chartjs-render-animation 1ms
            }

            .chartjs-size-monitor, .chartjs-size-monitor-expand, .chartjs-size-monitor-shrink {
                position: absolute;
                direction: ltr;
                left: 0;
                top: 0;
                right: 0;
                bottom: 0;
                overflow: hidden;
                pointer-events: none;
                visibility: hidden;
                z-index: -1
            }

            .chartjs-size-monitor-expand > div {
                position: absolute;
                width: 1000000px;
                height: 1000000px;
                left: 0;
                top: 0
            }

            .chartjs-size-monitor-shrink > div {
                position: absolute;
                width: 200%;
                height: 200%;
                left: 0;
                top: 0
            }</style>
</head>
<script src="resources/static/js/sb-admin-2.js"></script>

<script>

</script>
<style>
    .insuTable {
        border-collapse: collapse;
        width: 100%;
        text-align: center;

    }

    .insuTable th {
        background-color: #009490;
        border: 1px solid #001e1f;
        border-collapse: collapse;
        padding: 10px 10px;
        font-size: 16px;
        width: 100px;
        color: white;
    }

    .insuTable td {
        border: 1px solid #001e1f;
        border-collapse: collapse;
        padding: 10px 10px;
        font-size: 16px;
        text-align: left;
        background-color: white;
    }

    .insuTable2 {
        border-collapse: collapse;
        width: 100%;
        text-align: center;

    }

    .insuTable2 th {
        background-color: #009490;
        border: 1px solid #001e1f;
        border-collapse: collapse;
        padding: 10px 10px;
        font-size: 16px;
        width: 150px;
        color: white;
    }

    .insuTable2 td {
        border: 1px solid #001e1f;
        border-collapse: collapse;
        padding: 10px 10px;
        font-size: 16px;
        text-align: left;
        background-color: white;
    }

    .sideBar {
        font-weight: bold;
        text-align: center;
        display: flex;
        width: 20%;
        min-width: 20%;
        flex-direction: column;
    }

    .sideBarTab {
        padding: 10px;
        font-weight: normal;
        color: #7e7b7b;
    }

    .sideBarTabClicked {
        padding: 10px;
        font-weight: normal;
        color: #00857E;
    }

    .sideBarName {
        background-color: #00857E;
        padding: 20px;
        color: white;
        font-size: 30px;
        margin-bottom: 20px;
    }

    .sideBarContents {
        display: flex;
        flex-direction: column;
        font-size: 25px;
    }


    .navAll {
        width: 100%;
    }

    .upper {
        display: flex;
        justify-content: space-between;
        align-items: center;
        list-style: none;
    }

    .headerLink {
        color: #4d4d4d;
    }

    header {
        background-color: #ffffff;
        padding: 10px;
        text-align: center;
        font-family: "NanumSquareRoundEB", sans-serif;
        /* "Hana" 폰트 적용 */
        border-bottom: 1px solid #00857E;
        /* 청록색 줄 추가 */
        padding-bottom: 20px;
        padding-top: 20px;
        position: relative;
    }

    .link_crfix {
        display: flex;
        list-style: none;
        margin: 0;
        line-height: inherit;
        padding-left: 0px;
        padding-bottom: 20px;
        font-size: 14px;
        color: #4d4d4d;
    }

    li .item a {
        color: #4d4d4d;
    }

    nav ul {
        list-style: none;
        margin: 0;

        padding-left: 0px;
        display: flex;
        justify-content: center;
        font-weight: 300;
        white-space: nowrap;
    }

    nav li {
        padding: 10px;
        min-width: 20px;
        display: block;
        padding-right: 40px;


    }

    nav li a {
        color: rgb(37, 36, 36);
        text-decoration: none;
        font-size: 22px;
        font-weight: bold;
    }

    nav li a:hover {
        color: #00857E;
        /* 호버 시 색상 변경 */
    }


    .link_crfix li:hover {
        color: #00857E;
        /* 호버 시 색상 변경 */
    }

    .link_crfix .item {
        overflow: hidden;
        background-color: transparent;
        border: none;
        cursor: pointer;
    }

    .item {
        background-color: transparent;
        font-size: 14px;
        color: #4d4d4d;
        border: none;
        padding: 8px 16px;
    }

    .item:hover {
        color: #00857E;
        /* 호버 시 텍스트 색상 변경 */
    }

    .menu {
        text-align: left;
        padding-top: 8px;
        color: #7e7b7b;
        font-weight: normal;
    }

    .welcomeMent {
        margin-right: 20px;
    }

    div.logo img {
        width: 200px;
        /* 원하는 가로 크기로 조정 */
        height: auto;
        float: left;
        /* 왼쪽으로 플로팅 */
        margin-right: 20px;
    }
</style>

<body id="page-top" style="width:1500px; margin:0 auto" ;>
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
                <li>
                    <div class="welcomeMent" id="customerID" data-customerID="<%=customerID%>"><%= name %>
                        (<%=customerID%>)님 환영합니다
                    </div>
                </li>
                <li><a class="headerLink" href="javascript:void(0);" onclick="logout();">로그아웃</a></li>
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
<!-- Page Wrapper -->
<div id="wrapper" style="margin: 30px auto" ;>
    <div class="sideBar">
        <div class="sideBarName">
            마이페이지
        </div>
        <div class="sideBarContents">
            <a href="/dashboardMypage" class="sideBarTabClicked">
                대시보드
            </a>
            <%--            <a href="/insuGradeSubmit" class="sideBarTab">--%>
            <%--                건강등급등록--%>
            <%--            </a>--%>
            <a href="/weightManage" class="sideBarTab">
                식단 관리
            </a>
            <a href="/weightAuth" class="sideBarTab">
                체중정보 갱신
            </a>
            <a href="/recommendInsu" class="sideBarTab">
                건강등급 갱신
            </a>


            <%--            <a href="/insuJoin" class="sideBarTab">--%>
            <%--                Grade보험가입--%>
            <%--            </a>--%>

        </div>
    </div>
    <%--    <!-- Sidebar -->--%>
    <%--    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">--%>

    <%--        <!-- Sidebar - Brand -->--%>
    <%--&lt;%&ndash;        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">&ndash;%&gt;--%>
    <%--&lt;%&ndash;&lt;%&ndash;            <img src="resources/static/image/플젝로고.png" alt="프로젝트 로고" style= "width:110%">&ndash;%&gt;&ndash;%&gt;--%>
    <%--&lt;%&ndash;&lt;%&ndash;            <div class="sidebar-brand-icon rotate-n-15">&ndash;%&gt;&ndash;%&gt;--%>
    <%--&lt;%&ndash;&lt;%&ndash;                <i class="fas fa-laugh-wink"></i>&ndash;%&gt;&ndash;%&gt;--%>
    <%--&lt;%&ndash;&lt;%&ndash;            </div>&ndash;%&gt;&ndash;%&gt;--%>
    <%--&lt;%&ndash;&lt;%&ndash;            <div class="sidebar-brand-text mx-3">하나 InsureFit</div>&ndash;%&gt;&ndash;%&gt;--%>
    <%--&lt;%&ndash;        </a>&ndash;%&gt;--%>

    <%--        <!-- Divider -->--%>
    <%--        <hr class="sidebar-divider my-0">--%>

    <%--        <!-- Nav Item - Dashboard -->--%>

    <%--        <!-- Divider -->--%>
    <%--&lt;%&ndash;        <hr class="sidebar-divider">&ndash;%&gt;--%>

    <%--        <!-- Heading -->--%>
    <%--&lt;%&ndash;        <div class="sidebar-heading">&ndash;%&gt;--%>
    <%--&lt;%&ndash;            Interface&ndash;%&gt;--%>
    <%--&lt;%&ndash;        </div>&ndash;%&gt;--%>

    <%--        <!-- Nav Item - Pages Collapse Menu -->--%>

    <%--        <li class="nav-item">--%>
    <%--            <a class="nav-link" href="charts.html">--%>
    <%--                <i class="fas fa-fw fa-chart-area"></i>--%>
    <%--                <span>대시보드</span></a>--%>
    <%--        </li>--%>
    <%--        <hr class="sidebar-divider d-none d-md-block">--%>
    <%--        <li class="nav-item">--%>
    <%--            <a class="nav-link" href="charts.html">--%>
    <%--                <i class="fas fa-fw fa-chart-area"></i>--%>
    <%--                <span>식단 관리</span></a>--%>
    <%--        </li>--%>
    <%--        <hr class="sidebar-divider d-none d-md-block">--%>
    <%--        <!-- Nav Item - Charts -->--%>
    <%--        <li class="nav-item">--%>
    <%--            <a class="nav-link" href="/manageMember">--%>
    <%--                <i class="fas fa-fw fa-chart-area"></i>--%>
    <%--                <span>건강등급 갱신</span></a>--%>
    <%--        </li>--%>
    <%--        <hr class="sidebar-divider d-none d-md-block">--%>
    <%--        <li class="nav-item">--%>
    <%--            <a class="nav-link" href="charts.html">--%>
    <%--                <i class="fas fa-fw fa-chart-area"></i>--%>
    <%--                <span>체중정보 갱신</span></a>--%>
    <%--        </li>--%>

    <%--        <hr class="sidebar-divider d-none d-md-block">--%>
    <%--        <!-- Nav Item - Tables -->--%>
    <%--        <li class="nav-item">--%>
    <%--            <a class="nav-link" href="tables.html">--%>
    <%--                <i class="fas fa-fw fa-table"></i>--%>
    <%--                <span>개인정보 변경</span></a>--%>
    <%--        </li>--%>

    <%--        <!-- Divider -->--%>
    <%--        <hr class="sidebar-divider d-none d-md-block">--%>

    <%--        <!-- Sidebar Toggler (Sidebar) -->--%>

    <%--        <!-- Sidebar Message -->--%>


    <%--    </ul>--%>
    <%--    <!-- End of Sidebar -->--%>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content" style="background: white;">

            <%--            <!-- Topbar -->--%>
            <%--            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow" style="--%>
            <%--    height: 86px;">--%>

            <%--                <!-- Sidebar Toggle (Topbar) -->--%>
            <%--                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">--%>
            <%--                    <i class="fa fa-bars"></i>--%>
            <%--                </button>--%>

            <%--                <!-- Topbar Search -->--%>
            <%--                <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">--%>
            <%--                    <div class="input-group">--%>
            <%--                        <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">--%>
            <%--                        <div class="input-group-append">--%>
            <%--                            <button class="btn btn-primary" type="button">--%>
            <%--                                <i class="fas fa-search fa-sm"></i>--%>
            <%--                            </button>--%>
            <%--                        </div>--%>
            <%--                    </div>--%>
            <%--                </form>--%>

            <%--                <!-- Topbar Navbar -->--%>
            <%--                <ul class="navbar-nav ml-auto">--%>

            <%--                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->--%>
            <%--                    <li class="nav-item dropdown no-arrow d-sm-none">--%>
            <%--                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
            <%--                            <i class="fas fa-search fa-fw"></i>--%>
            <%--                        </a>--%>
            <%--                        <!-- Dropdown - Messages -->--%>
            <%--                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">--%>
            <%--                            <form class="form-inline mr-auto w-100 navbar-search">--%>
            <%--                                <div class="input-group">--%>
            <%--                                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">--%>
            <%--                                    <div class="input-group-append">--%>
            <%--                                        <button class="btn btn-primary" type="button">--%>
            <%--                                            <i class="fas fa-search fa-sm"></i>--%>
            <%--                                        </button>--%>
            <%--                                    </div>--%>
            <%--                                </div>--%>
            <%--                            </form>--%>
            <%--                        </div>--%>
            <%--                    </li>--%>

            <%--                    <!-- Nav Item - Alerts -->--%>
            <%--                    <li class="nav-item dropdown no-arrow mx-1" style="padding-right: 0px;">--%>
            <%--                        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
            <%--                            <i class="fas fa-bell fa-fw"></i>--%>
            <%--                            <!-- Counter - Alerts -->--%>
            <%--                            <span class="badge badge-danger badge-counter">3+</span>--%>
            <%--                        </a>--%>
            <%--                        <!-- Dropdown - Alerts -->--%>
            <%--                        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">--%>
            <%--                            <h6 class="dropdown-header">--%>
            <%--                                Alerts Center--%>
            <%--                            </h6>--%>
            <%--                            <a class="dropdown-item d-flex align-items-center" href="#">--%>
            <%--                                <div class="mr-3">--%>
            <%--                                    <div class="icon-circle bg-primary">--%>
            <%--                                        <i class="fas fa-file-alt text-white"></i>--%>
            <%--                                    </div>--%>
            <%--                                </div>--%>
            <%--                                <div>--%>
            <%--                                    <div class="small text-gray-500">December 12, 2019</div>--%>
            <%--                                    <span class="font-weight-bold">A new monthly report is ready to download!</span>--%>
            <%--                                </div>--%>
            <%--                            </a>--%>
            <%--                            <a class="dropdown-item d-flex align-items-center" href="#">--%>
            <%--                                <div class="mr-3">--%>
            <%--                                    <div class="icon-circle bg-success">--%>
            <%--                                        <i class="fas fa-donate text-white"></i>--%>
            <%--                                    </div>--%>
            <%--                                </div>--%>
            <%--                                <div>--%>
            <%--                                    <div class="small text-gray-500">December 7, 2019</div>--%>
            <%--                                    $290.29 has been deposited into your account!--%>
            <%--                                </div>--%>
            <%--                            </a>--%>
            <%--                            <a class="dropdown-item d-flex align-items-center" href="#">--%>
            <%--                                <div class="mr-3">--%>
            <%--                                    <div class="icon-circle bg-warning">--%>
            <%--                                        <i class="fas fa-exclamation-triangle text-white"></i>--%>
            <%--                                    </div>--%>
            <%--                                </div>--%>
            <%--                                <div>--%>
            <%--                                    <div class="small text-gray-500">December 2, 2019</div>--%>
            <%--                                    Spending Alert: We've noticed unusually high spending for your account.--%>
            <%--                                </div>--%>
            <%--                            </a>--%>
            <%--                            <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>--%>
            <%--                        </div>--%>
            <%--                    </li>--%>

            <%--                    <!-- Nav Item - Messages -->--%>
            <%--                    <li class="nav-item dropdown no-arrow mx-1">--%>
            <%--                        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
            <%--                            <i class="fas fa-envelope fa-fw"></i>--%>
            <%--                            <!-- Counter - Messages -->--%>
            <%--                            <span class="badge badge-danger badge-counter">7</span>--%>
            <%--                        </a>--%>
            <%--                        <!-- Dropdown - Messages -->--%>
            <%--                        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">--%>
            <%--                            <h6 class="dropdown-header">--%>
            <%--                                Message Center--%>
            <%--                            </h6>--%>
            <%--                            <a class="dropdown-item d-flex align-items-center" href="#">--%>
            <%--                                <div class="dropdown-list-image mr-3">--%>
            <%--                                    <img class="rounded-circle" src="resources/static/img/undraw_profile_1.svg" alt="...">--%>
            <%--                                    <div class="status-indicator bg-success"></div>--%>
            <%--                                </div>--%>
            <%--                                <div class="font-weight-bold">--%>
            <%--                                    <div class="text-truncate">Hi there! I am wondering if you can help me with a--%>
            <%--                                        problem I've been having.</div>--%>
            <%--                                    <div class="small text-gray-500">Emily Fowler · 58m</div>--%>
            <%--                                </div>--%>
            <%--                            </a>--%>
            <%--                            <a class="dropdown-item d-flex align-items-center" href="#">--%>
            <%--                                <div class="dropdown-list-image mr-3">--%>
            <%--                                    <img class="rounded-circle" src=resources/static/img/undraw_profile_2.svg" alt="...">--%>
            <%--                                    <div class="status-indicator"></div>--%>
            <%--                                </div>--%>
            <%--                                <div>--%>
            <%--                                    <div class="text-truncate">I have the photos that you ordered last month, how--%>
            <%--                                        would you like them sent to you?</div>--%>
            <%--                                    <div class="small text-gray-500">Jae Chun · 1d</div>--%>
            <%--                                </div>--%>
            <%--                            </a>--%>
            <%--                            <a class="dropdown-item d-flex align-items-center" href="#">--%>
            <%--                                <div class="dropdown-list-image mr-3">--%>
            <%--                                    <img class="rounded-circle" src="resources/static/img/undraw_profile_3.svg" alt="...">--%>
            <%--                                    <div class="status-indicator bg-warning"></div>--%>
            <%--                                </div>--%>
            <%--                                <div>--%>
            <%--                                    <div class="text-truncate">Last month's report looks great, I am very happy with--%>
            <%--                                        the progress so far, keep up the good work!</div>--%>
            <%--                                    <div class="small text-gray-500">Morgan Alvarez · 2d</div>--%>
            <%--                                </div>--%>
            <%--                            </a>--%>
            <%--                            <a class="dropdown-item d-flex align-items-center" href="#">--%>
            <%--                                <div class="dropdown-list-image mr-3">--%>
            <%--                                    <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="...">--%>
            <%--                                    <div class="status-indicator bg-success"></div>--%>
            <%--                                </div>--%>
            <%--                                <div>--%>
            <%--                                    <div class="text-truncate">Am I a good boy? The reason I ask is because someone--%>
            <%--                                        told me that people say this to all dogs, even if they aren't good...</div>--%>
            <%--                                    <div class="small text-gray-500">Chicken the Dog · 2w</div>--%>
            <%--                                </div>--%>
            <%--                            </a>--%>
            <%--                            <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>--%>
            <%--                        </div>--%>
            <%--                    </li>--%>

            <%--                    <div class="topbar-divider d-none d-sm-block"></div>--%>

            <%--                    <!-- Nav Item - User Information -->--%>
            <%--                    <li class="nav-item dropdown no-arrow">--%>
            <%--                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
            <%--                            <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=customerID%></span>--%>
            <%--                            <img class="img-profile rounded-circle" src="resources/static/img/undraw_profile.svg">--%>
            <%--                        </a>--%>
            <%--                        <!-- Dropdown - User Information -->--%>
            <%--                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">--%>
            <%--                            <a class="dropdown-item" href="#">--%>
            <%--                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>--%>
            <%--                                Profile--%>
            <%--                            </a>--%>
            <%--                            <a class="dropdown-item" href="#">--%>
            <%--                                <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>--%>
            <%--                                Settings--%>
            <%--                            </a>--%>
            <%--                            <a class="dropdown-item" href="#">--%>
            <%--                                <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>--%>
            <%--                                Activity Log--%>
            <%--                            </a>--%>
            <%--                            <div class="dropdown-divider"></div>--%>
            <%--                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">--%>
            <%--                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>--%>
            <%--                                Logout--%>
            <%--                            </a>--%>
            <%--                        </div>--%>
            <%--                    </li>--%>

            <%--                </ul>--%>

            <%--            </nav>--%>
            <%--            <!-- End of Topbar -->--%>

            <!-- Begin Page Content -->
            <div class="container-fluid" style="margin-top: 30px;">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">My Page</h1>
                    <%--                    <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>--%>
                </div>

                <%--                <!-- Content Row -->--%>
                <%--                <div class="row">--%>

                <%--                    <!-- Earnings (Monthly) Card Example -->--%>
                <%--                    <div class="col-xl-3 col-md-6 mb-4">--%>
                <%--                        <div class="card border-left-primary shadow h-100 py-2">--%>
                <%--                            <div class="card-body">--%>
                <%--                                <div class="row no-gutters align-items-center">--%>
                <%--                                    <div class="col mr-2">--%>
                <%--                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">--%>
                <%--                                            회원 수</div>--%>
                <%--                                        <div class="h5 mb-0 font-weight-bold text-gray-800">4000명</div>--%>
                <%--                                    </div>--%>
                <%--                                    <div class="col-auto">--%>
                <%--                                        <i class="fas fa-calendar fa-2x text-gray-300"></i>--%>
                <%--                                    </div>--%>
                <%--                                </div>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>

                <%--                    <!-- Earnings (Monthly) Card Example -->--%>
                <%--                    <div class="col-xl-3 col-md-6 mb-4">--%>
                <%--                        <div class="card border-left-success shadow h-100 py-2">--%>
                <%--                            <div class="card-body">--%>
                <%--                                <div class="row no-gutters align-items-center">--%>
                <%--                                    <div class="col mr-2">--%>
                <%--                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">--%>
                <%--                                            보험 가입자 수</div>--%>
                <%--                                        <div class="h5 mb-0 font-weight-bold text-gray-800">2,000명</div>--%>
                <%--                                    </div>--%>
                <%--                                    <div class="col-auto">--%>
                <%--                                        <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>--%>
                <%--                                    </div>--%>
                <%--                                </div>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>

                <%--                    <!-- Earnings (Monthly) Card Example -->--%>
                <%--                    <div class="col-xl-3 col-md-6 mb-4">--%>
                <%--                        <div class="card border-left-info shadow h-100 py-2">--%>
                <%--                            <div class="card-body">--%>
                <%--                                <div class="row no-gutters align-items-center">--%>
                <%--                                    <div class="col mr-2">--%>
                <%--                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">목표회원 달성률--%>
                <%--                                        </div>--%>
                <%--                                        <div class="row no-gutters align-items-center">--%>
                <%--                                            <div class="col-auto">--%>
                <%--                                                <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>--%>
                <%--                                            </div>--%>
                <%--                                            <div class="col">--%>
                <%--                                                <div class="progress progress-sm mr-2">--%>
                <%--                                                    <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>--%>
                <%--                                                </div>--%>
                <%--                                            </div>--%>
                <%--                                        </div>--%>
                <%--                                    </div>--%>
                <%--                                    <div class="col-auto">--%>
                <%--                                        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>--%>
                <%--                                    </div>--%>
                <%--                                </div>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>

                <%--                    <!-- Pending Requests Card Example -->--%>
                <%--                    <div class="col-xl-3 col-md-6 mb-4">--%>
                <%--                        <div class="card border-left-warning shadow h-100 py-2">--%>
                <%--                            <div class="card-body">--%>
                <%--                                <div class="row no-gutters align-items-center">--%>
                <%--                                    <div class="col mr-2">--%>
                <%--                                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">--%>
                <%--                                            보험 수</div>--%>
                <%--                                        <div class="h5 mb-0 font-weight-bold text-gray-800">3</div>--%>
                <%--                                    </div>--%>
                <%--                                    <div class="col-auto">--%>
                <%--                                        <i class="fas fa-comments fa-2x text-gray-300"></i>--%>
                <%--                                    </div>--%>
                <%--                                </div>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>

                <!-- Content Row -->
                <div class="row">
                    <div class="col-lg-6 mb-4">
                        <!-- Illustrations -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-light" style="font-size: 20px" ;>나의 건강정보</h6>
                            </div>
                            <div style="
    display: flex;
    flex-direction: column;
    align-items: center;
">
                                <div class="card-body" style="display: flex;height: 330px;" ;>
                                    <div class="middleCon">
                                        <div class="centerAlign" style="font-size: 14px;margin: 0 auto;" ;>
                                            <div style="text-align: left">
                                                <div style="display: flex;flex-direction: column;align-items: center;">
                                                    <img id="gradeImg"
                                                         style="padding-top: 10px; width:100px; padding-bottom: 10px;"
                                                         alt="프로젝트">
                                                    <div id="gradeRecordDate"
                                                         style="text-align: left;font-size: 12px; color:#4d4d4d"
                                                         ;>
                                                    </div>
                                                </div>
                                                <%=name%>님의<br>
                                                <div style="display:flex;font-size: 18px;">
                                                    건강등급은&nbsp
                                                    <div style="display:flex" ;>
                                                        <div style="display:flex; color:#00857E; font-weight: bold">
                                                            Grade&nbsp
                                                            <div class="healthGrade"
                                                                 style="color:#00857E;display: flex;font-weight: bold"></div>
                                                        </div>
                                                        입니다.
                                                    </div>
                                                </div>
                                                <div style="margin: 0 auto;display: flex;justify-content: center;">
                                                    <a style="
                               font-family:NanumSquareRoundB, Arial, sans-serif;
                               padding: 8px;
                               height: auto;
                               border: none;
                               background-color: rgb(219, 36, 100);
                               color: #fff;
                               cursor: pointer;
                               border-radius: 4px;
                               margin-top:20px;
                               display: inline-block;
                               width: 130px;
                                   /*border-radius: 15px;*/
                               border: 2px solid rgb(219, 36, 100);
                               margin-bottom: 20px;
                               text-align: center;
                               " href='/compareCost'>등급할인혜택보기</a>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                    </div>
                                    <div style="padding-left: 20px;">
                                        <div class="middleCon">
                                            <table style="margin: 0 auto;color:#5a5c69;padding-top: 10px;font-size: 20px;width:220px;"
                                                   class="insuTable">
                                                <tr>
                                                    <th>키</th>
                                                    <td id="heightCell"></td>
                                                </tr>
                                                <tr>
                                                    <th>몸무게</th>
                                                    <td id="weightCell"></td>
                                                </tr>
                                                <tr>
                                                    <th>BMI</th>
                                                    <td id="bmiCell"></td>
                                                </tr>
                                                <tr>
                                                    <th>기초대사량</th>
                                                    <td id="bmrCell"></td>
                                                </tr>
                                                <tr>
                                                    <th>칼로리목표</th>
                                                    <td id="caloriesCell"></td>
                                                </tr>
                                                <tr>
                                                    <th>포인트</th>
                                                    <td id="pointCell">
                                                        <span id="pointValue"></span>
                                                        <button id="showPointList" style="font-family: NanumSquareRoundB, Arial, sans-serif;
        border: none;
        background-color: rgb(219, 36, 100);
        color: #fff;
        border-radius: 4px;
        height: 17px;
        text-align: center;">?
                                                        </button>
                                                    </td>

                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <a style="
                               font-family:NanumSquareRoundB, Arial, sans-serif;
                               padding: 8px;
                               height: auto;
                               margin-bottom: 20px;
                               border: none;
                               background-color: rgb(219, 36, 100);
                               color: #fff;
                               cursor: pointer;
                               border-radius: 4px;
                               display: inline-block;
                               width: 130px;
                               /*border-radius: 15px;*/
                               border: 2px solid rgb(219, 36, 100);
                               /* margin-bottom: 20px; */
                               text-align: center;
                               " href='/weightAuth'>체중 갱신하기</a>
                            </div>
                        </div>
                        <!-- Approach -->
                        <%--                        <div class="card shadow mb-4">--%>
                        <%--                            <div class="card-header py-3">--%>
                        <%--                                <h6 class="m-0 font-weight-bold text-primary">Development Approach</h6>--%>
                        <%--                            </div>--%>
                        <%--                            <div class="card-body">--%>
                        <%--                                <p>SB Admin 2 makes extensive use of Bootstrap 4 utility classes in order to reduce--%>
                        <%--                                    CSS bloat and poor page performance. Custom CSS classes are used to create--%>
                        <%--                                    custom components and custom utility classes.</p>--%>
                        <%--                                <p class="mb-0">Before working with this theme, you should become familiar with the--%>
                        <%--                                    Bootstrap framework, especially the utility classes.</p>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>

                    </div>
                    <!-- Content Column -->
                    <div class="col-lg-6 mb-4">

                        <!-- Project Card Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-light" style="font-size: 20px">나의 보험정보</h6>
                            </div>
                            <div style="
                                 display: flex;
                                 flex-direction: column;
                                 align-items: center;
                                 height: 394px;
                                 ">
                                <div class="card-body">
                                    <table style="margin: 0 auto;color:#5a5c69;padding-top: 10px;font-size: 20px;margin-bottom: 20px;"
                                           class="insuTable2">
                                        <tr>
                                            <th>보험명</th>
                                            <td id="insuNameCell"></td>
                                        </tr>
                                        <tr>
                                            <th>보험료</th>
                                            <td id="insuFeeCell"></td>
                                        </tr>
                                        <tr>
                                            <th>가입일자</th>
                                            <td id="startDate"></td>
                                        </tr>
                                        <tr>
                                            <th>만기일자</th>
                                            <td id="endDate"></td>
                                        </tr>
                                        <tr>
                                            <th>보장내용</th>
                                            <td id="insuContent"></td>
                                        </tr>
                                        <tr>
                                            <th>특약</th>
                                            <td>
                                                <div id="specialInsuContent" style="overflow: auto;height: 20px;"></div>
                                            </td>
                                        </tr>
                                    </table>

                                    <table class="insuTable2">
                                        <tr>
                                            <th>포인트</th>
                                            <td>
                                                <div style="display: flex;justify-content: space-between;align-items: center;">
                                                    <input id="pointInput" placeholder="잔여 포인트 : 1,000원">
                                                    <button id="consumePoint" onclick="applyPoint()">포인트 적용</button>
                                                </div>

                                            </td>
                                        </tr>
                                        <tr>
                                            <th>이번 달 보험비</th>
                                            <td>
                                                <div style="display: flex;justify-content: space-between;align-items: center;">
                                                    <span id="thisMonthFee"></span>
                                                    <button>보험금 납부</button>
                                                </div>

                                            </td>
                                        </tr>
                                    </table>

                                    <%--                                <h4 class="small font-weight-bold">Server Migration <span class="float-right">20%</span></h4>--%>
                                    <%--                                <div class="progress mb-4">--%>
                                    <%--                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>--%>
                                    <%--                                </div>--%>
                                    <%--                                <h4 class="small font-weight-bold">Sales Tracking <span class="float-right">40%</span></h4>--%>
                                    <%--                                <div class="progress mb-4">--%>
                                    <%--                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>--%>
                                    <%--                                </div>--%>
                                    <%--                                <h4 class="small font-weight-bold">Customer Database <span class="float-right">60%</span></h4>--%>
                                    <%--                                <div class="progress mb-4">--%>
                                    <%--                                    <div class="progress-bar" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>--%>
                                    <%--                                </div>--%>
                                    <%--                                <h4 class="small font-weight-bold">Payout Details <span class="float-right">80%</span></h4>--%>
                                    <%--                                <div class="progress mb-4">--%>
                                    <%--                                    <div class="progress-bar bg-info" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>--%>
                                    <%--                                </div>--%>
                                    <%--                                <h4 class="small font-weight-bold">Account Setup <span class="float-right">Complete!</span></h4>--%>
                                    <%--                                <div class="progress">--%>
                                    <%--                                    <div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>--%>
                                    <%--                                </div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <!-- Area Chart -->
                    <div class="col-xl-8 col-lg-7">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-light" style="font-size: 20px;">칼로리 추이</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                         aria-labelledby="dropdownMenuLink">
                                        <div class="dropdown-header">Dropdown Header:</div>
                                        <a class="dropdown-item" href="#">Action</a>
                                        <a class="dropdown-item" href="#">Another action</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">Something else here</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="chart-area" style="margin:0 auto" ;>
                                    <div class="chartjs-size-monitor">
                                        <div class="chartjs-size-monitor-expand">
                                            <div class=""></div>
                                        </div>
                                        <div class="chartjs-size-monitor-shrink">
                                            <div class=""></div>
                                        </div>
                                    </div>
                                    <canvas id="myAreaChart" style="display: block; width: 715px; height: 320px;"
                                            width="715" height="320" class="chartjs-render-monitor"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Pie Chart -->
                    <div class="col-xl-4 col-lg-5">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-light" style="font-size: 20px;">영양성분 비율</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                         aria-labelledby="dropdownMenuLink">
                                        <div class="dropdown-header">Dropdown Header:</div>
                                        <a class="dropdown-item" href="#">Action</a>
                                        <a class="dropdown-item" href="#">Another action</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">Something else here</a>
                                    </div>
                                </div>
                            </div>
                            <%--                            <!-- Card Body -->height: 245px;--%>
                            <div class="card-body">
                                <div class="chart-pie pt-4 pb-2">
                                    <div class="chartjs-size-monitor">
                                        <div class="chartjs-size-monitor-expand">
                                            <div class=""></div>
                                        </div>
                                        <div class="chartjs-size-monitor-shrink">
                                            <div class=""></div>
                                        </div>
                                    </div>
                                    <canvas id="myPieChart" width="376" height="245"
                                            style="display: block; width: 330px; "
                                            class="chartjs-render-monitor"></canvas>
                                </div>
                                <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> 탄수화물
                                        </span>
                                    <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> 지방
                                        </span>
                                    <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> 단백질
                                        </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal">
        <div class="modal_body"
             style="display: flex;flex-direction: column; width:700px; height:500px">
            <%--        <form action="/loginMember" id="loginForm" method="post">--%>
            <div class="closeDiv" style="
    width: 100%;
    display: flex;
    justify-content: flex-end;
">
                <button class="btn-close-popup">X</button>
            </div>
            <div style="
    display: flex;
    align-items: center;
    height: 100%;
">
            <table id="pointTable">
                <thead>
                <tr>
                    <th>번호</th>
                    <th>포인트</th>
                    <th>잔여 포인트</th>
                    <th>지급 날짜</th>
                    <th>비고</th>
                </tr>
                </thead>
                <tbody id="modal">
                </tbody>
            </table>
        </div>
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

<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<script>
    const modal = document.querySelector('.modal');
    const btnOpenPopup = document.getElementById('showPointList');


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
<!-- Bootstrap core JavaScript-->

<script src="resources/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="resources/static/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="resources/static/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="resources/static/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="resources/static/js/demo/chart-area-demo.js"></script>
<script src="resources/static/js/demo/chart-pie-demo.js"></script>
<script src="resources/static/js/demo/myPageInfo.js"></script>
<script src="resources/static/js/demo/myPageInsu.js"></script>
<script src="resources/static/js/demo/myPageInsu8.js"></script>
<script src="resources/static/js/demo/getPoint.js"></script>
<script>
    function applyPoint() {
        const pointInput = document.getElementById("pointInput");
        alert("포인트 적용이 완료되었습니다.");
        const enteredPoint = pointInput.value;

        console.log(enteredPoint);
        const thisMonthFeeElement = document.getElementById("thisMonthFee");

        // 현재 텍스트 내용을 가져오고 숫자 부분을 추출합니다.
        const currentText = thisMonthFeeElement.textContent; // 예: "73,229원(월)"
        const currentNumber = parseFloat(currentText.replace(/[^\d.-]/g, '')); // 숫자 부분만 추출 (예: 73229)

        // 빼고자 하는 값을 정의합니다.
        const subtractionValue = 10000; // 예: 10,000원

        // 값을 빼고 새로운 값을 계산합니다.
        const newNumber = currentNumber - enteredPoint;

        // 새로운 값을 요소에 설정합니다.
        thisMonthFeeElement.textContent = newNumber.toLocaleString() + "원(월)";
    }
</script>

</body>
</html>
