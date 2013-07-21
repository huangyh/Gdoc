<%@ page import="gdoc.Role" %>



<div class="fieldcontain ${hasErrors(bean: roleInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="role.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${roleInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: roleInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="role.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${roleInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: roleInstance, field: 'users', 'error')} ">
	<label for="users">
		<g:message code="role.users.label" default="Users" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${roleInstance?.users?}" var="u">
    <li><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="user" action="create" params="['role.id': roleInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'user.label', default: 'User')])}</g:link>
</li>
</ul>

</div>

