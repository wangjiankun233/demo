
<div class="col-md-2 column" >
    <ul class="nav nav-list">

        <li class="active">
            <a href="#" id="cha">
                <#assign t=type?eval/>
                    <#if t=='0' >
                        加班查询
                    </#if>
<#if t=='1' >
    出差查询
</#if>
                </a>
        </li>
        <li>
            <a href="#" id="add">添加</a>
        </li>
    </ul>
</div>
<div class="col-md-10 column" id="shit">

</div>
<input type="hidden" id="type" value="${type}">
<#assign basePath=request.contextPath />
<script type="text/javascript" charset="utf-8" src="${basePath}/demo/js/work/work.js"></script>
