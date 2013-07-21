package gdoc

class Role {
	String name
	String description
	
	String toString(){
		"${name}"
	}
	
	static hasMany = [users:User]

    static constraints = {
		name()
		description()
    }
}
