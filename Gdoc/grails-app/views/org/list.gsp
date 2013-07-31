
<%@ page import="gdoc.Org" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'org.label', default: 'Org')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-org" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-org" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'org.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'org.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="zip" title="${message(code: 'org.zip.label', default: 'Zip')}" />
					
						<g:sortableColumn property="code" title="${message(code: 'org.code.label', default: 'Code')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${orgInstanceList}" status="i" var="orgInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${orgInstance.id}">${fieldValue(bean: orgInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: orgInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: orgInstance, field: "zip")}</td>
					
						<td>${fieldValue(bean: orgInstance, field: "code")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${orgInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
