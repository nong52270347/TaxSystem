import com.company.*
import com.employee.*
import sss.Company
import sss.Employee

class BootStrap {

    def dataSource

    def init = { servletContext ->
        def company1 = new Company(
                code: "1234567890123"
                ,name: "SmartShift Co., Ltd"
                ,address: "IT Professional Building"
                ,taxId: "1234567890123"
        )
        if(!company1.save()){
            company1.errors.allErrors.each {error ->
                println "An error occurred with company1: " ${error}
            }
        }

        /*def emp1 = new Employee(
                code: "1629900192241"
                ,name: "Pornpot Potjanapatee"
                ,address: "370/194 Erawan Condo Bangkok 10140"
                ,idCard: "1629900192241"
        )
        if(!emp1.save()){
            emp1.errors.allErrors.each {error->
                println "An error occurred with emp1: " ${error}
            }
        }*/


        /*Sql sql = new Sql( dataSource )
        new File( "db_bootrap.sql" ).eachLine{ sql.executeInsert it }
        sql.commit()
        sql.close()*/
    }
    def destroy = {
    }
}
