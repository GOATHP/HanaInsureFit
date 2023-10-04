<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en"><head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>관리자 페이지 - Dashboard</title>

    <!-- Custom fonts for this template -->
    <link href="resources/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="resources/static/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<script>
    function maskSensitiveInfo(info) {
        // 주민번호 마스킹 (981223-1111111 -> 9812XX-XXXXXX)
        var maskedIdentifyNum = info.identifyNum.replace(/(\d{6})-(\d{7})/, "$1-*******");

        // 전화번호 마스킹 (01012345678 -> 010-XXXX-XXXX)
        var maskedPhoneNum = info.phoneNum.replace(/(\d{3})(\d{4})(\d{4})/, "$1-****-$3");

        // 패스워드 마스킹 (abc12345 -> ********)
        var maskedPassword = "*".repeat(info.password.length);

        return {
            ...info,
            identifyNum: maskedIdentifyNum,
            phoneNum: maskedPhoneNum,
            password: maskedPassword
        };
    }

    function populateTable(data) {
        var tbody = document.querySelector('tbody');

        // 데이터를 순회하면서 행을 추가
        data.forEach(function(item, index) { // 두 번째 매개변수로 인덱스를 받습니다.

            var row = document.createElement('tr');

            if (index % 2 === 0) {
                row.classList.add('even');
            } else {
                row.classList.add('odd');
            }

            // 각 속성에 대한 데이터를 삽입
            for (var key in item) {

                var cell = document.createElement('td');

                // 민감한 정보일 경우 마스킹 처리
                if (key === 'identifyNum' || key === 'phoneNum' || key === 'password') {
                    console.log((item)[key]);
                    // console.log(maskSensitiveInfo('981223-1111111'));
                    console.log(maskSensitiveInfo(item)[key]);
                    cell.textContent = maskSensitiveInfo(item)[key];

                } else {
                    cell.textContent = item[key];
                }

                if (Object.keys(item).indexOf(key) === 0) {
                    cell.classList.add('sorting_1');
                }


                if (key === 'gender') {
                    if (item.gender === 0) {
                        cell.textContent = "여성";
                    } else if (item.gender === 1) {
                        cell.textContent = "남성";
                    }
                }

                        if (key === 'weightGoal') {
                    if (item.weightGoal === 0) {
                        cell.textContent = "감량";
                    } else if (item.weightGoal === 1) {
                        cell.textContent = "증량";
                    } else if (item.weightGoal === 2) {
                        cell.textContent = "유지";
                    } else {
                        cell.textContent = "알 수 없음";
                    }
                }


                if (item[key] === "admin") {
                    return;
                }
                if (Object.keys(item).indexOf(key) === 0) {
                    cell.classList.add('sorting_1');
                }


                var mailCell = document.createElement('td');
                mailCell.textContent = '메일 발송';

                row.appendChild(cell);

            }
            var mailCell = document.createElement('td');
            var mailButton = document.createElement('button');
            mailButton.classList.add('custom-button-class');

            mailButton.textContent = '메일 보내기';
            // mailButton.addEventListener('click', function() {
            //     sendEmail(item.email); // 이메일 주소로 이메일을 보내는 함수 호출
            // });
            mailCell.appendChild(mailButton);
            row.appendChild(mailCell);

            tbody.appendChild(row);
        });
    }

</script>
<script>
    $(document).ready(function () {
        $.ajax({
            url: 'getAllMember', // 서버 엔드포인트를 지정
            method: 'POST', // 또는 'POST'에 따라 요청 방식 선택
            dataType: 'json', // 받아올 데이터 타입 (JSON 예상)
            success: function (response) {
                console.log(response)
                populateTable(response);


                var tbody = document.querySelector('tbody');
                tbody.removeChild(tbody.firstElementChild);
            },
            error: function (error) {
                console.error('데이터를 가져오는 중 오류 발생: ', error);
            }
        });
    });
