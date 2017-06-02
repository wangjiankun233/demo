$(document).ready(function () {
    $(".menus").click(function () {
        $(this).parent().parent().find(".active").removeClass("active")
        $(this).parent().addClass("active")
       var path=$(this).attr("path");
       $.ajax({
           url:$("#basePath").val()+path,
           type:"GET",
           async:false,
           data:{
           },
           success:function (data) {
               $("#info").html(data);
           }
       });
   });
    $("li").eq(0).find("a").click();
})
