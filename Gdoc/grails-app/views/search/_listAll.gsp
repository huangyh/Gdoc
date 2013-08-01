
<table>
				<thead >
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'doc.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="categorys" title="${message(code: 'doc.categorys.label', default: 'Categorys')}" />
					
						<g:sortableColumn property="share" title="${message(code: 'doc.share.label', default: 'Share')}" />
					
						<g:sortableColumn property="fileName" title="${message(code: 'doc.fileName.label', default: 'File Name')}" />
						
						<g:sortableColumn property="username" title="${message(code: 'doc.username.label', default: 'username')}" />
						
				 		<th ></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${docInstanceList}" status="i" var="docInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: docInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: docInstance, field: "categorys")}</td>
					
						<td>${fieldValue(bean: docInstance, field: "share")}</td>
					
						<td>${fieldValue(bean: docInstance, field: "fileName")}</td>
						
						<td>${fieldValue(bean: docInstance, field: "username")}</td>
					
						<td>
							<g:form controller="doc" action="download">
							<g:hiddenField name="id" value="${docInstance.id}" />
							<g:submitButton name="download" class="save" value="${message(code: 'default.button.download.label', default: '下载')}" />
							</g:form>
						</td>
				
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${docInstanceTotal}" />
			</div>