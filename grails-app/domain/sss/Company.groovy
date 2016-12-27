package sss

class Company {

  String code
  String name
  String address
  String taxId

  static constraints = {
    code blank: false, nullable: false, unique: false
    name blank: false, nullable: false
    address blank: false, nullable: false
    taxId blank: false, nullable: false, minSize: 13, maxSize: 13, unique: false
  }

  String toString() { code.toString()+' '+name.toString() }
}
