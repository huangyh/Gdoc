
<%@ page import="gdoc.Doc" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'doc.label', default: 'Doc')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-doc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-doc" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list doc">
			
				<g:if test="${docInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="doc.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${docInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${docInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="doc.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${docInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${docInstance?.orgs}">
				<li class="fieldcontain">
					<span id="orgs-label" class="property-label"><g:message code="doc.orgs.label" default="Orgs" /></span>
					
						<span class="property-value" aria-labelledby="orgs-label"><g:fieldValue bean="${docInstance}" field="orgs"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${docInstance?.depts}">
				<li class="fieldcontain">
					<span id="depts-label" class="property-label"><g:message code="doc.depts.label" default="Depts" /></span>
					
						<span class="property-value" aria-labelledby="depts-label"><g:fieldValue bean="${docInstance}" field="depts"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${docInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="doc.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${docInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${docInstance?.roles}">
				<li class="fieldcontain">
					<span id="roles-label" class="property-label"><g:message code="doc.roles.label" default="Roles" /></span>
					
						<span class="property-value" aria-labelledby="roles-label"><g:fieldValue bean="${docInstance}" field="roles"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${docInstance?.share}">
				<li class="fieldcontain">
					<span id="share-label" class="property-label"><g:message code="doc.share.label" default="Share" /></span>
					
						<span class="property-value" aria-labelledby="share-label"><g:fieldValue bean="${docInstance}" field="share"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${docInstance?.fileName}">
				<li class="fieldcontain">
					<span id="fileName-label" class="property-label"><g:message code="doc.fileName.label" default="File Name" /></span>
					
						<span class="property-value" aria-labelledby="fileName-label"><g:fieldValue bean="${docInstance}" field="fileName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${docInstance?.filedata}">
				<li class="fieldcontain">
					<span id="filedata-label" class="property-label"><g:message code="doc.filedata.label" default="Filedata" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${docInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="doc.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${docInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${docInstance?.categorys}">
				<li class="fieldcontain">
					<span id="categorys-label" class="property-label"><g:message code="doc.categorys.label" default="Categorys" /></span>
					
						<span class="property-value" aria-labelledby="categorys-label"><g:link controller="category" action="show" id="${docInstance?.categorys?.id}">${docInstance?.categorys?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${docInstance?.id}" />
					<g:link class="edit" action="edit" id="${docInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
