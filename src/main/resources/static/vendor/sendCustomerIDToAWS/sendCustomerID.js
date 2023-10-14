var customerID = document.getElementById("customerID").getAttribute("data-customerID");

// 링크를 클릭할 때 AJAX 요청을 보내는 코드
$(document).ready(function() {
    $("#join-insu-button").on("click", function(e) {
        e.preventDefault(); // 기본 링크 동작 방지

        $.ajax({
            url: '/sendAdmin',
            type: 'POST',
            dataType: "json",
            data: {
                'customerID': customerID
            },
            success: function (data) {
                console.log(data.healthgrade);
                alert("고객님의 건강등급은 Grade " + data.healthgrade + " 입니다.")
                window.location.href = "/gradeCheck"
            },
            error: function (error) {
                console.error('데이터를 가져오는 중 오류 발생: ', error);
            },
        });
    });
});
