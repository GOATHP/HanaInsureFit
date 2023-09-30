<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="ac.kr.kopo.HanaInsureFit.insurance.vo.Insurance" %>
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
    <script>
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
                    console.log(data);
                },
                error: function () {
                    // Ajax 요청이 실패한 경우 처리할 코드를 작성합니다.
                }
            });
        };
    </script>
    <script>


        function collapse(element) {
            var before = document.getElementsByClassName("active")[0]               // 기존에 활성화된 버튼
            if (before && document.getElementsByClassName("active")[0] != element) {  // 자신 이외에 이미 활성화된 버튼이 있으면
                before.nextElementSibling.style.maxHeight = null;   // 기존에 펼쳐진 내용 접고
                before.classList.remove("active");                  // 버튼 비활성화
            }
            element.classList.toggle("active");         // 활성화 여부 toggle

            var content = element.nextElementSibling;
            if (content.style.maxHeight != 0) {         // 버튼 다음 요소가 펼쳐져 있으면
                content.style.maxHeight = null;         // 접기
            } else {
                content.style.maxHeight = content.scrollHeight + "px";  // 접혀있는 경우 펼치기
            }
        }
    </script>
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
            <div class="navInfo">Main &nbsp&nbsp> &nbsp&nbspGrade보험 > &nbsp&nbspGrade보험목록&nbsp&nbsp > &nbsp&nbspGrade보험가입</div>
            <div class="areaContainer">

                <div class="rightArea7">
                    <div class="centerAlign">
                        보험가입 약관동의
                    </div>
                        <div class="gradeInsurance">
                            <br>
                            <div class="insuMoongoo2"><br>
                                <div class="insuInfo">
                                    <span class="colorText">건강등급</span> 확인하고<br> <span class="colorText">보험료 할인</span>받으세요!
                                    <div class="explainInsu">
                                        에너지 효율이 높은 등급의 전기제품을 구입하여<br>
                                        전기료를 절약하고 계신가요?<br>
                                        이젠 보험도 건강 등급이 높으면 보험료를 할인하여<br>
                                        드립니다.
                                    </div>
                                </div>
                            </div>
                            <img src="resources/static/image/Grades.png" style="width: 400px;height: 200px;margin-top: 50px;">
                        </div>
                    <a href="/resources/static/보험약관.pdf" target="_blank" class="btn btn_icon btn_arrow acrobat_btn fr" role="button"style="
    border-radius: 5px;
    padding: 5px;
    /* margin-bottom: 30px; */
