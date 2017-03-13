<#assign basePath=request.contextPath />
<link rel="stylesheet" href="${basePath}/demo/js/common/bootstrap-3.3.7/css/bootstrap.min.css">
<script type="text/javascript" charset="utf-8" src="${basePath}/demo/js/common/jquery/jquery-1.9.1.min.js"></script>
<script src="${basePath}/demo/js/common/bootstrap-3.3.7/js/bootstrap.min.js"></script>
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
<div class="container">
    <div class="row clearfix">

        <div class="col-md-12 column">
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-4 column">
        </div>
        <div class="col-md-4 column">

                <img src="${basePath}/demo/source/logo.jpg" class="img-responsive" alt="Cinque Terre">
                <div class="form-group">
                    <label for="exampleInputEmail1">用户名</label><input type="text" class="form-control" id="userName" />
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">密码</label><input type="password" class="form-control" id="passWord" />
                </div>

                <button type="submit" id="login" class="btn btn-default">登陆</button>

        </div>
        <div class="col-md-4 column">
        </div>
    </div>
</div>
<input type="hidden" id="basePath" value="${basePath}">
</body>
