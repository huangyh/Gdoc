
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
	
			<nav:render group="tabs1"/>	

				
		<div id="list-doc" class="content scaffold-list" role="main">

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:render template="listAll"></g:render>
			
		</div>  
		
	</body>
</html>
