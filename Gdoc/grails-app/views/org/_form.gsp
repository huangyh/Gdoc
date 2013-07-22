<%@ page import="gdoc.Org" %>



<div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="org.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${orgInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="org.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${orgInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'zip', 'error')} required">
	<label for="zip">
		<g:message code="org.zip.label" default="Zip" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="zip" type="number" value="${orgInstance.zip}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="org.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${orgInstance?.code}"/>
</div>

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

