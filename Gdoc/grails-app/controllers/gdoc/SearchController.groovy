package gdoc
import gdoc.Doc
class SearchController {
	
	
	def beforeInterceptor = [action:this.&auth]
	def auth() {
		if(!session.user) {
			flash.message = "登录后才能操作！"
			redirect(controller:"User", action:"login")
			return false
		}
	}
	
	
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "search", params: params)
     }
   
	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		[docInstanceList: Doc.list(params), docInstanceTotal: Doc.count()]
		
	 }
   
	def search = {	
		def docInstance = new Doc(params)
		[docInstance: docInstance]
		}
	
	def result(Integer max) {
		params.max = Math.min(max?: 10, 100)
		def criteria = Doc.createCriteria()
		
		def deptsl = criteria.list(max:params.max){
			eq("orgs","${session.user.orgs}")
			eq("username","${session.user.username}")
			eq("share","${params.share}")
			eq("categorys","${params.categorys}")
		
			between("dateCreated",params.startDate,params.lastDate)
			order("dateCreated","desc")
			}
		render (view:'list',model:[docInstanceList:deptsl, docInstanceTotal: deptsl.getTotalCount()])
		
	}
	
}
