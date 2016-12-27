package sss

class GroupName {

    String groupName
    static constraints = {
        groupName blank: false, nullable: false
    }

    String toString(){
        groupName
    }
}
