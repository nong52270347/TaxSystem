package sss

class WithHoldingTax {
    String code
    Employee employee
    Company company
    String etc

    Date dateBox1
    BigDecimal amountBox1
    BigDecimal actualAmountBox1
    BigDecimal percentAmountBox1

    Date dateBox2
    BigDecimal amountBox2
    BigDecimal actualAmountBox2
    BigDecimal percentAmountBox2

    Date dateBox3
    BigDecimal amountBox3
    BigDecimal actualAmountBox3
    BigDecimal percentAmountBox3

    Date dateBox4
    BigDecimal amountBox4
    BigDecimal actualAmountBox4
    BigDecimal percentAmountBox4

    Date dateBox5
    BigDecimal amountBox5
    BigDecimal actualAmountBox5
    BigDecimal percentAmountBox5

    Date dateBox6
    BigDecimal amountBox6
    BigDecimal actualAmountBox6
    BigDecimal percentAmountBox6

    BigDecimal sumAmount
    BigDecimal sumActualAmount

    static constraints = {
        code nullable: false, unique: true
        //Box 1
        dateBox1 nullable: true
        amountBox1 nullable: true, min: 0.00
        actualAmountBox1 nullable: true, min: 0.00
        percentAmountBox1 nullable: true, min: 0.00, max:100.00
        //Box 2
        dateBox2 nullable: true
        amountBox2 nullable: true, min: 0.00
        actualAmountBox2 nullable: true, min: 0.00
        percentAmountBox2 nullable: true, min: 0.00, max:100.00
        //Box 3
        dateBox3 nullable: true
        amountBox3 nullable: true, min: 0.00
        actualAmountBox3 nullable: true, min: 0.00
        percentAmountBox3 nullable: true, min: 0.00, max:100.00
        //Box 4
        dateBox4 nullable: true
        amountBox4 nullable: true, min: 0.00
        actualAmountBox4 nullable: true, min: 0.00
        percentAmountBox4 nullable: true, min: 0.00, max:100.00
        //Box 5
        dateBox5 nullable: true
        amountBox5 nullable: true, min: 0.00
        actualAmountBox5 nullable: true, min: 0.00
        percentAmountBox5 nullable: true, min: 0.00, max:100.00
        //Box 6
        dateBox6 nullable: true
        amountBox6 nullable: true, min: 0.00
        actualAmountBox6 nullable: true, min: 0.00
        percentAmountBox6 nullable: true, min: 0.00, max:100.00

        employee nullable: false
        company nullable: true
        etc nullable: true

        sumAmount nullable: true, min: 0.00, scale:2
        sumActualAmount nullable: true, min: 0.00, scale:2

    }
}