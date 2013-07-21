<%@ page import="gdoc.Dept" %>



<div class="fieldcontain ${hasErrors(bean: deptInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="dept.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${deptInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deptInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="dept.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${deptInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deptInstance, field: 'orgs', 'error')} required">
	<label for="orgs">
		<g:message code="dept.orgs.label" default="Orgs" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="orgs" name="orgs.id" from="${gdoc.Org.list()}" optionKey="id" required="" value="${deptInstance?.orgs?.id}" class="many-to-one"/>
</div>

