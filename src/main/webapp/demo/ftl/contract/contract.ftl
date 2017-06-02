<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $(".update").click(function () {
            $("#status").html("")
            var name=$(this).attr("empName")
            var id=$(this).attr("empId")
            $(".doUpload").unbind().click(function () {
                var formData = new FormData();
                console.log($("#fileupload")[0].files[0])
                formData.append("file",$("#fileupload")[0].files[0]);
                formData.append("name",id+name+".doc");
                formData.append("id",id);
                $.ajax({
                    url :$("#basePath").val()+"/contract/upload",
                    type : 'POST',
                    async:false,
                    data : formData,
                   // 告诉jQuery不要去处理发送的数据
                    processData : false,
                    // 告诉jQuery不要去设置Content-Type请求头
                    contentType : false,
                    dataType:'text',
                    beforeSend:function(){
                        $("#status").html("正在上传....")
                        console.log("正在进行，请稍候");
                    },
                    success : function(data) {
                        if(data=='success'){
                            $("#status").html("上传成功")
                            console.log("上传成功");
                        }else{
                            console.log("失败");
                        }
                    }
                });
            })
        });
        $(".download").click(function () {
            var fileName=$(this).attr("con");
            window.open($("#basePath").val() + "/contract/downLoad2?fileName="+fileName)

        });
    });

</script>


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
             <#if dept.contract!=''>
                <button class="update" empId="${dept.id}" empName="${dept.chName}" con="${dept.contract}" data-toggle="modal" data-target="#myModal">上传合同</button>
                <button class="download" empId="${dept.id}" con="${dept.contract}" >下载合同</button>
             <#else >
                 <button class="update" empId="${dept.id}" empName="${dept.chName}" con="${dept.contract}" data-toggle="modal" data-target="#myModal" >上传合同</button>

             </#if>
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

                <table id="userTable">
                    <span class="up-btn" id="selectFile">请选择文件</span>
                    <input type="file" name="fileupload" id="fileupload" />
                    <button class="doUpload">上传</button>
                    <span id="status"></span>

                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<input type="hidden" id="empList" value='${empList}' />