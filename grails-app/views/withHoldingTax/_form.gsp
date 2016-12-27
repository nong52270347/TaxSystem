<%@ page import="sss.WithHoldingTax" %>
<script>
    function sum1() {
        var amountBox1 = parseInt(document.getElementById("amountBox1").value);
        var percentAmountBox1 = parseInt(document.getElementById("percentAmountBox1").value);
        var result = amountBox1 * (percentAmountBox1 / 100);
//    var result = amountBox1 - (amountBox1 * (percentAmountBox1/100) );
        if (!isNaN(amountBox1) && !isNaN(percentAmountBox1)) {
            document.getElementById("actualAmountBox1").value = result;
        }
    }
    function sum2() {
        var amountBox2 = parseInt(document.getElementById("amountBox2").value);
        var percentAmountBox2 = parseInt(document.getElementById("percentAmountBox2").value);
        var result = amountBox2 * (percentAmountBox2 / 100);
        if (!isNaN(amountBox2) && !isNaN(percentAmountBox2)) {
            document.getElementById("actualAmountBox2").value = result;
        }
    }
    function sum3() {
        var amountBox3 = parseInt(document.getElementById("amountBox3").value);
        var percentAmountBox3 = parseInt(document.getElementById("percentAmountBox3").value);
        var result = amountBox3 * (percentAmountBox3 / 100);
        if (!isNaN(amountBox3) && !isNaN(percentAmountBox3)) {
            document.getElementById("actualAmountBox3").value = result;
        }
    }
    function sum4() {
        var amountBox4 = parseInt(document.getElementById("amountBox4").value);
        var percentAmountBox4 = parseInt(document.getElementById("percentAmountBox4").value);
        var result = amountBox4 * (percentAmountBox4 / 100);
        if (!isNaN(amountBox4) && !isNaN(percentAmountBox4)) {
            document.getElementById("actualAmountBox4").value = result;
        }
    }
    function sum5() {
        var amountBox5 = parseInt(document.getElementById("amountBox5").value);
        var percentAmountBox5 = parseInt(document.getElementById("percentAmountBox5").value);
        var result = amountBox5 * (percentAmountBox5 / 100);
        if (!isNaN(amountBox5) && !isNaN(percentAmountBox5)) {
            document.getElementById("actualAmountBox5").value = result;
        }
    }
    function sum6() {
        var amountBox6 = parseInt(document.getElementById("amountBox6").value);
        var percentAmountBox6 = parseInt(document.getElementById("percentAmountBox6").value);
        var result = amountBox6 * (percentAmountBox6 / 100);
        if (!isNaN(amountBox6) && !isNaN(percentAmountBox6)) {
            document.getElementById("actualAmountBox6").value = result;
        }
    }





</script>

<div class="row">
    <div class="col-md-6">
        <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'code', 'error')} ">
            <label for="code">
                <g:message code="withHoldingTax.code.label" default="Code"/>

            </label>
            <g:textField name="code" value="${withHoldingTaxInstance?.code}"/><a type="button"
                                                                                 onclick="runCode()">Run code</a>
        </div>
    </div>

    <div class="col-md-6">
        <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'company', 'error')} ">
            <label for="company">
                <g:message code="withHoldingTax.company.label" default="Company"/>

            </label>
            %{--<g:select id="company" name="company.id" from="${sss.Company.list()}" optionKey="id" value="${withHoldingTaxInstance?.company?.id}" class="many-to-one" noSelection="['null': '=Select=']"/>--}%
            <g:select id="company" name="company.id" from="${sss.Company.list()}" optionKey="id"
                      value="${withHoldingTaxInstance?.company?.id ?: 1}" class="many-to-one"
                      noSelection="['null': '=Select=']"/>
        </div>
    </div>
</div>


<div class="row">
    <div class="col-md-6">
        <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'etc', 'error')} ">
            <label for="etc">
                <g:message code="withHoldingTax.etc.label" default="Etc"/>

            </label>
            <g:textField name="etc" value="${withHoldingTaxInstance?.etc}"/>
        </div>
    </div>

    <div class="col-md-6">
        <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'employee', 'error')} required">
            <label for="employee">
                <g:message code="withHoldingTax.employee.label" default="Employee"/>
                <span class="required-indicator">*</span>
            </label>
            <g:select id="employee" name="employee.id" from="${sss.Employee.list()}" optionKey="id" required=""
                      value="${withHoldingTaxInstance?.employee?.id}" class="many-to-one"
                      noSelection="['null': '=Select=']"/>
        </div>
    </div>
</div>

