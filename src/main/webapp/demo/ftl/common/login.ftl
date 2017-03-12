<#assign basePath=request.contextPath />
<script type="text/javascript" charset="utf-8" src="${basePath}/demo/js/common/jquery/jquery-1.9.1.min.js"></script>

<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $("#login").click(function () {
            var name=$("#userName").val()||'';
            var password=$("#passWord").val()||'';
            $.ajax({
               url:$("#basePath").val()+"/user/login",
               type:"POST",
               async:false,
               data:{
                   userName:name,
                   passWord:password
               },
               success:function (data) {
                    if(data=="success"){

                        location.href = $("#basePath").val()+"/user/index";
                    }else{
                        alert("登录失败");
                    }

                }
            });
        });

    })

</script>
<body>

name: <input id="userName" type="text" >
passWord :<input id="passWord" type="text">
<button id="login" name="login">登陆</button>
<input type="hidden" id="basePath" value="/demo">
</body>
