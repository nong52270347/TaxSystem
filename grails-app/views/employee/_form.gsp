<%@ page import="sss.Employee" %>



<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="employee.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" required="" value="${employeeInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="employee.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${employeeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'nickName', 'error')} ">
	<label for="nickName">
		<g:message code="employee.nickName.label" default="Nick Name" />
		
	</label>
	<g:textField name="nickName" value="${employeeInstance?.nickName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="employee.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${employeeInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'idCard', 'error')} required">
	<label for="idCard">
		<g:message code="employee.idCard.label" default="Id Card" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="idCard" maxlength="13" required="" value="${employeeInstance?.idCard}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'groupName', 'error')} ">
	<label for="groupName">
		<g:message code="employee.groupName.label" default="Group Name" />
		
	</label>
	<g:select name="groupName" from="${sss.GroupName.list()}" multiple="multiple" optionKey="id" size="5" value="${employeeInstance?.groupName*.id}" class="many-to-many"/>
</div>

