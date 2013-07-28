package gdoc

import org.springframework.dao.DataIntegrityViolationException

class UserController {
	
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
	
	def login = {}
	
	def logout = {
		flash.message = "再见， ${session.user.username}"
		session.user = null
		redirect(action:"login")
	}
	
	def authenticate = {
		def user = User.findByUserIdAndPassword(params.userId, params.password)
		if(user){
		session.user = user
		flash.message = "您好！ ${user.username}"
		if (user.admin){
		redirect(controller:"user",action:"list")
		}else{
		redirect(controller:"doc", action:"usernameList")
		}
		}else{
		flash.message = "对不起, ${params.userId}. 请再试一次。"
		redirect(action:"login")
		}
	}
	
	def rePassword = {
		if (!session.user){
			flash.message = "没有登录不可以修改密码！"
			redirect(controller:"user",action:"login")
			return false
			}
		
		if (session.user.userId != params.userId || session.user.password != params.password){
			flash.message = "请输入正确的登录名和密码。"
			return false
		}
		if (params.newpassword != params.agpassword){
			flash.message = " 两次输入的密码不相同，请重新输入。"
			return false		
		}
		def user = User.findByUserIdAndPassword(params.userId, params.password)
		if(user){
		user.password = params.newpassword
		user.save()
		session.user = null
		flash.message = "密码已成功修改，请用新密码重新登陆。"
		redirect(controller:"user", action:"login")
		}
	}	
	

	def listByOrg = {
		assert null != params.id
		   params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
		   render g.select(optionKey:"id", from:Dept.findAllByOrgs( Org.get(params.id), params), name:"depts.id")
	   }


    def list(Integer max) {
		
        params.max = Math.min(max ?: 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def create() {
        [userInstance: new User(params)]
    }

    def save() {
        def userInstance = new User(params)
        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def show(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def edit(Long id) {
        def userInstance = User.get(id)
		if (userInstance.username != session.user.username && userInstance.roles != "管理员"){
			flash.message = "只有本人或管理员才能修改文档！"
			redirect(action: "list")
			return
		}
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def update(Long id, Long version) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def delete(Long id) {
        def userInstance = User.get(id)
		if (userInstance.username != session.user.username && userInstance.username != "管理员"){
			flash.message = "只有本人或管理员才能修改文档！"
			redirect(action: "list")
			return
		}
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "show", id: id)
        }
    }
}
