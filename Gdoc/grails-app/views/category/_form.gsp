<%@ page import="gdoc.Category" %>



<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="category.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${categoryInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="category.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${categoryInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'docs', 'error')} ">
	<label for="docs">
		<g:message code="category.docs.label" default="Docs" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${categoryInstance?.docs?}" var="d">
    <li><g:link controller="doc" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="doc" action="create" params="['category.id': categoryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'doc.label', default: 'Doc')])}</g:link>
</li>
</ul>

</div>

