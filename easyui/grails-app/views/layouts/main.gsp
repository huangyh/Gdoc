<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Grails" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.ico')}"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">

<r:require modules="easyui_core" />
<g:layoutHead />
<r:layoutResources />
</head>
<body class="easyui-layout" style="margin:20px" fit="true" >

	<div data-options="region:'north'" style="height: 120px;" border = "false">
		<div id="grailsLogo" role="banner" >
			<a href="#"><img
				src="${resource(dir: 'images', file: 'ddoc_logo.PNG')}"
				alt="Grails"  style="margin:15px;"/></a>
		</div>
		
	</div>
 
	<div data-options="region:'south'" style="height: 80px;" border="false">
		<div class="footer" role="contentinfo">中国储备粮管理总公司安徽分公司 版权所有</div>
	
		<div id="spinner" class="spinner" style="display: none;">
			<g:message code="spinner.alt" default="Loading&hellip;" />	
		
		</div>

	
	</div>

	<div data-options="region:'east',title:'最新上传与下载',split:true"
		style="width: 260px;" >
	</div>
	<div data-options="region:'west',title:'功能导航',split:true"
		style="width: 260px;">
		<div class="easyui-accordion" border = "false">  
    <div title="系统简介" iconCls="icon-ok" style="overflow:auto;padding:10px;">  
        <h3 style="color:#0099FF;">Grails & JQuery-easyui</h3>  
        <p>如今的Java Web开发对于需求来说已经变得过于复杂。当今众多Java领域的Web开发框架不仅使用复杂，并且没有很好地遵循Don’t repeat yourself （DRY）原则。
        如目前使用较多的Struts-Spring-Hibernate （SSH）框架整合，配置非常麻烦，使开发者不能集中精力于业务逻辑的实现。Grails在Web开发领域开辟了一条新的道路。它基于这些概念之上，
        采用动态方法减小了Java平台上进行Web开发的复杂度。与Rails等框架不同，Grails是构建在Spring和Hibernate等Java已有的技术之上的。Grails是一个full-stack框架，
        借助于核心技术与相关的插件（plug-in）来解决Web开发中方方面面的问题。</p>
		
</p>  
    </div>  
    <div title="帮助文档" iconCls="icon-help" style="padding:10px;">  
        <p>一个好的系统，必须有好的用户体验。JQuery的easyui框架可以帮助您轻松打造您的网页。在Grails中，安装了easyui插件之后，就可以在view层设计出非常现代、流行、优雅的用户界面。
	采用Grails框架整合easyui来开发中储粮安徽分公司文档管理系统，技术先进、可靠、强大、便捷。</p>
	<p>由于文档管理系统涵盖了基本的组织机构管理与权限控制技术，开发此系统可以做到举一反三，为今后开发其他的企业应用系统打下坚实的基础。</p>
    </div>  
    <div title="系统管理"  >  
        <ul id="tt1" class="easyui-tree">  
            <li>  
                <span>机构管理</span>  
                <ul>  
                     <li><span>File 11</span></li>  
                     <li><span>File 12</span></li>  
                     <li><span>File 13</span></li>                       
                </ul>  
            </li>   
             <li>  
                <span>部门管理</span>  
                <ul>  
                     <li><span>File 11</span></li>  
                     <li><span>File 12</span></li>  
                     <li><span>File 13</span></li>                       
                </ul>  
            </li> 
             <li>  
                <span>人员管理</span>  
                <ul>  
                     <li><span>File 11</span></li>  
                     <li><span>File 12</span></li>  
                     <li><span>File 13</span></li>                       
                </ul>  
            </li> 
             <li>  
                <span>角色管理</span>  
                <ul>  
                     <li><span>File 11</span></li>  
                     <li><span>File 12</span></li>  
                     <li><span>File 13</span></li>                       
                </ul>  
            </li>        
         </ul>  
    </div>  
    <div title="文档管理"  selected="true">  
        <ul id="tt2" class="easyui-tree">  
           <li>  
                <span>上传文档</span>  
                <ul>  
                     <li><span>File 11</span></li>  
                     <li><span>File 12</span></li>  
                     <li><span>File 13</span></li>                       
                </ul>  
            </li>   
             <li>  
                <span>查阅文档</span>  
                <ul>  
                     <li><span>File 11</span></li>  
                     <li><span>File 12</span></li>  
                     <li><span>File 13</span></li>                       
                </ul>  
            </li> 
             <li>  
                <span>删除文档</span>  
                <ul>  
                     <li><span>File 11</span></li>  
                     <li><span>File 12</span></li>  
                     <li><span>File 13</span></li>                       
                </ul>  
            </li> 
             <li>  
                <span>修改密码</span>  
                <ul>  
                     <li><span>File 11</span></li>  
                     <li><span>File 12</span></li>  
                     <li><span>File 13</span></li>                       
                </ul>  
            </li>        
        </ul>  
    </div>  
</div> 
	</div>
	<div data-options="region:'center',title:'欢迎使用文档管理系统（设计：黄于辉）'">
		<g:layoutBody />
	</div>

</body>
</html>
