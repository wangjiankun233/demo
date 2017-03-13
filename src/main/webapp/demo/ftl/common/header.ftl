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
                <div class="col-md-8 column">
                </div>
                <div class="col-md-4 column">
                    你好： ${user.roleName} ${user.name}
                </div>
            </div>
            <ul class="nav nav-pills">
            <#assign menuList=menu?eval />
            <#list menuList as m >
                <#if m_index==0>
                    <li class="active">
                        <a href="#" >${m.name}</a>
                    </li>
                <#else >
                    <li >
                        <a href="#" >${m.name}</a>
                    </li>
                </#if>

            </#list>


                <li class="dropdown pull-right">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">下拉<strong class="caret"></strong></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#">操作</a>
                        </li>
                        <li>
                            <a href="#">设置栏目</a>
                        </li>
                        <li>
                            <a href="#">更多设置</a>
                        </li>
                        <li class="divider">
                        </li>
                        <li>
                            <a href="#">分割线</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

<input type="hidden" id="menu" value="${menu}"/>
