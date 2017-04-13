
<table class="table">
    <tbody>
    <tr>
        <td> 用户名：</td>
        <td>
           <input type="text" id="name">
        </td>
        <td> 密码：</td>
        <td>
            <input type="text" id="password">
        </td>
    </tr>
    <tr >
        <td>姓名：</td>
        <td>
            <input type="text" id="chName">
        </td>
        <td>身份证：</td>
        <td>
            <input type="text" id="idcard">
        </td>
    </tr>
    <tr >
        <td>性别：</td>
        <td>
            <select id="sex">
                <option value="1">男</option>
                <option value="2">女</option>
                <option value="0">其他</option>
            </select>

        </td>
        <td>部门：</td>
        <td>
        <#assign deptL=deptList?eval />

            <select id="deptId">
            <#list  deptL as dept>
                <option value ="${dept.id}">${dept.name}</option>
            </#list>
            </select>
        </td>
    </tr>
    <tr >
        <td>籍贯：</td>
        <td>
            <input type="text" id="home" >
        </td>
        <td>住址：</td>
        <td>
            <input type="text" id="address" >
        </td>
    </tr>
    </tbody>
</table>
<button id="sub">提交</button>
<input type="hidden" id="deptList" value="${deptList}" />