package gdoc

class User {
	String userId
	String username
	String password
	String email
	String phone
	Org orgs
	Dept depts
	String roles
	
	static transients = ["admin"]
	boolean isAdmin(){
		return roles == "管理员"
	}
	
	String toString(){
		"${username}"
	}
	
	static mapping = {
		orgs lazy:false
		depts lazy:false
	}
	
    static constraints = {
		userId(blank:false,unique:true)
		username(blank:false)
		password(blank:false,password:true)
		email(blank:false,email:true)
		phone(nullable:true)
		orgs(blank:false)
		depts(blank:false)
		roles(inList:["管理员","直属企业员工","直属企业中层","直属企业领导","分公司员工","分公司中层","分公司领导"],blank:false)
		
    }
}
