package sss

import javassist.bytecode.ByteArray
import net.sf.jasperreports.engine.JasperCompileManager
import net.sf.jasperreports.engine.xml.JRXmlLoader
import org.springframework.dao.DataIntegrityViolationException
import util.ConvertFileNameUtils

import java.text.SimpleDateFormat

class WithHoldingTaxController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    ReportService reportService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        int countData = WithHoldingTax.count()

        int number = countData
        String text = "000"
        if (number >= 1 && number < 10) {
            text = "000"
            println("Data in database = " + countData + ", runNumber = " + text + (number + 1))
        } else if (number >= 10 && number < 100) {
            text = "00"
            println("Data in database = " + countData + ", runNumber = " + text + (number + 1))
        } else if (number >= 100 && number < 1000) {
            text = "0"
            println("Data in database = " + countData + ", runNumber = " + text + (number + 1))
        } else if (number > 1000 && number < 10000) {
            println("Data in database = " + countData + ", runNumber = " + text + (number + 1))
        } else {
            println("Data in database = " + countData + ", runNumber = " + text + (number + 1))
        }

        // Search Criteria
        def withHoldingTaxInstanceList = WithHoldingTax.createCriteria().list(params) {
            if (params.code) ilike('code', "%${params.code.trim()}%")
            if (params.company) {
                company {
                    if (params.company != 'null') eq('id', params.company.toLong())
                }
            }
            if (params.employee) {
                employee {
                    if (params.employee != 'null') eq('id', params.employee.toLong())
                }
            }
        }

        [withHoldingTaxInstanceList: withHoldingTaxInstanceList, withHoldingTaxInstanceTotal: withHoldingTaxInstanceList.totalCount]


    }

    def create() {
        /*int countData = WithHoldingTax.count()
        def runNumber
        int number = countData
        String text = "000"
        if (number >= 1 && number < 10) {
            text = "000"
            runNumber = text + (number + 1)
            println("Data in database = " + countData + ", runNumber = " + runNumber)
            [runNumber: runNumber]
        } else if (number >= 10 && number < 100) {
            text = "00"
            runNumber = text + (number + 1)
            println("Data in database = " + countData + ", runNumber = " + runNumber)
            [runNumber: runNumber]
        } else if (number >= 100 && number < 1000) {
            text = "0"
            runNumber = text + (number + 1)
            println("Data in database = " + countData + ", runNumber = " + runNumber)
            [runNumber: runNumber]
        } else if (number > 1000 && number < 10000) {
            runNumber = text + (number + 1)
            println("Data in database = " + countData + ", runNumber = " + runNumber)
            [runNumber: runNumber]
        } else {
            runNumber = (number + 1)
            println("Data in database = " + countData + ", runNumber = " + runNumber)
            [runNumber: runNumber]
        }
        [runNumber: runNumber]*/
        [withHoldingTaxInstance: new WithHoldingTax(params)]
    }

    def save() {
        def withHoldingTaxInstance = new WithHoldingTax(params)

        println "log : ${params.dateBox1}"

        withHoldingTaxInstance.sumAmount = checkZero(params.double('amountBox1')) +
                checkZero(params.double('amountBox2')) +
                checkZero(params.double('amountBox3')) +
                checkZero(params.double('amountBox4')) +
                checkZero(params.double('amountBox5')) +
                checkZero(params.double('amountBox6'))
        withHoldingTaxInstance.sumActualAmount = checkZero(params.double('actualAmountBox1')) +
                checkZero(params.double('actualAmountBox2')) +
                checkZero(params.double('actualAmountBox3')) +
                checkZero(params.double('actualAmountBox4')) +
                checkZero(params.double('actualAmountBox5')) +
                checkZero(params.double('actualAmountBox6'))

        if (!withHoldingTaxInstance.save(flush: true)) {
            render(view: "create", model: [withHoldingTaxInstance: withHoldingTaxInstance])
            return
        }
//        renderReport(withHoldingTaxInstance.id)
//
        flash.message = message(code: 'default.created.message', args: [message(code: 'withHoldingTax.label', default: 'WithHoldingTax'), withHoldingTaxInstance.id])
        redirect(action: "show", id: withHoldingTaxInstance.id)
    }

    def show(Long id) {
        def withHoldingTaxInstance = WithHoldingTax.get(id)
        if (!withHoldingTaxInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'withHoldingTax.label', default: 'WithHoldingTax'), id])
            redirect(action: "list")
            return
        }

        [withHoldingTaxInstance: withHoldingTaxInstance]
    }

    def edit(Long id) {
        def withHoldingTaxInstance = WithHoldingTax.get(id)
        if (!withHoldingTaxInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'withHoldingTax.label', default: 'WithHoldingTax'), id])
            redirect(action: "list")
            return
        }

        [withHoldingTaxInstance: withHoldingTaxInstance]
    }

    def update(Long id, Long version) {
        def withHoldingTaxInstance = WithHoldingTax.get(id)
        if (!withHoldingTaxInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'withHoldingTax.label', default: 'WithHoldingTax'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (withHoldingTaxInstance.version > version) {
                withHoldingTaxInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'withHoldingTax.label', default: 'WithHoldingTax')] as Object[],
                        "Another user has updated this WithHoldingTax while you were editing")
                render(view: "edit", model: [withHoldingTaxInstance: withHoldingTaxInstance])
                return
            }
        }


        withHoldingTaxInstance.properties = params

        if (!withHoldingTaxInstance.save(flush: true)) {
            render(view: "edit", model: [withHoldingTaxInstance: withHoldingTaxInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'withHoldingTax.label', default: 'WithHoldingTax'), withHoldingTaxInstance.id])
        redirect(action: "show", id: withHoldingTaxInstance.id)
    }

    def delete(Long id) {
        def withHoldingTaxInstance = WithHoldingTax.get(id)
        if (!withHoldingTaxInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'withHoldingTax.label', default: 'WithHoldingTax'), id])
            redirect(action: "list")
            return
        }

        try {
            withHoldingTaxInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'withHoldingTax.label', default: 'WithHoldingTax'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'withHoldingTax.label', default: 'WithHoldingTax'), id])
            redirect(action: "show", id: id)
        }
    }

    def renderReport(long id) {
        def emp = WithHoldingTax.findById(id)
        def dateSign = new Date()

        if (emp.dateBox1 == null) {
            emp.dateBox1 = null
        }
        if (emp.dateBox2 == null) {
            emp.dateBox2 = null
        }
        if (emp.dateBox3 == null) {
            emp.dateBox3 = null
        }
        if (emp.dateBox4 == null) {
            emp.dateBox4 = null
        }
        if (emp.dateBox5 == null) {
            emp.dateBox5 = null
        }
        if (emp.dateBox6 == null) {
            emp.dateBox6 = null
        }


        println emp.code + ", " + emp.employee.name
        println "date: " + dateSign.getDateString().substring(6,10)
        def year = dateSign.getDateString().substring(6,10)
        //Date dated = new SimpleDateFormat('dd/MM/yyyy').format(emp.date)
        def parameters = new HashMap()
        String reportPath = "/WEB-INF/reports/PayPndFifty.jrxml"

        parameters.put("imageBg", servletContext.getRealPath("/WEB-INF/reports/").replace("\\", "/").concat("/"))
        parameters.put("code", emp.code)
        parameters.put("year", year)
        parameters.put("companyName", emp.company.name)
        parameters.put("companyAddress", emp.company.address)
        parameters.put("companyTaxId", emp.company.taxId)
        parameters.put("empName", emp.employee.name)
        parameters.put("empAddress", emp.employee.address)
        parameters.put("empIdNo", emp.employee.idCard)
        parameters.put("origAmount1", emp.actualAmountBox1)         //Box1
        println("origAmount1:" + emp.actualAmountBox1 + " type:" + emp.actualAmountBox1.getClass())
        parameters.put("refAmount1", emp.amountBox1)
        parameters.put("date1", emp.dateBox1)

        parameters.put("origAmount2", emp.actualAmountBox2)         //Box2
        parameters.put("refAmount2", emp.amountBox2)
        parameters.put("date2", emp.dateBox2)
        parameters.put("origAmount3", emp.actualAmountBox3)         //Box3
        parameters.put("refAmount3", emp.amountBox3)
        parameters.put("date3", emp.dateBox3)
        parameters.put("origAmount4", emp.actualAmountBox4)         //Box4
        parameters.put("refAmount4", emp.amountBox4)
        parameters.put("date4", emp.dateBox4)
        parameters.put("origAmount5", emp.actualAmountBox5)         //Box5
        parameters.put("refAmount5", emp.amountBox5)
        parameters.put("date5", emp.dateBox5)
        parameters.put("origAmount6", emp.actualAmountBox6)         //Box6
        parameters.put("refAmount6", emp.amountBox6)
        parameters.put("date6", emp.dateBox6)
        parameters.put("dateSign", dateSign)

        //Transform null values to 0 to calculate sum value
        if (emp.actualAmountBox1 == null) {
            emp.actualAmountBox1 = 0
        }
        if (emp.actualAmountBox2 == null) {
            emp.actualAmountBox2 = 0
        }
        if (emp.actualAmountBox3 == null) {
            emp.actualAmountBox3 = 0
        }
        if (emp.actualAmountBox4 == null) {
            emp.actualAmountBox4 = 0
        }
        if (emp.actualAmountBox5 == null) {
            emp.actualAmountBox5 = 0
        }
        if (emp.actualAmountBox6 == null) {
            emp.actualAmountBox6 = 0
        }

        if (emp.amountBox1 == null) {
            emp.amountBox1 = 0
        }
        if (emp.amountBox2 == null) {
            emp.amountBox2 = 0
        }
        if (emp.amountBox3 == null) {
            emp.amountBox3 = 0
        }
        if (emp.amountBox4 == null) {
            emp.amountBox4 = 0
        }
        if (emp.amountBox5 == null) {
            emp.amountBox5 = 0
        }
        if (emp.amountBox6 == null) {
            emp.amountBox6 = 0
        }
        // Sum value to send to sumOrigAmount
        def sumOrigAmount = (
                emp.actualAmountBox1 +
                        emp.actualAmountBox2 +
                        emp.actualAmountBox3 +
                        emp.actualAmountBox4 +
                        emp.actualAmountBox5 +
                        emp.actualAmountBox6)

        def sumRefAmount = (
                emp.amountBox1 +
                        emp.amountBox2 +
                        emp.amountBox3 +
                        emp.amountBox4 +
                        emp.amountBox5 +
                        emp.amountBox6)
        parameters.put("sumOrigAmount", sumOrigAmount)
        parameters.put("sumRefAmount", sumRefAmount)
        parameters.put("etc", emp.etc ?: '')

        //Transform value 0 turn back to null value in the past back to avoid printing 0 value into pdf.
        if (emp.actualAmountBox1 == 0) {
            emp.actualAmountBox1 = null
        }
        if (emp.actualAmountBox2 == 0) {
            emp.actualAmountBox2 = null
        }
        if (emp.actualAmountBox3 == 0) {
            emp.actualAmountBox3 = null
        }
        if (emp.actualAmountBox4 == 0) {
            emp.actualAmountBox4 = null
        }
        if (emp.actualAmountBox5 == 0) {
            emp.actualAmountBox5 = null
        }
        if (emp.actualAmountBox6 == 0) {
            emp.actualAmountBox6 = null
        }

        if (emp.amountBox1 == 0) {
            emp.amountBox1 = null
        }
        if (emp.amountBox2 == 0) {
            emp.amountBox2 = null
        }
        if (emp.amountBox3 == 0) {
            emp.amountBox3 = null
        }
        if (emp.amountBox4 == 0) {
            emp.amountBox4 = null
        }
        if (emp.amountBox5 == 0) {
            emp.amountBox5 = null
        }
        if (emp.amountBox6 == 0) {
            emp.amountBox6 = null
        }

        def reportName = ConvertFileNameUtils.toThai('withHoldingTax.pdf')
        def pdf = reportService.exportJasperDesignAsPdf(reportPath, parameters, reportName, null)
        return reportService.exportPdfToResponse(pdf, response, reportName)

        println()



        //redirect(action: "list")
    }

    protected double checkZero(value) {
        return value ?: 0;
    }

    def renderReports(WithHoldingTax withHoldingTax) {
        try {
            withHoldingTax.save(flush: true, failOnError: true)
            HashMap parameters = new HashMap()

            def emp = withHoldingTax
            println withHoldingTax.id
            def reportName = ConvertFileNameUtils.toThai("report.pdf")

            //def emp = WithHoldingTax.findById(id)
            def dateSign = new Date()

            if (emp.dateBox1 == null) {
//            emp.dateBox1 = new Date()
                emp.dateBox1 = null
            }
            if (emp.dateBox2 == null) {
                emp.dateBox2 = null
            }
            if (emp.dateBox3 == null) {
                emp.dateBox3 = null
            }
            if (emp.dateBox4 == null) {
                emp.dateBox4 = null
            }
            if (emp.dateBox5 == null) {
                emp.dateBox5 = null
            }
            if (emp.dateBox6 == null) {
                emp.dateBox6 = null
            }


            println "000000" + emp.employee.name
            println "date: " + dateSign.getDateString().substring(6,10)
            def year = dateSign.getDateString().substring(6,10)
            //Date dated = new SimpleDateFormat('dd/MM/yyyy').format(emp.date)
            //def parameters = new HashMap()
            String reportPath = "/WEB-INF/reports/PayPndFifty.jrxml"

            parameters.put("imageBg", servletContext.getRealPath("/WEB-INF/reports/").replace("\\", "/").concat("/"))
            parameters.put("companyName", emp.company.name)
            parameters.put("code", emp.code)
            parameters.put("year", year)
            parameters.put("companyAddress", emp.company.address)
            parameters.put("companyTaxId", emp.company.taxId)
            parameters.put("empName", emp.employee.name)
            parameters.put("empAddress", emp.employee.address)
            parameters.put("empIdNo", emp.employee.idCard)
            parameters.put("origAmount1", emp.actualAmountBox1)         //Box1
            println("origAmount1:" + emp.actualAmountBox1 + " type:" + emp.actualAmountBox1.getClass())
            parameters.put("refAmount1", emp.amountBox1)
            parameters.put("date1", emp.dateBox1)

            parameters.put("origAmount2", emp.actualAmountBox2)         //Box2
            parameters.put("refAmount2", emp.amountBox2)
            parameters.put("date2", emp.dateBox2)
            parameters.put("origAmount3", emp.actualAmountBox3)         //Box3
            parameters.put("refAmount3", emp.amountBox3)
            parameters.put("date3", emp.dateBox3)
            parameters.put("origAmount4", emp.actualAmountBox4)         //Box4
            parameters.put("refAmount4", emp.amountBox4)
            parameters.put("date4", emp.dateBox4)
            parameters.put("origAmount5", emp.actualAmountBox5)         //Box5
            parameters.put("refAmount5", emp.amountBox5)
            parameters.put("date5", emp.dateBox5)
            parameters.put("origAmount6", emp.actualAmountBox6)         //Box6
            parameters.put("refAmount6", emp.amountBox6)
            parameters.put("date6", emp.dateBox6)
            parameters.put("dateSign", dateSign)

            //Transform null values to 0 to calculate sum value
            if (emp.actualAmountBox1 == null) {
                emp.actualAmountBox1 = 0
            }
            if (emp.actualAmountBox2 == null) {
                emp.actualAmountBox2 = 0
            }
            if (emp.actualAmountBox3 == null) {
                emp.actualAmountBox3 = 0
            }
            if (emp.actualAmountBox4 == null) {
                emp.actualAmountBox4 = 0
            }
            if (emp.actualAmountBox5 == null) {
                emp.actualAmountBox5 = 0
            }
            if (emp.actualAmountBox6 == null) {
                emp.actualAmountBox6 = 0
            }

            if (emp.amountBox1 == null) {
                emp.amountBox1 = 0
            }
            if (emp.amountBox2 == null) {
                emp.amountBox2 = 0
            }
            if (emp.amountBox3 == null) {
                emp.amountBox3 = 0
            }
            if (emp.amountBox4 == null) {
                emp.amountBox4 = 0
            }
            if (emp.amountBox5 == null) {
                emp.amountBox5 = 0
            }
            if (emp.amountBox6 == null) {
                emp.amountBox6 = 0
            }
            // Sum value to send to sumOrigAmount
            def sumOrigAmount = (
                    emp.actualAmountBox1 +
                            emp.actualAmountBox2 +
                            emp.actualAmountBox3 +
                            emp.actualAmountBox4 +
                            emp.actualAmountBox5 +
                            emp.actualAmountBox6)

            def sumRefAmount = (
                    emp.amountBox1 +
                            emp.amountBox2 +
                            emp.amountBox3 +
                            emp.amountBox4 +
                            emp.amountBox5 +
                            emp.amountBox6)
            parameters.put("sumOrigAmount", sumOrigAmount)
            parameters.put("sumRefAmount", sumRefAmount)
            parameters.put("etc", emp.etc ?: '')

            //Transform null value in the past back to null value to avoid print pdf to show zero
            if (emp.actualAmountBox1 == 0) {
                emp.actualAmountBox1 = null
            }
            if (emp.actualAmountBox2 == 0) {
                emp.actualAmountBox2 = null
            }
            if (emp.actualAmountBox3 == 0) {
                emp.actualAmountBox3 = null
            }
            if (emp.actualAmountBox4 == 0) {
                emp.actualAmountBox4 = null
            }
            if (emp.actualAmountBox5 == 0) {
                emp.actualAmountBox5 = null
            }
            if (emp.actualAmountBox6 == 0) {
                emp.actualAmountBox6 = null
            }

            if (emp.amountBox1 == 0) {
                emp.amountBox1 = null
            }
            if (emp.amountBox2 == 0) {
                emp.amountBox2 = null
            }
            if (emp.amountBox3 == 0) {
                emp.amountBox3 = null
            }
            if (emp.amountBox4 == 0) {
                emp.amountBox4 = null
            }
            if (emp.amountBox5 == 0) {
                emp.amountBox5 = null
            }
            if (emp.amountBox6 == 0) {
                emp.amountBox6 = null
            }

            //def reportName = ConvertFileNameUtils.toThai('withHoldingTax.pdf')

//            def pdf = reportService.exportJasperDesignAsPdf(reportPath, parameters, reportName, null)
//            reportService.exportPdfToResponse(pdf, response, reportName)
            return reportService.exportJasperDesignAsPdf(reportPath, parameters, reportName, null)
        }
        catch (Exception e){
            log.error(e.message, e)
            flash.message = e.message
        }
        //redirect(action: "list")
    }

    def printReportList() {
        println "xxxxxxx "+params
        def reportName = ConvertFileNameUtils.toThai('tax.pdf')
//        def idValues = ('1'..'2')
        def withHoldingTaxIds = params.reportIds?.split(',')?.collect { it as Long }//params.withHoldingTaxIds?.split(',')?.collect { it as Long }
//        println("### params.withHoldingTaxIds: " + idValues + " ###")
//        withHoldingTaxIds.each { it ->
//            def withHoldingTax = WithHoldingTax.get(it)
//            println(' -->>> '+withHoldingTax.code)
//        }
        def pdfs = []
        try {
            withHoldingTaxIds?.each { id ->
                def withHoldingTax = WithHoldingTax.get(id)
                println("id = " + id)

                if (withHoldingTax) {
                    pdfs += renderReports(withHoldingTax)
                }
            }
        } catch (Exception e) {
            e.printStackTrace()
            flash.errors = e.message
        }
        if (pdfs) {
            reportService.mergePdfs(pdfs, reportName, response)
        } else {
            redirect action: 'index'
        }

    }

}
