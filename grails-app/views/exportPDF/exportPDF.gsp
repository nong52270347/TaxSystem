
<%@ page import="sss.Employee" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
  <ul>
    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
  </ul>
</div>
<div id="list-employee" class="content scaffold-list" role="main">
  <h1><g:message code="default.list.label" args="[entityName]" /></h1>
  <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
  </g:if>
  <table>
    <thead>
    <tr>

      <g:sortableColumn property="code" title="${message(code: 'employee.code.label', default: 'Code')}" />

      <g:sortableColumn property="name" title="${message(code: 'employee.name.label', default: 'Name')}" />

      <g:sortableColumn property="address" title="${message(code: 'employee.address.label', default: 'Address')}" />

      <g:sortableColumn property="idCard" title="${message(code: 'employee.idCard.label', default: 'Id Card')}" />

    </tr>
    </thead>
    <tbody>

      <tr >

        <td><g:select name="employee" from="${sss.Employee.list()}"></g:select></td>

        <td><g:select name="employee" from="${sss.Company.list()}"></g:select></td>

        <td></td>

        <td></td>

      </tr>

    </tbody>
  </table>

</div>
</body>
</html>
