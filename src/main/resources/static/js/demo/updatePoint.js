document.getElementById('consumePoint').addEventListener('click', function () {
    // 입력 필드에서 값을 가져옵니다.
    var pointInputValue = document.getElementById('pointInput').value;

    // Ajax 요청을 보냅니다.
    $.ajax({
        type: "POST",
        url: "/updatePoint", // 서버 측 URL (updatePoint 엔드포인트)
        dataType: "json",
        data: {
            'pointValue': pointInputValue, // 입력 필드의 값 전달
            // 기타 필요한 데이터를 전송합니다.
            // 예: 'customerID': customerID,
            // 추가 데이터를 필요에 따라 전달하세요.
        },
        success: function (response) {
            // 요청 성공 시 실행할 코드를 작성합니다.
            console.log("포인트 업데이트 성공");
            console.log(response);
            // 성공 메시지를 사용자에게 표시하거나 기타 작업을 수행할 수 있습니다.
        },
        error: function (xhr, status, error) {
            // 요청 실패 시 실행할 코드를 작성합니다.
            console.error("포인트 업데이트 오류: " + error);
            // 오류 메시지를 사용자에게 표시하거나 기타 작업을 수행할 수 있습니다.
        }
    });
});
