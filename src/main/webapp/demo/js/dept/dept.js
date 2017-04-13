$(document).ready(function () {
    $("#add").click(function () {
        $(this).parent().addClass("active")
        $.ajax({
            url: $("#basePath").val() + "/dept/add",
            type: "POST",
            async: false,
            data: {},
            success: function (data) {
                $("#shit").html(data);
                $("#sub").click(function () {

                    $.ajax({
                        url: $("#basePath").val() + "/dept/adddept",
                        type: "POST",
                        async: false,
                        data: {name:$("#name").val(),
                              scope:$("#scope").val(),
                            remark:$("#remark").val()},
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
            url: $("#basePath").val() + "/dept/get",
            type: "POST",
            async: false,
            data: {name:name},
            success: function (data) {
                $("#shit").html(data);
                $(".delete").click(function () {
                    $.ajax({
                        url: $("#basePath").val() + "/dept/delete",
                        type: "POST",
                        async: false,
                        data: {id:$(this).attr("deptId")},
                        success: function (data){
                            alert(data);
                            $("#cha").click();
                        }
                    });
                });
                $(".update").click(function () {

                   $(this).parent().parent().html("<td><input class='n' type='text' value='"+$(this).attr("dn")+
                       "'></td><td><input class='s' type='text' value='"+$(this).attr("ds")+
                       "'></td><td><input class='r' type='text' value='"+$(this).attr("dr")+
                       "'></td><td><input class='save' type='button' deptId='"+$(this).attr("deptId")+
                       "' value='保存'></td>")
                    $(".save").unbind().click(function () {
                        $.ajax({
                            url: $("#basePath").val() + "/dept/update",
                            type: "POST",
                            async: false,
                            data: {id:$(this).attr("deptId"),
                                name:$(this).parent().parent().find(".n").val(),
                                scope:$(this).parent().parent().find(".s").val(),
                                remark:$(this).parent().parent().find(".r").val()
                            },
                            success: function (data){
                                alert(data);
                                $("#cha").click();
                            }
                        });

                    });

                });
                $("#find").click(function () {
                    $("#cha").click()
                })
            }
        });
    });

})