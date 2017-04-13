<#assign emp=empInfo?eval/>
<table class="table">
    <tbody>
    <tr>
        <td> 用户名：</td>
        <td>
            <input type="text" id="name" value="${emp.name}">
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr >
        <td>姓名：</td>
        <td>
            <input type="text" id="chName" value="${emp.chName}">
        </td>
        <td>身份证：</td>
        <td>
            <input type="text" id="idcard" value="${emp.idcard}">
        </td>
    </tr>
    <tr >
        <td>性别：</td>
        <td>
            <select id="sex">
             <#if emp.sex=='0'>
                 <option value="0" selected = "selected">其他</option>
                 <option value="1">男</option>
                 <option value="2">女</option>
                 <#elseif emp.sex=='1'>
                     <option value="0" >其他</option>
                     <option value="1" selected = "selected">男</option>
                     <option value="2">女</option>
                 <#elseif emp.sex=='2'>
                 <option value="0" >其他</option>
                 <option value="1" >男</option>
                 <option value="2" selected = "selected">女</option>
             </#if>
            </select>
        </td>
        <td>部门：</td>
        <td>
        <#assign deptL=deptList?eval />

            <select id="deptId">
            <#list  deptL as dept>
                <#if dept.id==emp.deptId>
                    <option value ="${dept.id}"  selected = "selected">${dept.name}</option>
                    <#else >
                        <option value ="${dept.id}">${dept.name}</option>
                </#if>
            </#list>
            </select>
        </td>
    </tr>
    <tr >
        <td>籍贯：</td>
        <td>
            <input type="text" id="home" value="${emp.home}">
        </td>
        <td>住址：</td>
        <td>
            <input type="text" id="address" value="${emp.address}" >
        </td>
    </tr>
    </tbody>
</table>
<button id="updateE" empId="${emp.id}">确认修改</button>
<input type="hidden" id="deptList" value="${deptList}" />
<input type="hidden" id="empInfo" value="${empInfo}"/>