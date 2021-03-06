<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $(".pass").click(function () {
            var e=$(this).parent()
            $.ajax({
                url: $("#basePath").val() + "/leave/manageLeave",
                type: "POST",
                async: false,
                data: {type:"0",
                      status:"1",
                      id:$(this).attr("leaveId")
                },
                success: function (data) {
                    alert(data)
                    e.html("已同意")
                }
            });
        })
        $(".goDie").click(function () {
            var e=$(this).parent()
            $.ajax({
                url: $("#basePath").val() + "/leave/manageLeave",
                type: "POST",
                async: false,
                data: {type:"0",
                    status:"2",
                    id:$(this).attr("leaveId")
                },
                success: function (data) {
                    alert(data)
                    e.html("已驳回")
                }
            });
        })
    })
</script>

<div id="ok">
    <table class="table">
        <thead>
        <tr>
            <th>
                员工姓名
            </th>
            <th>
                申请日期
            </th>
            <th>
                开始时间
            </th>
            <th>
                结束时间
            </th>
            <th>
                休假原因
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
        <#assign dlist=leaveList?eval/>
        <#list dlist as work>
        <tr>
            <td>
            ${work.userName}
            </td>
            <td>
            ${work.date}
            </td>
            <td>
            ${work.startDate}
            </td>
            <td>
            ${work.endDate}
            </td>
            <td>
            ${work.reason}
            </td>
            <td>
            ${work.remark}
            </td>

            <td>
                <#if work.status=='0'>
                    <button class="pass" leaveId="${work.id}" >同意</button>
                    <button class="goDie" leaveId="${work.id}">不同意</button>
                <#elseif work.status=='1'>
                    已同意
                <#elseif work.status=='2'>
                    已驳回
                </#if>
            </td>
        </tr>
        </#list>


        </tbody>
    </table>
</div>
<input type="hidden" id="leaveList" value='${leaveList}' />