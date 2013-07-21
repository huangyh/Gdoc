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
		name()
		address()
		zip()
		code()
    }
}
