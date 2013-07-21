package easyui

import org.springframework.dao.DataIntegrityViolationException

class DeptController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	
	
	
	

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [deptInstanceList: Dept.list(params), deptInstanceTotal: Dept.count()]
    }

    def create() {
        [deptInstance: new Dept(params)]
    }

    def save() {
        def deptInstance = new Dept(params)
        if (!deptInstance.save(flush: true)) {
            render(view: "create", model: [deptInstance: deptInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'dept.label', default: 'Dept'), deptInstance.id])
        redirect(action: "show", id: deptInstance.id)
    }

    def show(Long id) {
        def deptInstance = Dept.get(id)
        if (!deptInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dept.label', default: 'Dept'), id])
            redirect(action: "list")
            return
        }

        [deptInstance: deptInstance]
    }

    def edit(Long id) {
        def deptInstance = Dept.get(id)
        if (!deptInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dept.label', default: 'Dept'), id])
            redirect(action: "list")
            return
        }

        [deptInstance: deptInstance]
    }

    def update(Long id, Long version) {
        def deptInstance = Dept.get(id)
        if (!deptInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dept.label', default: 'Dept'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (deptInstance.version > version) {
                deptInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'dept.label', default: 'Dept')] as Object[],
                          "Another user has updated this Dept while you were editing")
                render(view: "edit", model: [deptInstance: deptInstance])
                return
            }
        }

        deptInstance.properties = params

        if (!deptInstance.save(flush: true)) {
            render(view: "edit", model: [deptInstance: deptInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'dept.label', default: 'Dept'), deptInstance.id])
        redirect(action: "show", id: deptInstance.id)
    }

    def delete(Long id) {
        def deptInstance = Dept.get(id)
        if (!deptInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dept.label', default: 'Dept'), id])
            redirect(action: "list")
            return
        }

        try {
            deptInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'dept.label', default: 'Dept'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'dept.label', default: 'Dept'), id])
            redirect(action: "show", id: id)
        }
    }
}
