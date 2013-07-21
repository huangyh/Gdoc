<%@ page import="easyui.Dept" %>



<div class="fieldcontain ${hasErrors(bean: deptInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="dept.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${deptInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deptInstance, field: 'orgs', 'error')} required">
	<label for="orgs">
		<g:message code="dept.orgs.label" default="Orgs" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="orgs" name="orgs.id" from="${easyui.Org.list()}" optionKey="id" required="" value="${deptInstance?.orgs?.id}" class="many-to-one"/>
</div>

