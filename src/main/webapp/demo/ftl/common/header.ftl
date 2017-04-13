<#assign basePath=request.contextPath />
<link rel="stylesheet" href="${basePath}/demo/js/common/bootstrap-3.3.7/css/bootstrap.min.css">
<script type="text/javascript" charset="utf-8" src="${basePath}/demo/js/common/jquery/jquery-1.9.1.min.js"></script>
<script src="${basePath}/demo/js/common/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}/demo/js/wjk/common/header.js"></script>

<body>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <div class="col-md-10 column" >
                    <h3 >
                        新创人力资源管理系统
                    </h3>
                </div>
                <div class="col-md-2 column">
                    你好： ${user.roleName}
                  <br>
                  ${user.chName}
                </div>
            </div>
            <ul class="nav nav-pills">
            <#assign menuList=menu?eval />
            <#list menuList as m >
                <#if m_index==0>
                    <li >
                        <a class="menus" href="#" path="${m.path}" >${m.name}</a>
                    </li>
                <#else >
                    <li >
                        <a href="#" class="menus"  path="${m.path}">${m.name}</a>
                    </li>
                </#if>

            </#list>
            </ul>
            <div class="row clearfix" id="info">

            </div>
        </div>
    </div>
</div>

<input type="hidden" id="basePath" value="${basePath}">
<input type="hidden" id="menu" value="${menu}"/>
