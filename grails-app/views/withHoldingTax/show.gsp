
<%@ page import="sss.WithHoldingTax" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'withHoldingTax.label', default: 'WithHoldingTax')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-withHoldingTax" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-withHoldingTax" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list withHoldingTax">
			
				<g:if test="${withHoldingTaxInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="withHoldingTax.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${withHoldingTaxInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.dateBox1}">
				<li class="fieldcontain">
					<span id="dateBox1-label" class="property-label"><g:message code="withHoldingTax.dateBox1.label" default="Date Box1" /></span>
					
						<span class="property-value" aria-labelledby="dateBox1-label"><g:formatDate date="${withHoldingTaxInstance?.dateBox1}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.amountBox1}">
				<li class="fieldcontain">
					<span id="amountBox1-label" class="property-label"><g:message code="withHoldingTax.amountBox1.label" default="Amount Box1" /></span>
					
						<span class="property-value" aria-labelledby="amountBox1-label"><g:fieldValue bean="${withHoldingTaxInstance}" field="amountBox1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.actualAmountBox1}">
				<li class="fieldcontain">
					<span id="actualAmountBox1-label" class="property-label"><g:message code="withHoldingTax.actualAmountBox1.label" default="Actual Amount Box1" /></span>
					
						<span class="property-value" aria-labelledby="actualAmountBox1-label"><g:fieldValue bean="${withHoldingTaxInstance}" field="actualAmountBox1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.percentAmountBox1}">
				<li class="fieldcontain">
					<span id="percentAmountBox1-label" class="property-label"><g:message code="withHoldingTax.percentAmountBox1.label" default="Percent Amount Box1" /></span>
					
						<span class="property-value" aria-labelledby="percentAmountBox1-label"><g:fieldValue bean="${withHoldingTaxInstance}" field="percentAmountBox1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.dateBox2}">
				<li class="fieldcontain">
					<span id="dateBox2-label" class="property-label"><g:message code="withHoldingTax.dateBox2.label" default="Date Box2" /></span>
					
						<span class="property-value" aria-labelledby="dateBox2-label"><g:formatDate date="${withHoldingTaxInstance?.dateBox2}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.amountBox2}">
				<li class="fieldcontain">
					<span id="amountBox2-label" class="property-label"><g:message code="withHoldingTax.amountBox2.label" default="Amount Box2" /></span>
					
						<span class="property-value" aria-labelledby="amountBox2-label"><g:fieldValue bean="${withHoldingTaxInstance}" field="amountBox2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.actualAmountBox2}">
				<li class="fieldcontain">
					<span id="actualAmountBox2-label" class="property-label"><g:message code="withHoldingTax.actualAmountBox2.label" default="Actual Amount Box2" /></span>
					
						<span class="property-value" aria-labelledby="actualAmountBox2-label"><g:fieldValue bean="${withHoldingTaxInstance}" field="actualAmountBox2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.percentAmountBox2}">
				<li class="fieldcontain">
					<span id="percentAmountBox2-label" class="property-label"><g:message code="withHoldingTax.percentAmountBox2.label" default="Percent Amount Box2" /></span>
					
						<span class="property-value" aria-labelledby="percentAmountBox2-label"><g:fieldValue bean="${withHoldingTaxInstance}" field="percentAmountBox2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.dateBox3}">
				<li class="fieldcontain">
					<span id="dateBox3-label" class="property-label"><g:message code="withHoldingTax.dateBox3.label" default="Date Box3" /></span>
					
						<span class="property-value" aria-labelledby="dateBox3-label"><g:formatDate date="${withHoldingTaxInstance?.dateBox3}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.amountBox3}">
				<li class="fieldcontain">
					<span id="amountBox3-label" class="property-label"><g:message code="withHoldingTax.amountBox3.label" default="Amount Box3" /></span>
					
						<span class="property-value" aria-labelledby="amountBox3-label"><g:fieldValue bean="${withHoldingTaxInstance}" field="amountBox3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.actualAmountBox3}">
				<li class="fieldcontain">
					<span id="actualAmountBox3-label" class="property-label"><g:message code="withHoldingTax.actualAmountBox3.label" default="Actual Amount Box3" /></span>
					
						<span class="property-value" aria-labelledby="actualAmountBox3-label"><g:fieldValue bean="${withHoldingTaxInstance}" field="actualAmountBox3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.percentAmountBox3}">
				<li class="fieldcontain">
					<span id="percentAmountBox3-label" class="property-label"><g:message code="withHoldingTax.percentAmountBox3.label" default="Percent Amount Box3" /></span>
					
						<span class="property-value" aria-labelledby="percentAmountBox3-label"><g:fieldValue bean="${withHoldingTaxInstance}" field="percentAmountBox3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.dateBox4}">
				<li class="fieldcontain">
					<span id="dateBox4-label" class="property-label"><g:message code="withHoldingTax.dateBox4.label" default="Date Box4" /></span>
					
						<span class="property-value" aria-labelledby="dateBox4-label"><g:formatDate date="${withHoldingTaxInstance?.dateBox4}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.amountBox4}">
				<li class="fieldcontain">
					<span id="amountBox4-label" class="property-label"><g:message code="withHoldingTax.amountBox4.label" default="Amount Box4" /></span>
					
						<span class="property-value" aria-labelledby="amountBox4-label"><g:fieldValue bean="${withHoldingTaxInstance}" field="amountBox4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.actualAmountBox4}">
				<li class="fieldcontain">
					<span id="actualAmountBox4-label" class="property-label"><g:message code="withHoldingTax.actualAmountBox4.label" default="Actual Amount Box4" /></span>
					
						<span class="property-value" aria-labelledby="actualAmountBox4-label"><g:fieldValue bean="${withHoldingTaxInstance}" field="actualAmountBox4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.percentAmountBox4}">
				<li class="fieldcontain">
					<span id="percentAmountBox4-label" class="property-label"><g:message code="withHoldingTax.percentAmountBox4.label" default="Percent Amount Box4" /></span>
					
						<span class="property-value" aria-labelledby="percentAmountBox4-label"><g:fieldValue bean="${withHoldingTaxInstance}" field="percentAmountBox4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.dateBox5}">
				<li class="fieldcontain">
					<span id="dateBox5-label" class="property-label"><g:message code="withHoldingTax.dateBox5.label" default="Date Box5" /></span>
					
						<span class="property-value" aria-labelledby="dateBox5-label"><g:formatDate date="${withHoldingTaxInstance?.dateBox5}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.amountBox5}">
				<li class="fieldcontain">
					<span id="amountBox5-label" class="property-label"><g:message code="withHoldingTax.amountBox5.label" default="Amount Box5" /></span>
					
						<span class="property-value" aria-labelledby="amountBox5-label"><g:fieldValue bean="${withHoldingTaxInstance}" field="amountBox5"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.actualAmountBox5}">
				<li class="fieldcontain">
					<span id="actualAmountBox5-label" class="property-label"><g:message code="withHoldingTax.actualAmountBox5.label" default="Actual Amount Box5" /></span>
					
						<span class="property-value" aria-labelledby="actualAmountBox5-label"><g:fieldValue bean="${withHoldingTaxInstance}" field="actualAmountBox5"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.percentAmountBox5}">
				<li class="fieldcontain">
					<span id="percentAmountBox5-label" class="property-label"><g:message code="withHoldingTax.percentAmountBox5.label" default="Percent Amount Box5" /></span>
					
						<span class="property-value" aria-labelledby="percentAmountBox5-label"><g:fieldValue bean="${withHoldingTaxInstance}" field="percentAmountBox5"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.dateBox6}">
				<li class="fieldcontain">
					<span id="dateBox6-label" class="property-label"><g:message code="withHoldingTax.dateBox6.label" default="Date Box6" /></span>
					
						<span class="property-value" aria-labelledby="dateBox6-label"><g:formatDate date="${withHoldingTaxInstance?.dateBox6}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.amountBox6}">
				<li class="fieldcontain">
					<span id="amountBox6-label" class="property-label"><g:message code="withHoldingTax.amountBox6.label" default="Amount Box6" /></span>
					
						<span class="property-value" aria-labelledby="amountBox6-label"><g:fieldValue bean="${withHoldingTaxInstance}" field="amountBox6"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.actualAmountBox6}">
				<li class="fieldcontain">
					<span id="actualAmountBox6-label" class="property-label"><g:message code="withHoldingTax.actualAmountBox6.label" default="Actual Amount Box6" /></span>
					
						<span class="property-value" aria-labelledby="actualAmountBox6-label"><g:fieldValue bean="${withHoldingTaxInstance}" field="actualAmountBox6"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.percentAmountBox6}">
				<li class="fieldcontain">
					<span id="percentAmountBox6-label" class="property-label"><g:message code="withHoldingTax.percentAmountBox6.label" default="Percent Amount Box6" /></span>
					
						<span class="property-value" aria-labelledby="percentAmountBox6-label"><g:fieldValue bean="${withHoldingTaxInstance}" field="percentAmountBox6"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.employee}">
				<li class="fieldcontain">
					<span id="employee-label" class="property-label"><g:message code="withHoldingTax.employee.label" default="Employee" /></span>
					
						<span class="property-value" aria-labelledby="employee-label"><g:link controller="employee" action="show" id="${withHoldingTaxInstance?.employee?.id}">${withHoldingTaxInstance?.employee?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.company}">
				<li class="fieldcontain">
					<span id="company-label" class="property-label"><g:message code="withHoldingTax.company.label" default="Company" /></span>
					
						<span class="property-value" aria-labelledby="company-label"><g:link controller="company" action="show" id="${withHoldingTaxInstance?.company?.id}">${withHoldingTaxInstance?.company?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${withHoldingTaxInstance?.etc}">
				<li class="fieldcontain">
					<span id="etc-label" class="property-label"><g:message code="withHoldingTax.etc.label" default="Etc" /></span>
					
						<span class="property-value" aria-labelledby="etc-label"><g:fieldValue bean="${withHoldingTaxInstance}" field="etc"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${withHoldingTaxInstance?.id}" />
					<g:link class="edit" action="edit" id="${withHoldingTaxInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
