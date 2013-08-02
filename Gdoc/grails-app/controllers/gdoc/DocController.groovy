package gdoc

import org.springframework.dao.DataIntegrityViolationException

class DocController {
	
	def beforeInterceptor = [action:this.&auth]
	def auth() {
		if(!session.user) {
			flash.message = "登录后才能操作！"
			redirect(controller:"User", action:"login")
			return false
		}
	}
	
	static navigation = [
		[group:'tabs1',
		action:'create', title: '上传文档', order: 0],
		[action:'list', title: '全部文档', order: 1],
		[action:'usernameList', title: '本人上传', order: 2],
		[action:'privateList', title: '私有', order: 3],
		[action: 'deptsList', title: '本部门', order: 4],
		[action: 'orgsList', title: '本单位', order: 5],
		[action: 'publicList', title: '本系统', order: 6]
		
	
		]


    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
	
		if (session.user.roles != "管理员"){
			flash.message = "只有管理员才能查看全部文档！"
			redirect(action: "usernameList")
			return
		}
        params.max = Math.min(max ?: 10, 100)
		[docInstanceList: Doc.list(params), docInstanceTotal: Doc.count()]
	
	 }
	
	def usernameList(Integer max){
		
		params.max = Math.min(max ?: 10, 100)
		def criteria = Doc.createCriteria()

		def deptsl = criteria.list(max:params.max){
			eq("username","${session.user.username}")
			eq("orgs","${session.user.orgs}")
			order("dateCreated","desc")
			}
		render (view:'list', model:[docInstanceList:deptsl, docInstanceTotal: deptsl.getTotalCount()])
		
	}
	
	def privateList(Integer max){
		
		params.max = Math.min(max ?: 10, 100)
		def criteria = Doc.createCriteria()

		def deptsl = criteria.list(max:params.max){
			eq("username","${session.user.username}")
			eq("orgs","${session.user.orgs}")
			eq("share","私有")
			order("dateCreated","desc")
			}
		render (view:'list', model:[docInstanceList:deptsl, docInstanceTotal: deptsl.getTotalCount()])
	}
	
	def deptsList(Integer max){
		
		params.max = Math.min(max ?: 10, 100)
		def criteria = Doc.createCriteria()

		def deptsl = criteria.list(max:params.max){
			eq("depts","${session.user.depts}")
			eq("orgs","${session.user.orgs}")
			eq("share","本部门")
			order("dateCreated","desc")
			}
		render (view:'list',model:[docInstanceList:deptsl, docInstanceTotal: deptsl.getTotalCount()])
	}

	def orgsList(Integer max){
		
		params.max = Math.min(max ?: 10, 100)
		def criteria = Doc.createCriteria()

		def deptsl = criteria.list(max:params.max){
			eq("orgs","${session.user.orgs}")
			eq("share","本单位")
			order("dateCreated","desc")
			}
		render (view:'list',model:[docInstanceList:deptsl, docInstanceTotal: deptsl.getTotalCount()])
	}

	
	def publicList(Integer max){
		
		params.max = Math.min(max ?: 10, 100)
		def criteria = Doc.createCriteria()

		def deptsl = criteria.list(max:params.max){
			eq("share","本系统")
			order("dateCreated","desc")
			}
		render (view:'list',model:[docInstanceList:deptsl, docInstanceTotal: deptsl.getTotalCount()])
	}

	
   def create() {
	   def docInstance = new Doc(params)  
	  
	   if(session.user){
		   	def date = new Date().format("yyyyMMddhhmmss").toString()
		    docInstance.name = "${session.user.userId}" + "${date}"
			docInstance.orgs = session.user.orgs
			docInstance.depts = session.user.depts
			docInstance.username = session.user.username
			docInstance.roles = session.user.roles
			docInstance.fileName= "此内容由系统自动生成"
		}
		[docInstance: docInstance]	
 
    }

 
   
   def save = {
	   def docInstance = new Doc(params)
	   
	   //handle uploaded file
	   def uploadedFile = request.getFile('filedata')
	   
	   if( uploadedFile.size>5000000){
		   flash.message = "上传的文件太大！"
		   redirect(controller:"doc", action:"create")
		   return false
	   }
	   
	   if(!uploadedFile.empty){
		   
		   def webRootDir = servletContext.getRealPath("/")
		   def userDir = new File(webRootDir, "/upload")
		   userDir.mkdirs()
		   docInstance.fileName = uploadedFile.originalFilename
		   def filePath =  new File(webRootDir, "/upload"+"/"+docInstance.fileName) //文件路径
		   while(filePath.exists()){
			   
				   docInstance.fileName ="(复件)" +docInstance.fileName  
				   filePath =  new File(webRootDir, "/upload"+"/"+docInstance.fileName)
			
		   }
		 
		   uploadedFile.transferTo( new File( userDir, docInstance.fileName))
		   
		   
	   }

	   if(!docInstance.hasErrors() && docInstance.save()) {
		   flash.message = "Doc ${docInstance.id} created"
		   redirect(action:"show",id:docInstance.id)
	   }
	   else {
		   render(view:'create',model:[entryInstance:docInstance])
	   }
   }

   
   /**
	* 文件下载
	*/
    def download(Long id) {
		def docInstance = Doc.get(id)
		def webRootDir = servletContext.getRealPath("/")
		
		def fileName = docInstance.fileName //文件名	
		def filePath = new File(webRootDir, "/upload"+"/"+fileName) //文件路径
		response.setHeader("Content-disposition", "attachment; filename="+ new String(fileName.getBytes("UTF-8"),"ISO8859-1"))
		def out = response.outputStream
		def inputStream = new FileInputStream(filePath)
		byte[] buffer = new byte[1024]
		int i = -1
		while ((i = inputStream.read(buffer)) != -1) {
			out.write(buffer, 0, i)
		}
		out.flush()
		out.close()
		inputStream.close()
	}

  
   

   
    def show(Long id) {
        def docInstance = Doc.get(id)
        if (!docInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'doc.label', default: 'Doc'), id])
            redirect(action: "usernameList")
            return
        }

        [docInstance: docInstance]
    }

    def edit(Long id) {
        def docInstance = Doc.get(id)
        if (!docInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'doc.label', default: 'Doc'), id])
            redirect(action: "usernameList")
            return
        }
		if (docInstance.username != session.user.username && docInstance.username != "管理员"){
			flash.message = "只有本人和管理员才能修改文档！"
			redirect(action:"usernameList")
			return
			
		}

        [docInstance: docInstance]
    }

    def update(Long id, Long version) {
        def docInstance = Doc.get(id)
        if (!docInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'doc.label', default: 'Doc'), id])
            redirect(action: "usernameList")
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
            redirect(action: "usernameList")
            return
        }
		
		if (docInstance.username != session.user.username && docInstance.username != "管理员"){
			flash.message = "只有本人和管理员才能删除文档！"
			redirect(action:"usenameList")
			return
			
		}

        try {
            docInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'doc.label', default: 'Doc'), id])
          
			
			def webRootDir = servletContext.getRealPath("/")		
			def fileName = docInstance.fileName //文件名
			def filePath = new File(webRootDir, "/upload"+"/"+fileName) //文件路径
			if(filePath.exists()){
				filePath.delete()
			}
			redirect(action: "usernameList")
			
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'doc.label', default: 'Doc'), id])
            redirect(action: "show", id: id)
        }
    }
}
