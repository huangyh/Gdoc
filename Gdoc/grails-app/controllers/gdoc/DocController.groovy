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


    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [docInstanceList: Doc.list(params), docInstanceTotal: Doc.count()]
    }

   def create() {
	   def docInstance = new Doc(params)   
	   if(session.user){
			docInstance.orgs = session.user.orgs
			docInstance.depts = session.user.depts
			docInstance.username = session.user.username
			docInstance.roles = session.user.roles
			docInstance.fileName= "此内容由系统自动生成"
		}
		[docInstance: docInstance]	
 
    }

    /*def save() {
        def docInstance = new Doc(params)
        if (!docInstance.save(flush: true)) {
            render(view: "create", model: [docInstance: docInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'doc.label', default: 'Doc'), docInstance.id])
        redirect(action: "show", id: docInstance.id)
    }
*/
   
   def save = {
	   def docInstance = new Doc(params)
	   
	   
   
	   //handle uploaded file
	   def uploadedFile = request.getFile('filedata')
	   
	   if( uploadedFile.size>1000000){
		   flash.message = "上传的文件太大！"
		   redirect(controller:"doc", action:"create")
		   return false
	   }
	   
	   if(!uploadedFile.empty){
		   println "Class: ${uploadedFile.class}"
		   println "Name: ${uploadedFile.name}"
		   println "OriginalFileName: ${uploadedFile.originalFilename}"
		   println "Size: ${uploadedFile.size}"
		   println "ContentType: ${uploadedFile.contentType}"
		   
		   

		   def webRootDir = servletContext.getRealPath("/")
		   def userDir = new File(webRootDir, "/upload")
		   userDir.mkdirs()
		   uploadedFile.transferTo( new File( userDir, uploadedFile.originalFilename))
		   docInstance.fileName = uploadedFile.originalFilename
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
		
		def fileName = docInstance.fileName  //文件名	
		def filePath = new File(webRootDir, "/upload"+"/"+fileName) //文件路径
		response.setHeader("Content-disposition", "attachment; filename=$fileName")
		def out = response.outputStream
		println filePath
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
		if (docInstance.username != session.user.username && docInstance.username != "管理员"){
			flash.message = "只有本人和管理员才能修改文档！"
			redirect(action:"list")
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
		
		if (docInstance.username != session.user.username && docInstance.username != "管理员"){
			flash.message = "只有本人和管理员才能删除文档！"
			redirect(action:"list")
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
