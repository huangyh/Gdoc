<%@ page import="gdoc.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userId', 'error')} required">
	<label for="userId">
		<g:message code="user.userId.label" default="User Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="userId" required="" value="${userInstance?.userId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${userInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${userInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${userInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="user.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${userInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'orgs', 'error')} required">
	<label for="orgs">
		<g:message code="user.orgs.label" default="Orgs" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="orgs" name="orgs.id" from="${gdoc.Org.list()}" optionKey="id" required="" value="${userInstance?.orgs?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'depts', 'error')} required">
	<label for="depts">
		<g:message code="user.depts.label" default="Depts" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="depts" name="depts.id" from="${gdoc.Dept.list()}" optionKey="id" required="" value="${userInstance?.depts?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'roles', 'error')} required">
	<label for="roles">
		<g:message code="user.roles.label" default="Roles" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="roles" name="roles.id" from="${gdoc.Role.list()}" optionKey="id" required="" value="${userInstance?.roles?.id}" class="many-to-one"/>
</div>

