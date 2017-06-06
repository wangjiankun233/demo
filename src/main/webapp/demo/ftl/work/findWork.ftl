
<div id="ok">
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
                <button workId="${work.id}" class="people" data-toggle="modal" data-target="#myModal">
                    查看相关人员
                </button>

                <button class="delete" workId="${work.id}" >删除</button>

            </td>
        </tr>
        </#list>


        </tbody>
    </table>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
            </div>
            <div class="modal-body">

                <table id="userTable" class="table-bordered">

                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<input type="hidden" id="workList" value='${workList}' />