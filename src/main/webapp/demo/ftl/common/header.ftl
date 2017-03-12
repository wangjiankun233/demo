<#assign basePath=request.contextPath />
<script type="text/javascript" charset="utf-8" src="${basePath}/demo/js/common/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}/demo/js/wjk/common/header.js"></script>

你好： ${user.roleName} ${user.name}
<#assign menuList=menu?eval />
<#list menuList as m >
    <a href="${basePath}/${m.path}">${m.name}</a>
</#list>
<input type="hidden" id="menu" value="${menu}"/>
