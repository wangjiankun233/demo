
<table class="table">
    <tbody>
    <tr>
        <td> 日期：</td>
        <td>
            <input type="text" id="date">
        </td>
        <td>  地点：</td>
        <td>
            <input type="text" id="local">
        </td>
    </tr>
    <tr >
        <td>内容：</td>
        <td>
            <input type="text" id="infos">
        </td>
        <td>备注：</td>
        <td>
            <input type="text" id="remark">
        </td>

    </tr>
    <tr>
    <td>人员：</td>
    <td>
        <#assign emps=empList?eval>
        <#list emps as emp>
            <input class="emp" type="checkbox" value="${emp.id}" />${emp.chName}
        </#list>
    </td>

    </tr>
    </tbody>
</table>
<button id="sub">提交</button>
<input type="hidden" id="empList" value="${empList}" />