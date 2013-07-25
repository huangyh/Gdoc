package gdoc

class Category {
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
