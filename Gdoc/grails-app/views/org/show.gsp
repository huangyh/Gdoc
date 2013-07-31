
<%@ page import="gdoc.Org" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'org.label', default: 'Org')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-org" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-org" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list org">
			
				<g:if test="${orgInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="org.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${orgInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orgInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="org.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${orgInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orgInstance?.zip}">
				<li class="fieldcontain">
					<span id="zip-label" class="property-label"><g:message code="org.zip.label" default="Zip" /></span>
					
						<span class="property-value" aria-labelledby="zip-label"><g:fieldValue bean="${orgInstance}" field="zip"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orgInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="org.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${orgInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orgInstance?.depts}">
				<li class="fieldcontain">
					<span id="depts-label" class="property-label"><g:message code="org.depts.label" default="Depts" /></span>
					
						<g:each in="${orgInstance.depts}" var="d">
						<span class="property-value" aria-labelledby="depts-label"><g:link controller="dept" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${orgInstance?.id}" />
					<g:link class="edit" action="edit" id="${orgInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
