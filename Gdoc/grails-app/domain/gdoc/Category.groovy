package gdoc

class Category {
	String name
	String description
	
	String toString(){
		"${name}"
	}
	
	static hasMany = [docs:Doc]

    static constraints = {
		name()
		description()
    }
}
