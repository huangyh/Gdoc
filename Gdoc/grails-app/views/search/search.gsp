<%@ page import="gdoc.Doc"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'doc.label', default: 'Doc')}" />
<title><g:message code="default.search.label" default="搜索文档"
		args="[entityName]" /></title>
</head>
<body>
	<a href="#create-doc" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>

	<div id="create-doc" class="content scaffold-create" role="main">
		<h1>
			<g:message code="default.search.label" default="搜索条件"
				args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		
		<g:form action="result" enctype="multipart/form-data">
			<fieldset class="form">
				<div
					class="fieldcontain ${hasErrors(bean: docInstance, field: 'categorys', 'error')} required">
					<label for="categorys"> <g:message
							code="doc.categorys.label" default="Categorys" /> <span
						class="required-indicator">*</span>
					</label>
					<g:select name="categorys"
						from="${docInstance.constraints.categorys.inList}" required=""
						value="${docInstance?.categorys}"
						valueMessagePrefix="doc.categorys" />
				</div>

				<div
					class="fieldcontain ${hasErrors(bean: docInstance, field: 'share', 'error')} required">
					<label for="share"> <g:message code="doc.share.label"
							default="Share" /> <span class="required-indicator">*</span>
					</label>
					<g:select name="share"
						from="${docInstance.constraints.share.inList}" required=""
						value="${docInstance?.share}" valueMessagePrefix="doc.share" />
				</div>

				<div class="fieldcontain">
					<label for="name"> <g:message code="doc.startDate.label"
							default="开始时间" /> <span class="required-indicator">:</span>
					</label>
					<g:datePicker name="startDate" precision="day"  value="${new Date()-1}"  />
				</div>

				<div class="fieldcontain">
					<label for="name"> <g:message code="doc.lastDate.label"
							default="到" /> <span class="required-indicator">:</span>
					</label>
					<g:datePicker name="lastDate" precision="day"  value="${new Date()+1}"  />
				</div>
			</fieldset>
			<fieldset class="buttons">
				<g:submitButton name="create" class="save"
					value="${message(code: 'default.button.search.label', default: '搜索')}" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
