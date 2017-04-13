<form class="form-search">
    <input class="input-medium search-query" type="text" id="nameDept"/> <button type="submit" class="btn" id="find">查找</button>
</form>
<div id="ok">
    <table class="table">
        <thead>
        <tr>
            <th>
                姓名
            </th>
            <th>
                部门
            </th>
            <th>
                性别
            </th>
            <th>
                住址
            </th>
            <th>
                操作
            </th>
        </tr>
        </thead>
        <tbody>
        <#assign dlist=empList?eval/>
        <#list dlist as dept>
        <tr>
            <td>
                <a href="#" class="detail" empId="${dept.id}">${dept.chName}</a>
            </td>
            <td>
            ${dept.deptName}
            </td>
            <td>
                <#if dept.sex=='0'>其他</#if>
                <#if dept.sex=='1'>男</#if>
                <#if dept.sex=='2'>女</#if>
            </td>
            <td>${dept.address}</td>
            <td>
                <button class="update" empId="${dept.id}" >修改</button>
                <button class="delete" empId="${dept.id}" >删除</button>

            </td>
        </tr>
        </#list>


        </tbody>
    </table>
</div>
<input type="hidden" id="empList" value='${empList}' />