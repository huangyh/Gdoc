package gdoc

class Org {
	String name
	String address
	int zip
	String code
	
	String toString(){
		"${name}"
	}
	 
	static hasMany = [depts:Dept]
	

    static constraints = {
		name(blank:false)
		address(nullable:true)
		zip(nullable:true)
		code(nullable:true)
    }
}
