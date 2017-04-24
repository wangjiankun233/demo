<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $(".gotIt").click(function () {
            var e= $(this).parent()
            $.ajax({
                url:$("#basePath").val()+"/work/gotIt",
                type:"POST",
                async:false,
                data:{
                    id:$(this).attr("workId")
                },
                success:function (data) {
                    alert(data)
                    e.html("已确认")
                }
            });
        });

    })
</script>
<table class="table">
    <thead>
    <tr>
        <th>
            日期
        </th>
        <th>
            地点
        </th>
        <th>
            说明
        </th>
        <th>
            备注
        </th>
        <th>
            操作
        </th>
    </tr>
    </thead>
    <tbody>
    <#assign dlist=workList?eval/>
    <#list dlist as work>
    <tr>
        <td>
        ${work.date}
        </td>
        <td>
        ${work.local}
        </td>
        <td>
        ${work.info}
        </td>
        <td>${work.remark}</td>
        <td>
         <#if work.status=='0'>
            <button class="gotIt" workId="${work.id}" >确认</button>
         <#else >
             已确认
         </#if>
        </td>
    </tr>
    </#list>


    </tbody>
</table>
<input type="hidden" id="workList" value='${workList}'>
