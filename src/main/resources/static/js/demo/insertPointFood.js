document.addEventListener("DOMContentLoaded", function () {
  if (friendsID !== null && customerID !== null && friendsID !== customerID && customerID !== 'Admin Name') {
    // friendID가 존재하는 경우에만 AJAX 요청을 보냅니다.
    $.ajax({
      url: '/insertFriendPoint',
      type: "POST",
      contentType: 'application/json',
      dataType: "json",
      data: JSON.stringify(friends),
      success: function (response) {
        console.log(response);
      },
      error: function (error) {
        console.error(error);
      }
    });
  }
});