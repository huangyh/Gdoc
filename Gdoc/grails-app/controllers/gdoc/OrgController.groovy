package gdoc

import org.springframework.dao.DataIntegrityViolationException

class OrgController {
	
	def beforeInterceptor = [action:this.&auth,except:['login', 'logout', 'authenticate','rePassword']]
	
	def auth() {
		if(!session.user) {
			flash.message = "登录后才能操作！"
			redirect(controller:"User", action:"login")
			return false
		}
		
		if(session.user.roles != "管理员"){
			flash.message = "管理员才能操作！"
			redirect(controller:"User", action:"login")
			return false
		}
	
	}

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [orgInstanceList: Org.list(params), orgInstanceTotal: Org.count()]
    }

    def create() {
        [orgInstance: new Org(params)]
    }

    def save() {
        def orgInstance = new Org(params)
        if (!orgInstance.save(flush: true)) {
            render(view: "create", model: [orgInstance: orgInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'org.label', default: 'Org'), orgInstance.id])
        redirect(action: "show", id: orgInstance.id)
    }

    def show(Long id) {
        def orgInstance = Org.get(id)
        if (!orgInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'org.label', default: 'Org'), id])
            redirect(action: "list")
            return
        }

        [orgInstance: orgInstance]
    }

    def edit(Long id) {
        def orgInstance = Org.get(id)
        if (!orgInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'org.label', default: 'Org'), id])
            redirect(action: "list")
            return
        }

        [orgInstance: orgInstance]
    }

    def update(Long id, Long version) {
        def orgInstance = Org.get(id)
        if (!orgInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'org.label', default: 'Org'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (orgInstance.version > version) {
                orgInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'org.label', default: 'Org')] as Object[],
                          "Another user has updated this Org while you were editing")
                render(view: "edit", model: [orgInstance: orgInstance])
                return
            }
        }

        orgInstance.properties = params

        if (!orgInstance.save(flush: true)) {
            render(view: "edit", model: [orgInstance: orgInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'org.label', default: 'Org'), orgInstance.id])
        redirect(action: "show", id: orgInstance.id)
    }

    def delete(Long id) {
        def orgInstance = Org.get(id)
        if (!orgInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'org.label', default: 'Org'), id])
            redirect(action: "list")
            return
        }

        try {
            orgInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'org.label', default: 'Org'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'org.label', default: 'Org'), id])
            redirect(action: "show", id: id)
        }
    }
}
