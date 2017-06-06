$(document).ready(function () {

    $("#add").click(function () {
        $.ajax({
            url: $("#basePath").val() + "/work/add",
            type: "POST",
            async: false,
            data: {},
            success: function (data) {
                $("#shit").html(data);

                $("#sub").click(function () {
                    var e=""
                    var a=0;
                    for(var i=0;i< $(".emp").length;i++){
                        if($(".emp")[i].checked){
                            if(a==0){
                            e=e+ $(".emp").eq(i).val()
                            }else{
                            e=e+","+$(".emp").eq(i).val()
                            }
                            a++
                        }
                    }
                    $.ajax({
                        url: $("#basePath").val() + "/work/addWork",
                        type: "POST",
                        async: false,
                        data: {date:$("#date").val(),
                            local :$("#local").val(),
                            info:$("#infos").val(),
                            type:$("#type").val(),
                            remark:$("#remark").val(),
                            empData:e
                        },
                        success: function (data){
                            alert(data);
                        }
                    });
                })
            }
        });
    });
    $("#cha").click(function () {
        var name=$("#nameDept").val()||''
        name="%"+name+"%"

        $.ajax({
            url: $("#basePath").val() + "/work/getWork",
            type: "POST",
            async: false,
            data: {type:$("#type").val()},
            success: function (data) {
                $("#shit").html(data);
                $(".delete").click(function () {
                    $.ajax({
                        url: $("#basePath").val() + "/work/delete",
                        type: "POST",
                        async: false,
                        data: {id:$(this).attr("workId")},
                        success: function (data){
                            alert(data);
                            $("#cha").click();
                        }
                    });
                });
                $(".people").click(function(){
                    $.ajax({
                        url: $("#basePath").val() + "/work/getWorkEmp",
                        type: "POST",
                        async: false,
                        data: {id:$(this).attr("workId")},
                        success: function (data){
                            var e=data;
                            var html='<tr><td>员工姓名</td><td>是否确认</td></tr>';
                            for(var i=0;i<e.length;i++){
                                var status=""
                                if(e[i].status=='1'){
                                    status="已确认"
                                }else if (e[i].status=='0'){
                                    status="未确认"
                                }
                               html=html+'<tr><td>'+e[i].name+'</td><td>'+status+'</td></tr>'
                            }
                            $("#userTable").html(html);
                        }
                    });
                })
                $("#find").click(function () {
                    $("#cha").click()
                })
            }
        });
    });

})