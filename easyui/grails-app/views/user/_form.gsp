<%@ page import="easyui.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		
	</label>
	<g:textField name="username" value="${userInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${userInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'org', 'error')} required">
	<label for="org">
		<g:message code="user.org.label" default="Org" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="org" name="org.id" from="${easyui.Org.list()}" optionKey="id" required="" value="${userInstance?.org?.id}" class="many-to-one"
	onchange="${remoteFunction(controller:'User', action:'listByOrg', params:'\'id=\'+this.value', update:'dept')}"></g:select>
</div>


<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'dept', 'error')} required">
	<label for="dept">
		<g:message code="user.dept.label" default="Dept" />
		<span class="required-indicator">*</span>
	</label>
	
	<g:select id="dept" name="dept.id" from="${easyui.Dept.list()}" optionKey="id" required="" class="many-to-one"/>
    

</div>
