<#assign emp=empInfo?eval/>
<table class="table">
    <tbody>
    <tr>
        <td> 用户名：</td>
        <td>
           ${emp.name}
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr >
        <td>姓名：</td>
        <td>
            ${emp.chName}
        </td>
        <td>身份证：</td>
        <td>
            ${emp.idcard}"
        </td>
    </tr>
    <tr >
        <td>性别：</td>
        <td>
            <#if emp.sex=='0'>其他</#if>
            <#if emp.sex=='1'>男</#if>
            <#if emp.sex=='2'>女</#if>
        </td>
        <td>部门：</td>
        <td>
        ${emp.deptName}
        </td>
    </tr>
    <tr >
        <td>籍贯：</td>
        <td>
            ${emp.home}
        </td>
        <td>住址：</td>
        <td>
            ${emp.address}
        </td>
    </tr>
    </tbody>
</table>

<input type="hidden" id="empInfo" value="${empInfo}"/>