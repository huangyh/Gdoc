package gdoc

import org.springframework.dao.DataIntegrityViolationException

class DocController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [docInstanceList: Doc.list(params), docInstanceTotal: Doc.count()]
    }

    def create() {
        [docInstance: new Doc(params)]
		
    }

    def save() {
        def docInstance = new Doc(params)
        if (!docInstance.save(flush: true)) {
            render(view: "create", model: [docInstance: docInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'doc.label', default: 'Doc'), docInstance.id])
        redirect(action: "show", id: docInstance.id)
    }

    def show(Long id) {
        def docInstance = Doc.get(id)
        if (!docInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'doc.label', default: 'Doc'), id])
            redirect(action: "list")
            return
        }

        [docInstance: docInstance]
    }

    def edit(Long id) {
        def docInstance = Doc.get(id)
        if (!docInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'doc.label', default: 'Doc'), id])
            redirect(action: "list")
            return
        }

        [docInstance: docInstance]
    }

    def update(Long id, Long version) {
        def docInstance = Doc.get(id)
        if (!docInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'doc.label', default: 'Doc'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (docInstance.version > version) {
                docInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'doc.label', default: 'Doc')] as Object[],
                          "Another user has updated this Doc while you were editing")
                render(view: "edit", model: [docInstance: docInstance])
                return
            }
        }

        docInstance.properties = params

        if (!docInstance.save(flush: true)) {
            render(view: "edit", model: [docInstance: docInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'doc.label', default: 'Doc'), docInstance.id])
        redirect(action: "show", id: docInstance.id)
    }

    def delete(Long id) {
        def docInstance = Doc.get(id)
        if (!docInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'doc.label', default: 'Doc'), id])
            redirect(action: "list")
            return
        }

        try {
            docInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'doc.label', default: 'Doc'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'doc.label', default: 'Doc'), id])
            redirect(action: "show", id: id)
        }
    }
}
