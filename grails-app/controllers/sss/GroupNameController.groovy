package sss

import org.springframework.dao.DataIntegrityViolationException

class GroupNameController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [groupNameInstanceList: GroupName.list(params), groupNameInstanceTotal: GroupName.count()]
    }

    def create() {
        [groupNameInstance: new GroupName(params)]
    }

    def save() {
        def groupNameInstance = new GroupName(params)
        if (!groupNameInstance.save(flush: true)) {
            render(view: "create", model: [groupNameInstance: groupNameInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'groupName.label', default: 'GroupName'), groupNameInstance.id])
        redirect(action: "show", id: groupNameInstance.id)
    }

    def show(Long id) {
        def groupNameInstance = GroupName.get(id)
        if (!groupNameInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupName.label', default: 'GroupName'), id])
            redirect(action: "list")
            return
        }

        [groupNameInstance: groupNameInstance]
    }

    def edit(Long id) {
        def groupNameInstance = GroupName.get(id)
        if (!groupNameInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupName.label', default: 'GroupName'), id])
            redirect(action: "list")
            return
        }

        [groupNameInstance: groupNameInstance]
    }

    def update(Long id, Long version) {
        def groupNameInstance = GroupName.get(id)
        if (!groupNameInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupName.label', default: 'GroupName'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (groupNameInstance.version > version) {
                groupNameInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'groupName.label', default: 'GroupName')] as Object[],
                          "Another user has updated this GroupName while you were editing")
                render(view: "edit", model: [groupNameInstance: groupNameInstance])
                return
            }
        }

        groupNameInstance.properties = params

        if (!groupNameInstance.save(flush: true)) {
            render(view: "edit", model: [groupNameInstance: groupNameInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'groupName.label', default: 'GroupName'), groupNameInstance.id])
        redirect(action: "show", id: groupNameInstance.id)
    }

    def delete(Long id) {
        def groupNameInstance = GroupName.get(id)
        if (!groupNameInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupName.label', default: 'GroupName'), id])
            redirect(action: "list")
            return
        }

        try {
            groupNameInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'groupName.label', default: 'GroupName'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'groupName.label', default: 'GroupName'), id])
            redirect(action: "show", id: id)
        }
    }
}
