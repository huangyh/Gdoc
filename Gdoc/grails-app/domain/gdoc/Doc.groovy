package gdoc

class Doc {
	String name
	String description
	String orgs
	String depts
	String username
	String roles
	String share
	String fileName
	byte[] filedata
	Date dateCreated

	
	
	String toString(){
		"${name}"
	}
	
	static belongsTo =[categorys:Category]

    static constraints = {
	    name(nullable:true)
		description(nullable:true)
		orgs(nullable:true)
		depts(nullable:true)
		username(nullable:true)
		roles(nullable:true)
		share(inList:["私有","本部门","本单位","本系统","所有人"])
		fileName(nullable:true)
		filedata(nullable:true)
		dateCreated()
		
		
    }
}
