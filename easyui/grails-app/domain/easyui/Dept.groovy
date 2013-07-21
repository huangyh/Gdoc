package easyui

class Dept {
	String name
	
	static belongsTo = [orgs:Org]

	
	String toString(){
		"${name}"
	}

    static constraints = {
    }
}
