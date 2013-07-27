package gdoc

class Doc {
	String name
	String description
	String orgs
	String depts
	String username
	String roles
	String categorys
	String share
	String fileName
	byte[] filedata
	Date dateCreated

	
	
	String toString(){
		"${name}"
	}
	
	
	static mapping = { filedata( type: 'materialized_blob' ) }

    static constraints = {
	    name(blank:false)
		categorys(inList:["总公司发文","分公司发文","分公司收文","直属企业发文","业务","财务","综合","人事党群","纪检监察","其他"],blank:false)
		share(inList:["私有","本部门 ","本单位","本系统"],blank:false)
		fileName()
		filedata()
		dateCreated()
		description()
		orgs()
		depts()
		username()
		roles()
		
    }
}
