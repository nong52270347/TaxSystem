<%@ page import="sss.Company" %>



<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="company.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" required="" value="${companyInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="company.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${companyInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="company.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${companyInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'taxId', 'error')} required">
	<label for="taxId">
		<g:message code="company.taxId.label" default="Tax Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="taxId" maxlength="13" required="" value="${companyInstance?.taxId}"/>
</div>

