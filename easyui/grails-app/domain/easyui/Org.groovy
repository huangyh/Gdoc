package easyui

class Org {
	String name
	
	static hasMany = [depts:Dept]
	
	String toString(){
		"${name}"
	}

	static constraints = {
	}
}