">아크로뱃 다운로드</a>
                    <div class="mainContent">

                        <button type="button" class="collapsible" onclick="collapse(this);">보험상세내용</button>
                        <div class="content">
                            <p>

                            <ul>
                                <li class="txt_dot">다이렉트로 간편하게, 보장은 다양하게
                                    판매수수료 없는 다이렉트로 쉽고, 빠르고, 저렴하게 가입</li>
                                <li class="txt_dot">특약별 보험기간, 보험료 납입기간, 피보험자 가입나이는 주계약과 상이하므로 보험약관 및 상품설명서를 확인하시기 바랍니다.</li>
                                <li class="txt_dot">다이렉트로 간편하게, 보장은 다양하게
                            판매수수료 없는 다이렉트로 쉽고, 빠르고, 저렴하게 가입</li>
                                <li class="txt_dot">질병 및 상해의 진단비, 입원·통원비, 수술비, 후유장해까지 보장 최대 100세까지 보장</li>
                                <li class="txt_dot">해당 특약 가입시 건강할수록 더 낮은 보험료 적용 건강등급별로 보험료를 산출하여 Grade1, 2 경우 저렴한 보험료로 가입 가능</li>
                                <li class="txt_dot">매2년 마다 무사고* 또는 건강등급 개선시(최대 10년) 건강등급 상향 조정</li>
                                <span class="basis">※ Grade4 → Grade3 → Grade2 → Grade1</span>
                                <li class="txt_dot">*무사고: 건강등급재산정시까지 해당상품 보험금 지급사유 미발생인 경우에 한하며, 계약 배서 이후 사고 발견시 건강등급 원복(보험료 재정산)</li>
                                <li class="txt_dot">보험료 부담은 경감 하나손해보험 자동차보험 가입자는 보험료 5% 할인 5대 사유 발생 시 보험료 납입면제 해약환급금미지급형Ⅱ(2종) 가입시 보험료 추가 절약 가능</li>
                            </ul>

                            </p>
                    </div>
                    </div>
                    <div class="insuContent">
                        <button type="button" class="collapsible" onclick="collapse(this);">알아두실 사항</button>

                        <div class="content">
                            <br>
                        <table class="insuTable">
                        <th class="tal row" scope="row">보험종류</th>
                        <td class="tal">
                            <table class="insuTable">
                                <colgroup>
                                    <col width="12%">
                                    <col width="8%">
                                    <col width="15%">
                                    <col width="17%">
                                    <col width="20%">
                                    <col width="28%">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th scope="rowgroup" colspan="2" rowspan="2" class="col row">구분</th>
                                    <th scope="rowgroup" rowspan="2" class="col row">상품구조</th>
                                    <th scope="col" colspan="3" class="col row">상품형태</th>
                                </tr>
                                <tr>
                                    <th scope="col" class="col row">만기구분</th>
                                    <th scope="col" class="col row">해약환급금 형태</th>
                                    <th scope="col" class="col row">납입면제 형태</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td rowspan="2">일반형</td>
                                    <td>1종</td>
                                    <td rowspan="3">표준체 /<br>건강Grade형<br>(Grade1, 2)</td>
                                    <td>세만기형</td>
                                    <td rowspan="2">중도해지시<br>해약환급금<br>지급함</td>
                                    <td rowspan="3">상해‧질병 80%이상<br>후유장해 또는<br>암‧뇌졸중‧급성심근경색증<br>진단 시</td>
                                </tr>
                                <tr>
                                    <td>3종</td>
                                    <td class="br1l">갱신형</td>
                                </tr>
                                <tr>
                                    <td>해약환급금 미지급형</td>
                                    <td>2종</td>
                                    <td>세만기형</td>
                                    <td class="br1l">중도해지시<br>해약환급금<br>지급하지 않음</td>
                                </tr>
                                </tbody>
                            </table>
                        </td>
                            <tr>
                                <th class="tal row" scope="row">가입나이</th>
                                <td class="tal">- 세만기형 : 20세 ~ Min(75, 80 -납입기간-1)세<br>- 갱신형 : 20세 ~ 60세</td>
                            <tr>
                                <th class="tal row" scope="row">보험기간</th>
                                <td class="tal">
                                    - 세만기형 : 80세, 90세, 100세만기<br>
                                    - 갱신형 : 10년, 20년만기
                                </td>
                            <tr>
                                <th class="tal row" scope="row">납입기간</th>
                                <td class="tal">
                                    - 세만기형 : 10년, 15년, 20년, 25년, 30년납<br>
                                    - 갱신형 : 전기납
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">납입주기</th>
                                <td>월납</td>
                            </tr>
                            </tr>
                            </tr>
                        </table>
                            <p>
                                <ul>
                                    <li class="txt_dot">회사가 정하는 기준(가입나이 및 건강상태, 직무 등)에 따라 보험가입금액이 제한되거나 가입이 불가능할 수 있습니다.</li>
                            <li class="txt_dot">각 특별약관은 보험기간, 납입기간에 따라 가입나이가 상이할 수 있습니다. (가입조건상세 다운로드 참조)</li>
                            <li class="txt_dot">해약환급금미지급형Ⅱ(2종)은 보험료 납입기간 중 계약이 해지될 경우 해약환급금을 지급하지 않는 대신 일반형(1종)보다 일반적으로 저렴하게 보험을 가입할 수 있도록 한 상품입니다.</li>
                            <li class="txt_dot">다만, 보험료 납입기간이 완료된 이후 계약이 해지되는 경우에는 일반형(1종) 해약환급금의 50%를 지급합니다.</li>
                            <li class="txt_dot">회사는 해약환급금미지급형Ⅱ(2종) 가입시 일반형(1종)의 보험료 및 해약환급금(환급률 포함) 수준을 비교·안내하여 드립니다.</li>
                                </ul>
                            </p>
                    </div>
                    </div>
                    <div class="acc_group product_accordion">


                        <button type="button" class="collapsible" onclick="collapse(this);">해약환급금 미지급형에 관한 사항</button>
                        <div class="content">
                            <p><ul>
                            <li class="txt_dot">해약환급금미지급형Ⅱ(2종)은 보험료 납입기간 중 계약이 해지될 경우 해약환급금을 지급하지 않는 대신 일반형(1종)보다 일반적으로 저렴하게 보험을 가입할 수 있도록 한 상품입니다.</li>
                            <li class="txt_dot">다만, 보험료 납입기간이 완료된 이후 계약이 해지되는 경우에는 일반형(1종) 해약환급금의 50%를 지급합니다.</li>
                            <li class="txt_dot">회사는 해약환급금미지급형Ⅱ(2종) 가입시 일반형(1종)의 보험료 및 해약환급금(환급률 포함) 수준을 비교·안내하여 드립니다.</li>
                            </ul>
                            </p>
                        </div>
                        <button type="button" class="collapsible" onclick="collapse(this);">보험계약 체결 전 유의사항</button>
                        <div class="content">
                            <p><ul>
                            <li class="txt_dot">
                            보험계약 청약시 보험상품명, 보험기간, 보험료납입기간, 피보험자 등을 반드시 확인하시고, 보험약관을 반드시 수령, 설명 받으시기 바랍니다.
                            </li>
                            <li class="txt_dot">
                            하나손해보험은 해당 상품에 대해 충분히 설명할 의무가 있으며, 가입자는 가입에 앞서 이에 대한 충분한 설명을 받으시기 바랍니다.
                            </li>
                            <li class="txt_dot">
                            보험계약 체결 전에 상품설명서와 약관을 반드시 읽어보시기 바랍니다. 중대한 고지사항에 대해 사실대로 알리지 않거나 다르게 알린 경우 보험가입이 거절될 수 있으며, 회사는 보험약관(계약의 해지)에 따라 이 보험계약을 해지할 수 있고, 이미 보험사고가 발생하였더라도 보험약관에 따라 보험금 지급을 거절하는 등 보장이 제한될 수 있습니다.
                            </li>
                            <li class="txt_dot">
                            기존 보험계약을 해지하고 새로운 보험계약을 체결하는 경우 보험 인수가 거절되거나, 보험료가 인상될 수 있으며, 보장내용이 달라질 수 있으니 유의하시기 바랍니다.
                            </li>
                            </ul>
                        </div>
                        <button type="button" class="collapsible" onclick="collapse(this);">피보험자의 동의, 무배당보험</button>
                        <div class="content">
                            <p><ul>
                            <li class="txt_dot">피보험자 동의를 받아야 합니다.</li>
                            <li class="txt_dot">족을 포함하여 본인이 아닌 다른 사람을 피보험자로 하여 보험계약을 청약 하고자 하는 경우에는 청약시 반드시 그 피보험자의 서면에 의한 동의 (청약서상에 자필서명)를 받으셔야만 보험계약상의 보장을 받으실 수 있습니다.</li>
                            <li class="txt_dot">본 상품은 무배당상품으로서, 배당을 하지 않기 때문에 배당상품보다 상대적으로 보험료가 저렴합니다.</li>
                            <li class="txt_dot">보험가입 시 약관 및 청약서 부본을 계약자에게 전달하지 않았거나, 약관의 중요 내용을 설명하지 않았을 때, 청약서에 계약자가 자필서명(날인(도장찍음) 및 전자서명법 제2조 제2호에 따른 전자서명을 포함합니다)을 하지 아니한 때 계약성립일로부터 3개월 이내에 회사에 보험계약의 취소를 요구할 수 있습니다. 이 경우 납입한 보험료와 함께 보험계약대출이율을 연단위 복리로 계산한 금액을 더하여 지급합니다.</li>
                            <li class="txt_dot">계약자는 보험증권을 받은 날부터 15일 이내(다만, 청약을 한 날로부터 30일(만65세 이상의 계약자가 통신수단 중 전화를 이용하여 체결한 계약은 45일)을 한도로 합니다)에 그 청약을 철회할 수 있습니다. 다만, 진단계약, 단체(취급)계약 또는 보험기간이 90일 미만인 계약은 청약을 철회할 수 없습니다.</li>
                            <li class="txt_dot">계약자가 청약을 철회한 때에는 회사는 청약의 철회를 접수한 날부터 3일 이내에 이미 납입한 보험료를 계약자에게 돌려드리며, 그 반환기일의 다음날부터 반환일까지의 기간에 대하여 이 계약의 보험계약대출이율을 연단위 복리로 계산한 금액을 더하여 지급합니다. 다만, 계약자가 제1회 보험료를 신용카드로 납입한 계약의 청약을 철회하는 경우에 회사는 신용카드의 매출을 취소하며 이자를 더하여 지급하지 않습니다.</li>
                            <li class="txt_dot">계약자 또는 피보험자는 청약할 때 청약서(질문서를 포함합니다)에서 질문한 사항에 대하여 알고 있는 사실을 반드시 사실대로 알려야 합니다. 약관에 따라 알릴 의무 위반 시 계약이 해지되거나 보장이 제한될 수 있습니다.
                            <li class="txt_dot">계약자께서 제2회 이후의 보험료를 납입기일까지 납입하지 아니하여 연체중인 경우에는 14일 이상(보험기간이 1년 미만인 계약은 7일)의 기간에 대해 보험료 납입을 최고(독촉)하고 납입최고(독촉)기간이 끝나는 다음날 보험계약이 해지됨을 서면(등기우편 등), 전화(음성녹음) 또는 전자문서 등으로 알려드립니다.</li>
                        </ul>
                            </p>
                        </div>
                            <button type="button" class="collapsible" onclick="collapse(this);">계약 후 알릴 의무</button>
                            <div class="content">
                        <p>
                        <ul>
                                <li class="txt_dot">계약을 맺은 후 보험의 목적에 아래와 같은 사실이 생긴 경우에는 계약자나 피보험자는 지체없이 서면으로 회사에 알리고 보험증권에 확인을 받아야 합니다.</li>
                                <li class="txt_dot">청약서의 기재사항을 변경하고자 할 때 또는 변경이 생겼음을 알았을 때</li>
                                <li class="txt_dot">이 계약에서 보장하는 위험과 동일한 위험을 보장하는 계약을 다른 보험자와 체결하고자 할 때 또는 이와 같은 계약이 있음을 알았을 때</li>
                                <li class="txt_dot">위험이 뚜렷이 변경되거나 변경되었음을 알았을 때</li>
                                <li class="txt_dot">회사는 제1항에 따라 위험이 감소된 경우에는 그 차액보험료를 돌려드리며, 위험이 증가된 경우에는 통지를 받은 날부터 1개월 이내에 보험료의 증액을 청구하거나 계약을 해지할 수 있습니다.</li>
                                <li class="txt_dot">계약자 또는 피보험자는 주소 또는 연락처가 변경된 경우에는 지체없이 이를 회사에 알려야 합니다. 다만, 계약자 또는 피보험자가 알리지 않은 경우 회사가 알고 있는 최종의 주소 또는 연락처로 등기우편 등 우편물에 대한 기록이 남는 방법으로 회사가 알린 사항은 일반적으로 도달에 필요한 기간이 지난 때에는 계약자 또는 피보험자에게 도달한 것으로 봅니다.</li>
                                </ul>
                            </p>
                    </div>

                        <button type="button" class="collapsible" onclick="collapse(this);">갱신형보장</button>
                        <div class="content">
                            <p>
                            <ul>
                            <li class="txt_dot">회사는 갱신형보장의 보험기간이 끝나기 15일 전까지 계약자가 납입하여야 하는 갱신 될 계약의 보험료 및 계약의 연장여부를 묻는 통지를 계약자에게 서면, 전화(음성녹음) 또는 전자문서 등으로 안내하여 드립니다.</li>
                            <li class="txt_dot">해당 보장의 보험기간 종료일의 전일까지 별도의 의사표시가 없을 때에는 해당 보장은 자동으로 갱신됩니다.</li>
                            <li class="txt_dot">회사는 갱신계약에 대하여 갱신일 현재의 보험요율에 관한 제도를 반영하여 계산된 보험료를 적용하며, 그 보험료는 나이의 증가, 보험료산출에 관한 기초율의 변동 등의 사유로 인하여 인상될 수 있습니다.</li>
                            <li class="txt_dot">갱신형보장의 약관은 최초 계약시의 약관을 계속하여 적용합니다. 다만, 법령의 제ㆍ개정, 금융위원회의 명령, 금융감독원장이 정한 시행세칙의 개정 등 제도적인 변경에 따라 약관이 변경된 경우 갱신일 현재의 변경된 약관을 적용합니다.</li>
                            </ul>
                            </p>
                        </div>
                        <button type="button" class="collapsible" onclick="collapse(this);">해약환급금이 납입보험료보다 적은 이유</button>
                        <div class="content">
                            <p>
                            <ul>
                            <li class="txt_dot">보험은 은행의 저축과 달리 위험보장과 함께 저축을 겸하는 제도로 보험계약자가 납부한 보험료의 일부는 위험보장에 사용되며, 일부는 회사운영에 관련한 비용으로 사용됩니다. 따라서 보험계약을 중도에 해약할 경우 지급되는 해약환급금은 납입한 보험료보다 적거나 또는 없을 수 있습니다.</li>
                            </ul>
                            </p>
                        </div>
                        <button type="button" class="collapsible" onclick="collapse(this);">장애인전환특약에 관한 사항</button>
                        <div class="content">
                            <p>
                            <ul>
                            <li class="txt_dot">소득세법에 따라 보장성보험 계약 중 피보험자(또는 수익자)가 세법상 장애인에 해당하는 계약인 경우 장애인전환특약을 통해 장애인전용보장성보험으로 전환되어 연말정산 시 세제혜택이 가능합니다.</li>
                            <li class="txt_dot">장애인 범위 : 장애인 등록자 외에도 국가유공자법상 상이자, 항시치료가 필요한 중증환자 등 세법상 인적공제 대상 장애인은 모두 포함</li>
                            <li class="txt_dot">필요서류(증빙자료) : 장애인등록증 등 장애인임을 확인할 수 있는 자료</li>
                            </p>
                            </ul>
                            </div>

                        <button type="button" class="collapsible" onclick="collapse(this);">예금자보호 및 상담/분쟁/신고 안내</button>
                        <div class="content">
                            <p>
                            <ul>
                                <li class="txt_dot">이 보험계약은 예금자보호법에 따라 예금보험공사가 보호하되, 보호 한도는 본 보험회사에 있는 귀하의 모든 예금보호 대상 금융상품의 해약환급금(또는 만기시 보험금이나 사고보험금)에 기타지급금을 합하여 1인당 "최고 5천만원"이며, 5천만원을 초과하는 나머지 금액은 보호하지 않습니다. 다만, 보험계약자 및 보험료 납부자가 법인인 보험계약은 예금자보호법에 따라 예금보험공사가 보호하지 않습니다.</li>
                                <li class="txt_dot">보험에 관한 불만상담 및 분쟁이 있을 때에는 먼저 당사로 연락하시고, 처리결과에 이의가 있으시면 민원 또는 분쟁조정 등을 신청하실 수 있습니다.</p>
                                <li class="txt_dot">하나손해보험 : 1566-3000, www.hanainsure.co.kr</li>
                                <li class="txt_dot">금융감독원 민원상담전화 : (국번없이)1332, www.fss.or.kr</li>
                                <li class="txt_dot">보험계약과 관련한 보험모집질서 위반행위는 보험업법에 의해 처벌받을 수 있습니다.</li>
                                <li class="txt_dot">금융감독원 민원상담전화 : (국번없이)1332, www.fss.or.kr</li>
                                <li class="txt_dot">금융감독원 민원상담전화 : (국번없이)1332, www.fss.or.kr - 인터넷보험범죄신고.</li>
                        </ul>
                        </p>
                    </div>
