
<%@ page import="gdoc.Doc" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'doc.label', default: 'Doc')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-doc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-doc" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'doc.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'doc.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="orgs" title="${message(code: 'doc.orgs.label', default: 'Orgs')}" />
					
						<g:sortableColumn property="depts" title="${message(code: 'doc.depts.label', default: 'Depts')}" />
					
						<g:sortableColumn property="username" title="${message(code: 'doc.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="roles" title="${message(code: 'doc.roles.label', default: 'Roles')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${docInstanceList}" status="i" var="docInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${docInstance.id}">${fieldValue(bean: docInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: docInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: docInstance, field: "orgs")}</td>
					
						<td>${fieldValue(bean: docInstance, field: "depts")}</td>
					
						<td>${fieldValue(bean: docInstance, field: "username")}</td>
					
						<td>${fieldValue(bean: docInstance, field: "roles")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${docInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
