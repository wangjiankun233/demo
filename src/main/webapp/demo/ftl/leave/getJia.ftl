
<div id="ok">
    <table class="table">
        <thead>
        <tr>
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
                申请状态
            </th>
        </tr>
        </thead>
        <tbody>
        <#assign dlist=leaveList?eval/>
        <#list dlist as work>
        <tr>
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
                    领导还未审批
                <#elseif work.status=='1'>
                    审批通过
                <#elseif work.status=='2'>
                    审批未通过
                </#if>
            </td>
        </tr>
        </#list>


        </tbody>
    </table>
</div>
<input type="hidden" id="leaveList" value='${leaveList}' />