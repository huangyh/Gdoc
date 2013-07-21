package gdoc

class User {
	String userId
	String username
	String password
	String email
	String phone
	Org orgs
	Dept depts
	
	String toString(){
		"${username}"
	}
	
	static belongsTo = [roles:Role]
	

    static constraints = {
		userId(blank:false,unique:true)
		username(blank:false)
		password(blank:false)
		email(blank:false,email:true)
		phone()
		orgs()
		depts()
    }
}
