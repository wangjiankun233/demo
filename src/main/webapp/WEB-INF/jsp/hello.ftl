hello!!!!
<#assign testJson=test?eval />
<#list testJson as a>
    ${a.name}
</#list>
<input type="hidden" id="test" value="${test}"/>