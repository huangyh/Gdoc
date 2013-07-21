package easyui

class User {
	
	String username
	String password
	Org org
	Dept dept

    static constraints = {
		
		username()
		password()
		org()
    }
}
