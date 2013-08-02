<%@ page import="gdoc.Doc" %>

<div class="fieldcontain ${hasErrors(bean: docInstance, field: 'orgs', 'error')} ">
	<label for="orgs">
		<g:message code="doc.orgs.label" default="Orgs" />
		<span class="required-indicator">:</span>			
	</label>	
	<span class="required-indicator">${docInstance?.orgs} </span>
	<g:hiddenField name="orgs" value="${docInstance?.orgs}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: docInstance, field: 'depts', 'error')} ">
	<label for="depts">
		<g:message code="doc.depts.label" default="Depts" />
		<span class="required-indicator">:</span>	
	</label>
	<span class="required-indicator">${docInstance?.depts} </span>
	<g:hiddenField  name="depts" value="${docInstance?.depts}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: docInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="doc.username.label" default="Username" />
		<span class="required-indicator">:</span>	
	</label>
	<span class="required-indicator">${docInstance?.username} </span>
	<g:hiddenField name="username" value="${docInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: docInstance, field: 'roles', 'error')} ">
	<label for="roles">
		<g:message code="doc.roles.label" default="Roles" />
		<span class="required-indicator">:</span>	
	</label>
	<span class="required-indicator">${docInstance?.roles} </span>
	<g:hiddenField name="roles" value="${docInstance?.roles}"/>
</div>

<div class="fieldcontain required">
	<label for="name">
		<g:message code="doc.name.label" default="Name" />
		<span class="required-indicator">:</span>		
	</label>
	<span class="required-indicator">${docInstance?.name} </span>	
	<g:hiddenField name="name" value="${docInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: docInstance, field: 'categorys', 'error')} required">
	<label for="categorys">
		<g:message code="doc.categorys.label" default="Categorys" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="categorys" from="${docInstance.constraints.categorys.inList}" required="" value="${docInstance?.categorys}" valueMessagePrefix="doc.categorys"/>
</div>

<div class="fieldcontain ${hasErrors(bean: docInstance, field: 'share', 'error')} required">
	<label for="share">
		<g:message code="doc.share.label" default="Share" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="share" from="${docInstance.constraints.share.inList}" required="" value="${docInstance?.share}" valueMessagePrefix="doc.share"/>
</div>



<div class="fieldcontain ${hasErrors(bean: docInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="doc.description.label" default="Description" />		
	</label>
	<g:textField name="description" value="${docInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: docInstance, field: 'fileName', 'error')} ">
	<label for="fileName">
		<g:message code="doc.fileName.label" default="File Name" />
		<span class="required-indicator">:</span>	
		
	</label>
	<span class="required-indicator">${docInstance?.fileName} </span>
	<g:hiddenField name="fileName" value="${docInstance?.fileName}"/>
</div>
