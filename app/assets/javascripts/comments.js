(function (root) {
  var BG = root.BG = (root.BG || {} );

  $(document).ready(function () {
    $("#comment-form").on("ajax:success", function(event, data){
      $(".comments").prepend(data);
      $("#comment-form textarea").val("");
    })
  })
})(this)


