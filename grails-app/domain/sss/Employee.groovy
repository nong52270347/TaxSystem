package sss

class Employee {
  String code
  String name
  String nickName
  String address
  String idCard
  static hasMany = [groupName: GroupName]

  static constraints = {
    code blank: false, nullable: false, unique: false
    name blank: false, nullable: false
    nickName blank: true, nullable: true
    address blank: false, nullable: false
    idCard blank: false, nullable: false, minSize: 13, maxSize: 13, unique: true
    groupName blank:true, nullable: true
  }

  String toString() { code.toString()+' '+name.toString() +' '+ nickName.toString()}
}
