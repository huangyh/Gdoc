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
	
	static mapping = { filedata( type: 'materialized_blob' ) }

    static constraints = {
	    name(balnk:false)
		description()
		orgs()
		depts()
		username()
		roles()
		share(inList:["私有","本部门 ","本单位","本系统","公开"],blank:false)
		fileName()
		filedata()
		dateCreated()
		
		
    }
}
