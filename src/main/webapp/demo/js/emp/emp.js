$(document).ready(function () {

    $("#add").click(function () {
        $.ajax({
            url: $("#basePath").val() + "/user/add",
            type: "POST",
            async: false,
            data: {},
            success: function (data) {
                $("#shit").html(data);

                $("#sub").click(function () {

                    $.ajax({
                        url: $("#basePath").val() + "/user/addEmp",
                        type: "POST",
                        async: false,
                        data: {name:$("#name").val(),
                            password:$("#password").val(),
                            chName:$("#chName").val(),
                            deptId:$("#deptId").val(),
                            sex:$("#sex").val(),
                            home:$("#home").val(),
                            address:$("#address").val(),
                            idcard:$("#idcard").val(),
                            type:$("#type").val()
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
            url: $("#basePath").val() + "/user/findEmp",
            type: "POST",
            async: false,
            data: {name:name,type:$("#type").val()},
            success: function (data) {
                $("#shit").html(data);
                $(".delete").click(function () {
                    $.ajax({
                        url: $("#basePath").val() + "/user/deleteEmp",
                        type: "POST",
                        async: false,
                        data: {id:$(this).attr("empId")},
                        success: function (data){
                            alert(data);
                            $("#cha").click();
                        }
                    });
                });
                $(".detail").click(function () {
                    $.ajax({
                        url: $("#basePath").val() + "/user/detail",
                        type: "POST",
                        async: false,
                        data: {id:$(this).attr("empId"),

                        },
                        success: function (data){

                            $("#shit").html(data);
                        }
                    });
                });
                $(".update").click(function () {
                    $.ajax({
                        url: $("#basePath").val() + "/user/update",
                        type: "POST",
                        async: false,
                        data: {id:$(this).attr("empId"),

                        },
                        success: function (data){

                            $("#shit").html(data);
                            $("#updateE").click(function () {
                                $.ajax({
                                    url: $("#basePath").val() + "/user/updateEmp",
                                    type: "POST",
                                    async: false,
                                    data: {name:$("#name").val(),
                                        chName:$("#chName").val(),
                                        deptId:$("#deptId").val(),
                                        sex:$("#sex").val(),
                                        home:$("#home").val(),
                                        address:$("#address").val(),
                                        idcard:$("#idcard").val(),
                                        id:$(this).attr("empId")
                                    },
                                    success: function (data){
                                        alert(data);
                                    }
                                });
                            })
                        }
                    });
                });
                $("#find").click(function () {
                    $("#cha").click()
                })
            }
        });
    });

})