<%--                    <div class="checkbox_group">--%>

<%--                        <input type="checkbox" id="check_all" >--%>
<%--                        <label for="check_all">전체 동의</label>--%>

<%--                        <input type="checkbox" id="check_1" class="normal" >--%>
<%--                        <label for="check_1">개인정보 처리방침 동의</label>--%>

<%--                        <input type="checkbox" id="check_2" class="normal" >--%>
<%--                        <label for="check_2">서비스 이용약관 동의</label>--%>

<%--                        <input type="checkbox" id="check_3" class="normal" >--%>
<%--                        <label for="check_3">마케팅 수신 동의</label>--%>

<%--                    </div>--%>

                        <div class="contents">
                            <form action="/insuJoinInput" method="get" id="form__wrap" style="margin-top: 30px;">
                                <div class="terms__check__all">
                                    <input type="checkbox" name="checkAll" id="checkAll" />
                                    <label for="checkAll"
                                    >Hana InsureFit 이용약관, 개인정보 수집 및 이용, 프로모션 정보 수신(선택)에 모두 동의합니다.</label
                                    >
                                </div>
                                <ul class="terms__list">
                                    <li class="terms__box">
                                        <div class="input__check">
                                            <input type="checkbox" name="agreement" id="termsOfService" value="termsOfService" required />
                                            <label for="termsOfService" class="required">Hana InsureFit 회원가입 이용약관</label>
                                        </div>
                                        <div class="terms__content">
                                            <div class="scrollable-content">
                                                제1조 (목적)
                                                본 약관은 하나손해보험 주식회사(이하 “회사”라 한다)에서 운영하는 하나손해보험 홈페이지(이하 “홈페이지”라 한다) 및 1Q앱, 원데이앱 등 모바일 어플리케이션(이하 “앱” 이라 한다)의 통합 회원가입과 서비스 이용 및 제공에 관한 제반 사항의 규정을 목적으로 합니다.
                                                <br>
                                                제2조 (용어의 정의)
                                                본 약관에서 사용하는 용어의 정의는 다음 각 호와 같으며 본 조에 별도의 정의가 정해지지 아니한 용어는 관계 법령 및 상관례에 따릅니다.
                                                <br>
                                                “온라인서비스”라 함은 회사가 컴퓨터, 모바일 등 정보통신 설비를 이용하여 재화 또는 용역을 이용자에게 제공하고 거래할 수 있도록 온라인상에 설정한 가상의 영업장인 홈페이지와 앱을 말합니다.
                                                “이용자”라 함은 “온라인서비스”에 접속하여 본 약관에 따라 회사가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
                                                “회원”이라 함은 회사에 개인정보를 제공하여 회원등록을 한 자로서, 온라인서비스의 정보를 지속적으로 제공받으며 이용할 수 있는 자를 말합니다.
                                                “비회원”이라 함은 회원에 가입하지 않고 회사가 제공하는 온라인서비스를 이용하는 자를 말합니다.
                                                “게시물”이라 함은 회원이 온라인서비스를 이용함에 있어서 온라인서비스에 게시한 부호, 문자, 음성, 음향, 화상, 동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.
                                                <br>
                                                제3조 (약관의 효력 및 개정)
                                                본 약관은 온라인서비스에 게시하거나 이용자에게 공지함으로써 효력이 발생합니다.
                                                회사는 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자거래기본법」, 「전자서명법」, 「정보통신망 이용촉진 등에 관한 법률」, 「금융소비자 보호에 관한 법률」 등 관계 법령을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.
                                                본 약관의 내용 중 관계 법령 또는 정부, 규제기관의 명령에 위배되는 내용은 해당 부분에 한하여 무효로 합니다.
                                                회사가 본 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 온라인서비스에 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 회사는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽게 표시합니다.
                                                변경된 약관에 대한 정보를 알지 못해 발생하는 이용자의 피해는 회사가 책임지지 않습니다.
                                                회원은 변경된 약관에 동의하지 않을 경우 서비스 이용을 중단하고 회원 탈퇴를 요청할 수 있습니다.
                                                본 약관에서 정하지 아니한 사항과 약관의 해석에 관하여는 관계 법령 또는 상관례에 따릅니다.
                                                제4조 (회원가입)
                                                이용자는 회사가 정한 양식에 따라 회원정보를 기입한 후 본 약관 및 개인정보처리방침에 동의함으로써 온라인서비스의 회원으로 가입됩니다.
                                                전자금융거래를 이용하려는 회원은 반드시 개인정보처리방침에 따라 요청하는 제반 정보를 제공하여야만 서비스를 이용할 수 있으며, 회사에 제공한 정보가 본인의 정확한 정보가 아닌 경우에는 일체의 회원으로서의 권리를 주장할 수 없습니다.
                                                타인의 개인정보를 도용하여 가입 신청을 한 회원의 모든 정보는 삭제되며, 관계법령에 따라 처벌을 받을 수 있습니다.
                                                회사는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
                                                등록내용에 허위, 기재누락, 오기가 있는 경우
                                                가입신청자가 본 약관 제5조 제2항에 의하여 이전에 회원자격을 상실한 적이 있는 경우
                                                기타 회원으로 등록하는 것이 온라인서비스의 기술상 현저히 지장이 있다고 판단되는 경우
                                                만 14세 미만인 자
                                                회원가입계약의 성립 시기는 온라인서비스 회원 가입 승낙이 회원에게 도달한 시점으로 합니다.
                                                회원은 가입 시 등록한 회원정보의 변경이 발생한 경우, 즉시 온라인서비스에서 직접 수정하거나 또는 전자우편, 기타 방법으로 회사에 변경 사실을 알려야 합니다. 회원이 회사에 회원정보의 변경 사실을 알리지 아니한 경우, 회사가 온라인서비스에 등록된 회원정보로 통지를 하였다면 이는 유효한 통지가 이루어진 것으로 봅니다.
                                                제5조 (회원 탈퇴 및 자격 상실 등)
                                                회원은 회사에 언제든지 탈퇴를 요청할 수 있으며, 이 경우 회사는 즉시 회원탈퇴 처리를 하고 개인정보처리방침에 따라 회원의 개인정보를 파기합니다.
                                                회원이 다음 각 호의 사유에 해당하는 경우, 회사는 회원자격을 상실(제한·정지)시킬 수 있습니다.
                                                가입신청서에 허위 내용을 등록한 경우
                                                온라인서비스를 이용하여 가입한 보험 상품 등의 대금, 기타 온라인서비스 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않은 경우
                                                다른 사람의 온라인서비스 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우
                                                온라인서비스를 이용하여 관계 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
                                                최종 온라인서비스 이용 이후 1년간 온라인서비스 로그인 기록이 없는 경우
                                                제6조 (회원에 대한 통지)
                                                회사는 회원에 대하여 관계 법령 또는 정부, 규제기관의 명령에 따른 통지 및 온라인서비스 이용을 위하여 필요하다고 인정되는 정보를 통지할 수 있습니다.
                                                회사가 회원에 대한 통지를 하는 경우, 회원이 회사에 제출한 전자우편 주소나 휴대전화번호, 유선전화번호로 할 수 있습니다.
                                                회사는 불특정다수 회원에 대한 통지의 경우 1주일 이상 온라인서비스에 게시함으로써 개별 통지에 갈음할 수 있습니다.
                                                제7조 (서비스의 이용)
                                                회사는 온라인서비스를 통해 다음의 서비스를 제공합니다.
                                                보험 상품 및 용역에 대한 정보의 제공 및 보험계약의 체결
                                                기타 회사가 정하는 서비스
                                                회사는 불가피한 사정이나 기술적 사양의 변경 등의 경우에는 서비스의 내용을 변경할 수 있습니다. 이 경우에는 변경된 보험 상품 및 용역의 내용 및 제공일자를 명시하여 현재의 보험 상품 및 용역의 내용을 게시한 곳에 그 제공일자 이전 7일부터 공지합니다. 단, 회사는 불가피한 여건이나 사정이 있는 경우, 위 공지를 하지 않을 수 있습니다.
                                                회사가 제공하기로 이용자와 계약을 체결한 서비스의 내용을 기술적 사양의 변경 등의 사유로 변경할 경우에는 회사는 이로 인하여 이용자가 입은 손해를 배상합니다. 단, 회사에 고의 또는 과실이 없는 경우에는 그러하지 아니합니다.
                                                서비스의 이용은 홈페이지의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간 운영을 원칙으로 합니다.
                                                회사는 시스템 등의 보수, 점검, 교체, 시스템의 고장, 통신의 두절, 기타 불가항력적 사유가 발생한 경우에는 회사가 정한 기간 동안 서비스의 제공을 일시적으로 중단할 수 있습니다.
                                                회사는 제5항의 사유로 서비스 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대해서는 배상하지 아니합니다.
                                                제8조 (전자금융거래 이용 신청)
                                                온라인서비스에서 보험 계약 및 보험 관련 서비스를 이용하기 위해서는 전자금융거래 이용 신청을 해야 하며 신청하는 방법은 다음의 절차에 의하여야 합니다.
                                                <br>
                                                본 약관에 동의
                                                최초 이용 시 전자금융거래이용약관 동의
                                                주민등록번호 및 성명 제공을 통한 실명인증 확인
                                                보험 상품 및 서비스 제공시 요구하는 항목 입력
                                                회사가 정한 방법에 따른 결제
                                                기타 보험 계약 및 보험 관련 서비스에 관한 사항은 온라인서비스에 게시된 전자금융거래 이용약관에 의거합니다.
                                                제9조(회원의 의무)
                                                ID와 비밀번호에 관한 관리책임은 회원에게 있으며, ID 및 비밀번호를 제3자에게 이용하게 해서는 안 됩니다.
                                                회원이 개인정보를 도용당하거나 제3자가 회원서비스를 이용하고 있음을 인지한 경우에는 바로 회사에 통보하고 회사의 안내가 있는 경우에는 그에 따라야 합니다.
                                                회원은 본 약관에서 규정하는 사항과 기타 회사가 정한 제반 규정, 공지사항 등 회사가 공지하는 사항 및 관계 법령을 준수하여야 합니다.
                                                회원은 다음 행위를 하여서는 안 됩니다.
                                                신청 또는 변경시 허위내용의 등록
                                                회사가 온라인서비스에 게시한 정보의 변경
                                                회사가 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시
                                                회사 또는 기타 제3자의 저작권 등 지적재산권에 대한 침해
                                                회사 또는 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
                                                외설 또는 폭력적인 메시지, 화상, 음성 등 기타 공서양속에 반하는 정보를 온라인서비스에 공개 또는 게시하는 행위
                                                회사는 회원이 본 조를 위반하여 발생한 손해에 대하여 어떠한 책임도 부담하지 않습니다.


                                            </div>
                                        </div>
                                    </li>
                                    <li class="terms__box">
                                        <div class="input__check">
                                            <input type="checkbox" name="agreement" id="privacyPolicy" value="privacyPolicy" required />
                                            <label for="privacyPolicy" class="required">개인정보 수집 및 이용 동의</label>
                                        </div>
                                        <div class="terms__content">
                                            제10조 (회사의 의무)
                                            회사는 본 약관이 정하는 바에 따라 지속적이고 안정적인 서비스를 제공하기 위해서 노력합니다.
                                            회사는 회원의 개인정보 보호를 위해 보안 시스템을 구축하며 개인정보처리방침을 공시하고 준수합니다.
                                            회사는 회원으로부터 제기되는 의견이나 불편사항이 정당하다고 객관적으로 인정될 경우에는 적절한 절차를 통해 즉시 처리하여야 합니다. 다만, 신속한 처리가 곤란한 경우는 회원에게 그 사유와 처리일정을 통보하여야 합니다.
                                            <br>
                                            제11조 (개인정보보호 및 이용)
                                            회사는 이용자의 정보 수집 시 원활한 서비스 제공을 위해 필요한 최소한의 정보를 이용자의 동의하에 수집하며, 수집한 목적에 따라서만 이용할 수 있습니다.
                                            회사가 이용자의 개인 식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다.
                                            이용자는 언제든지 회사가 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정 또는 동의 철회를 요구할 수 있으며 회사는 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
                                            기타 개인정보 관련사항은 온라인서비스에 별도로 게시하는 개인정보처리방침에 의거합니다.
                                            <br>
                                            제12조 (저작권의 귀속 및 이용제한)
                                            회사가 작성한 저작물에 대한 저작권 기타 지적재산권은 회사에 귀속합니다.
                                            이용자는 온라인서비스를 이용함으로써 얻은 정보를 회사의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송, 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안 됩니다.
                                            제13조 (비로그인 회원 관리)
                                            회원이 12개월 동안 온라인서비스를 이용하지 않은 경우 회사는 회원을 탈퇴처리한 후 개인정보처리방침에 따라 회원의 개인정보를 파기합니다. 회사는 회원 탈퇴처리 1개월 전에 대상 회원에게 탈퇴 및 개인정보 파기 일정을 통지합니다.
                                        </div>
                                    </li>
                                    <li class="terms__box">
                                        <div class="input__check">
                                            <input type="checkbox" name="agreement" id="allowPromotions" value="allowPromotions" />
                                            <label for="allowPromotions">프로모션 정보 수신 동의</label>
                                        </div>
                                        <div class="terms__content">
                                            <br>
                                            제14조 (면책조항)
                                            회사는 천재지변, 전쟁, 기간통신사업자의 서비스 중지 및 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 대한 책임을 지지 않습니다.
                                            회사는 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에 대해서는 책임이 면제됩니다.
                                            회사는 이용자가 온라인서비스에 게재한 정보, 자료, 사실의 정확성, 신뢰성 등 그 내용에 관하여는 어떠한 책임을 부담하지 아니하고, 이용자는 자기의 책임아래 온라인서비스를 이용하며, 온라인서비스를 이용하여 게시 또는 전송한 자료 등으로 인하여 손해가 발생하거나 자료의 취사선택, 기타 온라인서비스 이용과 관련하여 어떠한 불이익이 발생하더라도 이에 대한 모든 책임은 이용자에게 있습니다.
                                            회사가 온라인서비스를 통하여 제공하는 정보와 자료 등에 근거하여 이루어지는 보험 가입 등의 거래는 전적으로 이용자 자신의 책임과 판단아래 수행되는 것이며, 회사가 제공한 정보와 자료에 명백한 오류가 있었던 것이 아니라면 해당 정보와 자료에 기초하여 이루어진 이용자의 거래에 관하여 책임을 부담하지 않습니다.
                                            회사는 이용자가 온라인서비스에 게시물을 등록하기 전에 사전심사 하거나 게시물의 내용을 상시 확인 또는 검토하여야 할 의무가 없으며, 이용자가 관계 법령에 위반되는 게시물을 등록함으로써 발생한 결과에 대하여 책임을 지지 아니합니다.
                                            제15조 (분쟁해결)
                                            이용자가 온라인서비스의 이용과 관련하여 불만이 있거나 의견을 제시하고자 하는 경우에는 온라인서비스 고객센터 메뉴 내 상담문의에 의견을 제출할 수 있습니다.
                                            회사는 이용자로부터 제출되는 불만사항 및 의견이 정당하다고 판단되는 경우 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 통보할 수 있습니다.
                                            제16조 (재판권 및 준거법)
                                            회사와 이용자 간 제기된 소송은 대한민국 법을 준거법으로 합니다.
                                            회사와 이용자 간 발생한 분쟁에 관한 소송은 민사소송법상의 관할법원에 제소합니다.
                                        </div>
                                    </li>
                                </ul>
                                <button type="submit" class="next-button" id="nextBtn">다음</button>
                            </form>
                        </div>
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
<script>
    'use strict';
    // const form = document.querySelector('#form__wrap');
    const checkAll = document.querySelector('.terms__check__all input');
    const checkBoxes = document.querySelectorAll('.input__check input');
    const submitButton = document.querySelector('button');

    const agreements = {
        termsOfService: false,
        privacyPolicy: false,
        allowPromotions: false,
    };

    // form.addEventListener('submit', (e) => e.preventDefault()); // 새로고침(submit) 되는 것 막음

    checkBoxes.forEach((item) => item.addEventListener('input', toggleCheckbox));

    function toggleCheckbox(e) {
        const { checked, id } = e.target;
        agreements[id] = checked;
        this.parentNode.classList.toggle('active');
        checkAllStatus();
        toggleSubmitButton();
    }

    function checkAllStatus() {
        const { termsOfService, privacyPolicy, allowPromotions } = agreements;
        if (termsOfService && privacyPolicy && allowPromotions) {
            checkAll.checked = true;
        } else {
            checkAll.checked = false;
        }
    }

    function toggleSubmitButton() {
        const { termsOfService, privacyPolicy } = agreements;
        if (termsOfService && privacyPolicy) {
            submitButton.disabled = false;
        } else {
            submitButton.disabled = true;
        }
    }
    checkAll.addEventListener('click', (e) => {
        const { checked } = e.target;
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
    $(".checkbox_group").on("click", ".normal", function() {
        var is_checked = true;

        $(".checkbox_group .normal").each(function(){
            is_checked = is_checked && $(this).is(":checked");
        });

        $("#check_all").prop("checked", is_checked);
    });

</script>


</div>
</html>