</script>
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
            <img src="resources/static/image/플젝로고.png" alt="프로젝트 로고" style= "width:110%">
            <%--            <div class="sidebar-brand-icon rotate-n-15">--%>
            <%--                <i class="fas fa-laugh-wink"></i>--%>
            <%--            </div>--%>
            <%--            <div class="sidebar-brand-text mx-3">하나 InsureFit</div>--%>
        </a>
        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item">
            <a class="nav-link" href="/dashboardMypage">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>대시보드</span></a>
        </li>
        <!-- Divider -->
        <hr class="sidebar-divider">
        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link" href="/manageInsu">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>상품관리</span></a>
        </li>
        <hr class="sidebar-divider d-none d-md-block">
        <!-- Nav Item - Charts -->
        <li class="nav-item">
            <a class="nav-link" href="/manageMember">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>회원관리</span></a>
        </li>
        <hr class="sidebar-divider d-none d-md-block">
        <!-- Divider -->

        <!-- Heading -->

        <!-- Divider -->

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <form class="form-inline">
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                </form>

                <!-- Topbar Search -->
                <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </form>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-search fa-fw"></i>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                            <form class="form-inline mr-auto w-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>

                    <!-- Nav Item - Alerts -->
                    <li class="nav-item dropdown no-arrow mx-1">
                        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-bell fa-fw"></i>
                            <!-- Counter - Alerts -->
                            <span class="badge badge-danger badge-counter">3+</span>
                        </a>
                        <!-- Dropdown - Alerts -->
                        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                            <h6 class="dropdown-header">
                                Alerts Center
                            </h6>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-primary">
                                        <i class="fas fa-file-alt text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 12, 2019</div>
                                    <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-success">
                                        <i class="fas fa-donate text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 7, 2019</div>
                                    $290.29 has been deposited into your account!
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-warning">
                                        <i class="fas fa-exclamation-triangle text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 2, 2019</div>
                                    Spending Alert: We've noticed unusually high spending for your account.
                                </div>
                            </a>
                            <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                        </div>
                    </li>

                    <!-- Nav Item - Messages -->
                    <li class="nav-item dropdown no-arrow mx-1">
                        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-envelope fa-fw"></i>
                            <!-- Counter - Messages -->
                            <span class="badge badge-danger badge-counter">7</span>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                            <h6 class="dropdown-header">
                                Message Center
                            </h6>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="img/undraw_profile_1.svg" alt="...">
                                    <div class="status-indicator bg-success"></div>
                                </div>
                                <div class="font-weight-bold">
                                    <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                        problem I've been having.</div>
                                    <div class="small text-gray-500">Emily Fowler · 58m</div>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="img/undraw_profile_2.svg" alt="...">
                                    <div class="status-indicator"></div>
                                </div>
                                <div>
                                    <div class="text-truncate">I have the photos that you ordered last month, how
                                        would you like them sent to you?</div>
                                    <div class="small text-gray-500">Jae Chun · 1d</div>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="img/undraw_profile_3.svg" alt="...">
                                    <div class="status-indicator bg-warning"></div>
                                </div>
                                <div>
                                    <div class="text-truncate">Last month's report looks great, I am very happy with
                                        the progress so far, keep up the good work!</div>
                                    <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="...">
                                    <div class="status-indicator bg-success"></div>
                                </div>
                                <div>
                                    <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                        told me that people say this to all dogs, even if they aren't good...</div>
                                    <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                </div>
                            </a>
                            <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                        </div>
                    </li>

                    <div class="topbar-divider d-none d-sm-block"></div>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                            <img class="img-profile rounded-circle" src="img/undraw_profile.svg">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                Profile
                            </a>
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                Settings
                            </a>
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                Activity Log
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Logout
                            </a>
                        </div>
                    </li>

                </ul>

            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">회원관리</h1>
<%--                <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.--%>
<%--                    For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>--%>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary" style="color: white !important;">가입 고객 명단</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="
    border: 1px solid black;
">
                                <thead>
                                <tr style="border: 1px solid black; background-color: #00857E !important; color:white;">
                                    <th>고객아이디</th>
                                    <th>성명</th>
                                    <th>주민번호</th>
                                    <th>성별</th>
                                    <th>나이</th>
                                    <th>이메일 주소</th>
                                    <th>전화번호</th>
                                    <th>고객 비밀번호</th>
                                    <th>가입날짜</th>
                                    <th>고객 체중 목표</th>
                                    <th>메일 발송</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <th></th>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
<%--        <footer class="sticky-footer bg-white">--%>
<%--            <div class="container my-auto">--%>
<%--                <div class="copyright text-center my-auto">--%>
<%--                    <span>Copyright © Your Website 2020</span>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </footer>--%>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<%--<!-- Logout Modal-->--%>
<%--<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
<%--    <div class="modal-dialog" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>--%>
<%--                <button class="close" type="button" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">×</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>--%>
<%--                <a class="btn btn-primary" href="login.html">Logout</a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<div class="modal">
    <div class="modal_body">
        <div class="closeDiv">
            <button class="btn-close-popup">닫기</button>
        </div>
        <div class="form-container">
            <h1>메일 보내기</h1>

            <form action="/mail/send" method="post">
                <table>
                    <tr>
                        <td>메일 주소</td>
                        <td>
                            <input type="text" name="address" placeholder="이메일 주소를 입력하세요">
                        </td>
                    </tr>
                    <tr>
                        <td>제목</td>
                        <td>
                            <input type="text" name="title" placeholder="제목을 입력하세요">
                        </td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td>
                            <textarea name="content" placeholder="보낼 내용을 입력하세요"> </textarea>
                        </td>
                    </tr>
                </table>
                <button>발송</button>
            </form>


        </div>
        </div>
</div>
<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="vendor/datatables/jquery.dataTables.min.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="js/demo/datatables-demo.js"></script>



</body></html><html lang="en"><head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Tables</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">


<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<%--<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
<%--    <div class="modal-dialog" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>--%>
<%--                <button class="close" type="button" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">×</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>--%>
<%--                <a class="btn btn-primary" href="login.html">Logout</a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<!-- Bootstrap core JavaScript-->
<script src="resources/static/vendor/jquery/jquery.min.js"></script>
<script src="resources/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="resources/static/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="resources/static/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="resources/static/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="resources/static/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->

<script src="resources/static/js/demo/datatables-demo.js"></script>

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

</body>
<script>
    window.onload = function(){
        const modal = document.querySelector('.modal');
        const modal_body = document.querySelector('.modal_body');
        const form_container = document.querySelector('.form-container');
        const btnOpenPopups = document.querySelectorAll('.custom-button-class');

        // 각 버튼에 대한 이벤트 리스너 등록
        btnOpenPopups.forEach(function(btnOpenPopup) {
            btnOpenPopup.addEventListener('click', () => {
                modal.style.display = 'block';
                form_container.style.display = 'block';
            });
        });
        function closeModal() {
            var modal = document.querySelector(".modal");
            modal.style.display = "none"; // 모달을 숨기도록 설정
        }
        var closePopupButton = document.querySelector(".btn-close-popup");
        closePopupButton.addEventListener("click", closeModal);
    }
</script>


</html>