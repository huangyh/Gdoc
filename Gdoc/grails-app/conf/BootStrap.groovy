import gdoc.Dept
import gdoc.Org
import gdoc.User

import grails.util.GrailsUtil
class BootStrap {

    def init = { servletContext ->
		 switch(GrailsUtil.environment){
         case "development":
			def org = new Org(name:'安徽分公司')
			def dept = new Dept(name:'其他',orgs:org)
			
			
			org.save()
			if(org.hasErrors()){
				println org.errors
				}else{
				println 'org was saved!'
				}
			
			dept.save()
			if(dept.hasErrors()){
				println dept.errors
				}else{
				println 'dept was saved!'
				}
		
			
			def user = new User(
				userId:'hyh',
				username:'黄于辉',
				password:'123456',
				email:'aaa@aaa.com',
				phone:'11111111',
				orgs:org,
				depts:dept,
				roles:'管理员'
				)
			
			user.save()
			if(org.hasErrors()){
				println user.errors
				}
			
			break
			
			case "production" : break
		}
		
    }
    def destroy = {
    }
}
