package gdoc

class Role {
	String name
	String description
	
	String toString(){
		"${name}"
	}
	

    static constraints = {
		name(balnk:false)
		description()
    }
}
