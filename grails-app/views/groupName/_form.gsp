<%@ page import="sss.GroupName" %>



<div class="fieldcontain ${hasErrors(bean: groupNameInstance, field: 'groupName', 'error')} required">
	<label for="groupName">
		<g:message code="groupName.groupName.label" default="Group Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="groupName" required="" value="${groupNameInstance?.groupName}"/>
</div>

