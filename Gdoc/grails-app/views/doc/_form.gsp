<%@ page import="gdoc.Doc" %>



<div class="fieldcontain ${hasErrors(bean: docInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="doc.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${docInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: docInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="doc.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${docInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: docInstance, field: 'orgs', 'error')} ">
	<label for="orgs">
		<g:message code="doc.orgs.label" default="Orgs" />
		
	</label>
	<g:textField name="orgs" value="${docInstance?.orgs}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: docInstance, field: 'depts', 'error')} ">
	<label for="depts">
		<g:message code="doc.depts.label" default="Depts" />
		
	</label>
	<g:textField name="depts" value="${docInstance?.depts}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: docInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="doc.username.label" default="Username" />
		
	</label>
	<g:textField name="username" value="${docInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: docInstance, field: 'roles', 'error')} ">
	<label for="roles">
		<g:message code="doc.roles.label" default="Roles" />
		
	</label>
	<g:textField name="roles" value="${docInstance?.roles}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: docInstance, field: 'share', 'error')} ">
	<label for="share">
		<g:message code="doc.share.label" default="Share" />
		
	</label>
	<g:select name="share" from="${docInstance.constraints.share.inList}" value="${docInstance?.share}" valueMessagePrefix="doc.share" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: docInstance, field: 'fileName', 'error')} ">
	<label for="fileName">
		<g:message code="doc.fileName.label" default="File Name" />
		
	</label>
	<g:textField name="fileName" value="${docInstance?.fileName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: docInstance, field: 'filedata', 'error')} ">
	<label for="filedata">
		<g:message code="doc.filedata.label" default="Filedata" />
		
	</label>
	<input type="file" id="filedata" name="filedata" />
</div>

<div class="fieldcontain ${hasErrors(bean: docInstance, field: 'categorys', 'error')} required">
	<label for="categorys">
		<g:message code="doc.categorys.label" default="Categorys" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="categorys" name="categorys.id" from="${gdoc.Category.list()}" optionKey="id" required="" value="${docInstance?.categorys?.id}" class="many-to-one"/>
</div>

