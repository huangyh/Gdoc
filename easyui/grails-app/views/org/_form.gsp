<%@ page import="easyui.Org" %>



<div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'depts', 'error')} ">
	<label for="depts">
		<g:message code="org.depts.label" default="Depts" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${orgInstance?.depts?}" var="d">
    <li><g:link controller="dept" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="dept" action="create" params="['org.id': orgInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'dept.label', default: 'Dept')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="org.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${orgInstance?.name}"/>
</div>

