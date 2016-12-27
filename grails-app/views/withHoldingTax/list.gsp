<%@ page import="sss.WithHoldingTax" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'withHoldingTax.label', default: 'WithHoldingTax')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script type="application/javascript">
        $(document).ready(function () {
            $('#allReportChk').click(clickAllCheckbox)
            $('.reportChk').click(clickCheckbox)
            $('.printList').click(function () {
                var reportIds = []
                $(".reportChk:checked").each(function () {
                    if ($(this).attr('reportId') != '') {
                        reportIds.push($(this).attr('reportId'))
                    } else {
                    }
                })
                if (reportIds == []) {
                    return false
                }
                $('#reportIds').val(reportIds.join(','))
                return true

            });

        });
        function clickAllCheckbox(e) {
            $('.reportChk').prop('checked', $(e.target).prop('checked'))
            if ($('.reportChk:checked').size() > 0) {
                $('.printList').show()
            }
            else {
                $('.printList').hide()
            }
        }

        function clickCheckbox() {
            $('#allReportChk').prop('checked', $('.reportChk:not(:checked)').size() == 0 || $('.reportChk').size() == 0)
            if ($('.reportChk:checked').size() > 0) {
                $('.printList').show()
            }
            else {
                $('.printList').hide()
            }

        }
    </script>
</head>

<body>
<a href="#list-withHoldingTax" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                     default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-withHoldingTax" class="content scaffold-list" role="main">

    <th class="text-center" value="checkbox">
        <g:if test="${withHoldingTaxInstanceList?.find { !it.id }}">
            <g:checkBox name="allReportChk"/>
        </g:if>
    </th>


    <h1>Search</h1>
    <g:set var="queryParams" value="${[
            'code'    : params?.code,
            'company' : params?.company,
            'employee': params?.employee
    ]}"/>
    <g:form name="searchForm" action="list" class="container-fluid" style="margin: 20px 0">
        <div class="row">
            <div class="col-md-10" style="padding-left: 20px;">
                <label>Code</label>
                <g:textField name="code" value="${params?.code}"/>

                <label>Company</label>
                <g:select name="company" from="${sss.Company.list()}" optionKey="id"
                          value="${params?.company}" class="many-to-one" noSelection="['null': '=Select=']"/>

                <label>Employee</label>
                <g:select name="employee" from="${sss.Employee.list()}" optionKey="id"
                          value="${params?.employee}" class="many-to-one" noSelection="['null': '=Employee=']"/>
            </div>

            <div class="col-md-2" align="left">
                <g:submitButton name="search_btn" value="Search"/>
            </div>
        </div>
        <g:actionSubmit action="printReportList" class="btn btn-success printList printList_btn" value="Print"
                        style="display: none;"/>
        <h1><g:message code="default.list.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table>
            <thead>

            <tr>
                <th class="text-center">
                        <g:checkBox name="allReportChk"/>
                </th>
                %{--<g:sortableColumn property="id" title="${message(code: 'withHoldingTax.id.label', default: 'Id')}"/>--}%

                <g:sortableColumn property="code" title="${message(code: 'withHoldingTax.code.label', default: 'Code')}"
                                  params="${queryParams}"/>

                <g:sortableColumn property="company"
                                  title="${message(code: 'withHoldingTax.company.label', default: 'Company')}"
                                  params="${queryParams}"/>

                <g:sortableColumn property="employee"
                                  title="${message(code: 'withHoldingTax.employee.label', default: 'Employee')}"
                                  params="${queryParams}"/>

                <!-- <g:sortableColumn property="dateBox1"
                                       title="${message(code: 'withHoldingTax.dateBox1.label', default: 'Date Box1')}"/>

                <g:sortableColumn property="amountBox1"
                                  title="${message(code: 'withHoldingTax.amountBox1.label', default: 'Amount Box1')}"/>

                <g:sortableColumn property="actualAmountBox1"
                                  title="${message(code: 'withHoldingTax.actualAmountBox1.label', default: 'Actual Amount Box1')}"/>

                <g:sortableColumn property="percentAmountBox1"
                                  title="${message(code: 'withHoldingTax.percentAmountBox1.label', default: 'Percent Amount Box1')}"/> -->

                <g:sortableColumn property="print"
                                  title="${message(code: 'withHoldingTax.percentAmount.label', default: 'Print')}"/>
            </tr>
            </thead>
            <tbody>
            <g:each in="${withHoldingTaxInstanceList}" status="i" var="withHoldingTaxInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td>
                        <input class="reportChk" type="checkbox" name="reportSelecteds[${i}].chk"
                               reportId="${withHoldingTaxInstance.id}"/>

                    </td>

                    <td><g:link action="show"
                                id="${withHoldingTaxInstance.id}">${fieldValue(bean: withHoldingTaxInstance, field: "code")}</g:link></td>

                    <td>
                        <g:link controller="company" action="show" id="${withHoldingTaxInstance.company.id}">
                            ${withHoldingTaxInstance.company.name}
                        </g:link>
                    </td>

                    <td>
                        <g:link controller="employee" action="show" id="${withHoldingTaxInstance.employee.id}">
                            ${withHoldingTaxInstance.employee.name}
                        </g:link>
                    </td>


                    <!-- <td><g:formatDate date="${withHoldingTaxInstance.dateBox1}"/></td>

						<td>${fieldValue(bean: withHoldingTaxInstance, field: "amountBox1")}</td>

						<td>${fieldValue(bean: withHoldingTaxInstance, field: "actualAmountBox1")}</td>

						<td>${fieldValue(bean: withHoldingTaxInstance, field: "percentAmountBox1")}</td> -->
                    %{--<td><g:link action="printReportList" id="${withHoldingTaxInstance.id}">ออกใบทวิ 50</g:link></td>--}%
                    <td><g:link action="renderReport" id="${withHoldingTaxInstance.id}">ออกใบทวิ50</g:link></td>
                    %{--<td><g:link action="renderReport" id="${withHoldingTaxInstance.id}">ออกใบทวิ50</g:link>&nbsp;<g:checkBox name="selectToPrint"/><a onclick="clickAlert()" name="clickMe">alert</a></td>--}%
                </tr>
            </g:each>
            </tbody>
        </table>
        <g:hiddenField name="reportIds" value=""/>
        <g:actionSubmit action="printReportList" class="btn btn-success printList printList_btn" value="Print"
                        style="display: none;"/>
        <div class="pagination">
            <g:paginate total="${withHoldingTaxInstanceTotal}" params="${queryParams}"/>
        </div>
    </g:form>

</div>

</body>

</html>
