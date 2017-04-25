<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {

        $("#add").click(function () {
            $.ajax({
                url: $("#basePath").val() + "/leave/add",
                type: "POST",
                async: false,
                data: {type:$("#type").val()},
                success: function (data) {
                    $("#shit").html(data);

                    $("#sub").click(function () {

                        $.ajax({
                            url: $("#basePath").val() + "/leave/addLeave",
                            type: "POST",
                            async: false,
                            data: {
                                reason :$("#reason").val()||'',
                                remark:$("#remark").val()||'',
                                type:$("#type").val(),
                                startDate:$("#startDate").val()||'',
                                endDate:$("#endDate").val()||''
                            },
                            success: function (data){
                                alert(data);
                            }
                        });
                    })
                }
            });
        });
        $("#cha").click(function () {
            $.ajax({
                url: $("#basePath").val() + "/leave/getLeave",
                type: "POST",
                async: false,
                data: {type:$("#type").val()},
                success: function (data) {
                    $("#shit").html(data);
                }
            });
        });

    })
</script>

<div class="col-md-2 column" >
    <ul class="nav nav-list">

        <li class="active">
            <a href="#" id="cha">查看我的申请</a>
        </li>
        <li>
            <a href="#" id="add">
            <#if type=='0'>
                添加一个休假申请
            <#else >
                添加一个离职申请
            </#if>

            </a>
        </li>
    </ul>
</div>
<div class="col-md-10 column" id="shit">

</div>
<input type="hidden" id="type" value="${type}">