<div class="row" style="margin-top: 30px;">
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-2"><strong>Box</strong></div>

            <div class="col-md-4"><strong>Date</strong></div>

            <div class="col-md-2"><strong>Amount</strong></div>

            <div class="col-md-2"><strong>Percent Amount</strong></div>

            <div class="col-md-2"><strong>Actual Amount</strong></div>
        </div>
        %{-- Box 1 --}%
        <div class="row">
            <div class="col-md-2">1</div>

            <div class="col-md-4">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'dateBox1', 'error')} ">
                    <input type="checkbox" name="checkboxDate1" onclick="FillDate(this.form)">
                    <g:datePicker name="dateBox1" precision="day" value="${withHoldingTaxInstance?.dateBox1}"
                                  default="none" noSelection="['': '']"/>
                    %{--<g:textField name="dateBox1" precision="day" value="${withHoldingTaxInstance?.dateBox1}" class="mk-datepicker" />--}%
                </div>
            </div>

            <div class="col-md-2">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'amountBox1', 'error')} ">
                    <g:field name="amountBox1" value="${fieldValue(bean: withHoldingTaxInstance, field: 'amountBox1')}"
                             onchange="sum1()" class="input-with-full"/>
                </div>
            </div>

            <div class="col-md-2">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'percentAmountBox1', 'error')} ">
                    <g:field name="percentAmountBox1"
                             value="${fieldValue(bean: withHoldingTaxInstance, field: 'percentAmountBox1')}"
                             onchange="sum1()" class="input-with-full"/>
                </div>
            </div>

            <div class="col-md-2">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'actualAmountBox1', 'error')} ">
                    <g:field name="actualAmountBox1"
                             value="${fieldValue(bean: withHoldingTaxInstance, field: 'actualAmountBox1')}"
                             class="input-with-full"/>
                </div>
            </div>
        </div>
        %{-- Box 2 --}%
        <div class="row">
            <div class="col-md-2">2</div>

            <div class="col-md-4">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'dateBox2', 'error')} ">
                    <input type="checkbox" name="checkboxDate2" onclick="FillDate(this.form)">
                    %{--<input type="date" name="dateBox2" precision="day"  value="${withHoldingTaxInstance?.dateBox2}" default="none" noSelection="['': '']" />--}%
                    <g:datePicker name="dateBox2" precision="day" value="${withHoldingTaxInstance?.dateBox2}"
                                  default="none" noSelection="['': '']"/>
                    %{--<g:textField name="dateBox2" precision="day" value="${withHoldingTaxInstance?.dateBox2}" class="mk-datepicker" />--}%
                </div>
            </div>

            <div class="col-md-2">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'amountBox2', 'error')} ">
                    <g:field name="amountBox2" value="${fieldValue(bean: withHoldingTaxInstance, field: 'amountBox2')}"
                             onchange="sum2()" class="input-with-full"/>
                </div>
            </div>

            <div class="col-md-2">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'percentAmountBox2', 'error')} ">
                    <g:field name="percentAmountBox2"
                             value="${fieldValue(bean: withHoldingTaxInstance, field: 'percentAmountBox2')}"
                             onchange="sum2()" class="input-with-full"/>
                </div>
            </div>

            <div class="col-md-2">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'actualAmountBox2', 'error')} ">
                    <g:field name="actualAmountBox2"
                             value="${fieldValue(bean: withHoldingTaxInstance, field: 'actualAmountBox2')}"
                             class="input-with-full"/>
                </div>
            </div>
        </div>
        %{-- Box 3 --}%
        <div class="row">
            <div class="col-md-2">3</div>

            <div class="col-md-4">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'dateBox3', 'error')} ">
                    <input type="checkbox" name="checkboxDate3" onclick="FillDate(this.form)">
                    <g:datePicker name="dateBox3" precision="day" value="${withHoldingTaxInstance?.dateBox3}"
                                  default="none" noSelection="['': '']"/>
                    %{--<g:textField name="dateBox3" value="${withHoldingTaxInstance?.dateBox3}" class="mk-datepicker" />--}%
                </div>
            </div>

            <div class="col-md-2">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'amountBox3', 'error')} ">
                    <g:field name="amountBox3" value="${fieldValue(bean: withHoldingTaxInstance, field: 'amountBox3')}"
                             onchange="sum3()" class="input-with-full"/>
                </div>
            </div>

            <div class="col-md-2">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'percentAmountBox3', 'error')} ">
                    <g:field name="percentAmountBox3"
                             value="${fieldValue(bean: withHoldingTaxInstance, field: 'percentAmountBox3')}"
                             onchange="sum3()" class="input-with-full"/>
                </div>
            </div>

            <div class="col-md-2">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'actualAmountBox3', 'error')} ">
                    <g:field name="actualAmountBox3"
                             value="${fieldValue(bean: withHoldingTaxInstance, field: 'actualAmountBox3')}"
                             class="input-with-full"/>
                </div>
            </div>
        </div>
        %{-- Box 4 --}%
        <div class="row">
            <div class="col-md-2">4</div>

            <div class="col-md-4">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'dateBox4', 'error')} ">
                    <input type="checkbox" name="checkboxDate4" onclick="FillDate(this.form)">
                    <g:datePicker name="dateBox4" precision="day" value="${withHoldingTaxInstance?.dateBox4}"
                                  default="none" noSelection="['': '']"/>
                    %{--<g:textField name="dateBox4" value="${withHoldingTaxInstance?.dateBox4}" class="mk-datepicker" />--}%
                </div>
            </div>

            <div class="col-md-2">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'amountBox4', 'error')} ">
                    <g:field name="amountBox4" value="${fieldValue(bean: withHoldingTaxInstance, field: 'amountBox4')}"
                             onchange="sum4()" class="input-with-full"/>
                </div>
            </div>

            <div class="col-md-2">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'percentAmountBox4', 'error')} ">
                    <g:field name="percentAmountBox4"
                             value="${fieldValue(bean: withHoldingTaxInstance, field: 'percentAmountBox4')}"
                             onchange="sum4()" class="input-with-full"/>
                </div>
            </div>

            <div class="col-md-2">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'actualAmountBox4', 'error')} ">
                    <g:field name="actualAmountBox4"
                             value="${fieldValue(bean: withHoldingTaxInstance, field: 'actualAmountBox4')}"
                             class="input-with-full"/>
                </div>
            </div>
        </div>
        %{-- Box 5 --}%
        <div class="row">
            <div class="col-md-2">5</div>

            <div class="col-md-4">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'dateBox5', 'error')} ">
                    <input type="checkbox" name="checkboxDate5" onclick="FillDate(this.form)">
                    <g:datePicker name="dateBox5" precision="day" value="${withHoldingTaxInstance?.dateBox5}"
                                  default="none" noSelection="['': '']"/>
                    %{--<g:textField name="dateBox5" value="${withHoldingTaxInstance?.dateBox5}" class="mk-datepicker" />--}%
                </div>
            </div>

            <div class="col-md-2">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'amountBox5', 'error')} ">
                    <g:field name="amountBox5" value="${fieldValue(bean: withHoldingTaxInstance, field: 'amountBox5')}"
                             onchange="sum5()" class="input-with-full"/>
                </div>
            </div>

            <div class="col-md-2">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'percentAmountBox5', 'error')} ">
                    <g:field name="percentAmountBox5"
                             value="${fieldValue(bean: withHoldingTaxInstance, field: 'percentAmountBox5')}"
                             onchange="sum5()" class="input-with-full"/>
                </div>
            </div>

            <div class="col-md-2">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'actualAmountBox5', 'error')} ">
                    <g:field name="actualAmountBox5"
                             value="${fieldValue(bean: withHoldingTaxInstance, field: 'actualAmountBox5')}"
                             class="input-with-full"/>
                </div>
            </div>
        </div>
        %{-- Box 6 --}%
        <div class="row">
            <div class="col-md-2">6</div>

            <div class="col-md-4">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'dateBox6', 'error')} ">
                    <input type="checkbox" name="checkboxDate6" onclick="FillDate(this.form)">
                    <g:datePicker name="dateBox6" precision="day" value="${withHoldingTaxInstance?.dateBox6}"
                                  default="none" noSelection="['': '']"/>
                    %{--<g:textField name="dateBox6" value="${withHoldingTaxInstance?.dateBox6}" class="mk-datepicker" />--}%
                </div>
            </div>

            <div class="col-md-2">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'amountBox6', 'error')} ">
                    <g:field name="amountBox6" value="${fieldValue(bean: withHoldingTaxInstance, field: 'amountBox6')}"
                             onchange="sum6()" class="input-with-full"/>
                </div>
            </div>

            <div class="col-md-2">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'percentAmountBox6', 'error')} ">
                    <g:field name="percentAmountBox6"
                             value="${fieldValue(bean: withHoldingTaxInstance, field: 'percentAmountBox6')}"
                             onchange="sum6()" class="input-with-full"/>
                </div>
            </div>

            <div class="col-md-2">
                <div class="fieldcontain ${hasErrors(bean: withHoldingTaxInstance, field: 'actualAmountBox6', 'error')} ">
                    <g:field name="actualAmountBox6"
                             value="${fieldValue(bean: withHoldingTaxInstance, field: 'actualAmountBox6')}"
                             class="input-with-full"/>
                </div>
            </div>
        </div>
    </div>
    <script>
        function FillDate(f) {
            //if checked = true
            if (f.checkboxDate1.checked == true) {
                f.dateBox1_day.value = new Date().getDate();
                f.dateBox1_month.value = new Date().getMonth();
                f.dateBox1_year.value = new Date().getFullYear();

                f.amountBox1.value = 0;
                f.percentAmountBox1.value = 3;
                f.actualAmountBox1.value = 0;
            }
            else if (f.checkboxDate1.checked == false) {
                f.dateBox1_day.value = null;
                f.dateBox1_month.value = null;
                f.dateBox1_year.value = null;

                f.amountBox1.value = null;
                f.percentAmountBox1.value = null;
                f.actualAmountBox1.value = null;
            }
            if (f.checkboxDate2.checked == true) {
                f.dateBox2_day.value = new Date().getDate();
                f.dateBox2_month.value = new Date().getMonth();
                f.dateBox2_year.value = new Date().getFullYear();

                f.amountBox2.value = 0;
                f.percentAmountBox2.value = 3;
                f.actualAmountBox2.value = 0;
            }
            else if (f.checkboxDate2.checked == false) {
                f.dateBox2_day.value = null;
                f.dateBox2_month.value = null;
                f.dateBox2_year.value = null;

                f.amountBox2.value = null;
                f.percentAmountBox2.value = null;
                f.actualAmountBox2.value = null;
            }

            if (f.checkboxDate3.checked == true) {
                f.dateBox3_day.value = new Date().getDate();//	f.dateBox3_day.value = f.dateBox1_day.value;
                f.dateBox3_month.value = new Date().getMonth();//	f.dateBox3_month.value = f.dateBox1_month.value;
                f.dateBox3_year.value = new Date().getFullYear();//	f.dateBox3_year.value = f.dateBox1_year.value;

                f.amountBox3.value = 0;
                f.percentAmountBox3.value = 3;
                f.actualAmountBox3.value = 0;
            }
            else if (f.checkboxDate3.checked == false) {
                f.dateBox3_day.value = null;
                f.dateBox3_month.value = null;
                f.dateBox3_year.value = null;

                f.amountBox3.value = null;
                f.percentAmountBox3.value = null;
                f.actualAmountBox3.value = null;
            }
            if (f.checkboxDate4.checked == true) {
                f.dateBox4_day.value = new Date().getDate();
                f.dateBox4_month.value = new Date().getMonth();
                f.dateBox4_year.value = new Date().getFullYear();

                f.amountBox4.value = 0;
                f.percentAmountBox4.value = 3;
                f.actualAmountBox4.value = 0;
            }
            else if (f.checkboxDate4.checked == false) {
                f.dateBox4_day.value = null;
                f.dateBox4_month.value = null;
                f.dateBox4_year.value = null;

                f.amountBox4.value = null;
                f.percentAmountBox4.value = null;
                f.actualAmountBox4.value = null;
            }
            if (f.checkboxDate5.checked == true) {
                f.dateBox5_day.value = new Date().getDate();
                f.dateBox5_month.value = new Date().getMonth();
                f.dateBox5_year.value = new Date().getFullYear();

                f.amountBox5.value = 0;
                f.percentAmountBox5.value = 3;
                f.actualAmountBox5.value = 0;
            }
            else if (f.checkboxDate5.checked == false) {
                f.dateBox5_day.value = null;
                f.dateBox5_month.value = null;
                f.dateBox5_year.value = null;

                f.amountBox5.value = null;
                f.percentAmountBox5.value = null;
                f.actualAmountBox5.value = null;
            }
            if (f.checkboxDate6.checked == true) {
                f.dateBox6_day.value = new Date().getDate();
                f.dateBox6_month.value = new Date().getMonth();
                f.dateBox6_year.value = new Date().getFullYear();

                f.amountBox6.value = 0;
                f.percentAmountBox6.value = 3;
                f.actualAmountBox6.value = 0;
            }
            else if (f.checkboxDate6.checked == false) {
                f.dateBox6_day.value = null;
                f.dateBox6_month.value = null;
                f.dateBox6_year.value = null;

                f.amountBox6.value = null;
                f.percentAmountBox6.value = null;
                f.actualAmountBox6.value = null;
            }
        }

        function runCode() {
            var countData = ${withHoldingTaxInstance.count};
            var number = countData;
            var text = "000";
            if (number >= 1 && number < 10) {
                text = "000";
                code.value = "TX" + text + (number + 1);
            }
            else if (number >= 10 && number < 100) {
                text = "00";
                code.value = "TX" + text + (number + 1);
            }
            else if (number >= 100 && number < 1000) {
                text = "0";
                code.value = "TX" + text + (number + 1);
            }
            else if (number > 1000 && number < 10000) {
                code.value = "TX" + text + (number + 1);
            }
            else {
                code.value = "TX" + text + (number + 1);
            }
            //code.value = "TX";
        }

        window.onload(runCode())
    </script>
</div>

