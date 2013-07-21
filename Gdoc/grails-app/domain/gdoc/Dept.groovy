package gdoc

class Dept {
	String name
	String description
	
	String toString(){
		"${name}"
	}
	
	static belongsTo = [orgs:Org]

    static constraints = {
		name(blank:false)
		description()
    }
}
