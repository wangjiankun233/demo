<form class="form-search">
    <input class="input-medium search-query" type="text" id="nameDept"/> <button type="submit" class="btn" id="find">查找</button>
</form>
<div id="ok">
<table class="table">
    <thead>
    <tr>
        <th>
            部门名称
        </th>
        <th>
           经营范围
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
    <#assign dlist=list?eval/>
    <#list dlist as dept>
    <tr>
        <td>
            ${dept.name}
        </td>
        <td>
            ${dept.scope}
        </td>
        <td>
            ${dept.remark}
        </td>
        <td>
            <button class="update" deptId="${dept.id}" dn="${dept.name}" ds=" ${dept.scope}" dr="${dept.remark}">修改</button>
            <button class="delete" deptId="${dept.id}" >删除</button>

        </td>
    </tr>
    </#list>


    </tbody>
</table>
</div>
<input type="hidden" id="list" value="${list}"/>