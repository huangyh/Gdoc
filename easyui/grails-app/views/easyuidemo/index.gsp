<html>
<head>
<meta name="layout" content="easyui_main" />
<title>Grails&easyui Demo</title>

</head>
<body>

<div class="easyui-window" title="Layout Window" icon="icon-help" style="width:500px;height:250px;padding:5px;background: #fafafa;">  
    <div class="easyui-layout" fit="true">  
        <div region="west" split="true" style="width:120px;">  
            <ul class="easyui-tree">  
                <li>  
                    <span>Library</span>  
                    <ul>  
                        <li><span>easyui</span></li>  
                        <li><span>Music</span></li>  
                        <li><span>Picture</span></li>  
                        <li><span>Database</span></li>  
                    </ul>  
                </li>  
            </ul>  
        </div>  
        <div region="center" border="false" border="false">  
            <div class="easyui-tabs" fit="true">  
                <div title="Home" style="padding:10px;">  
                    jQuery easyui framework help you build your web page easily.  
                </div>  
                <div title="Contacts">  
                    No contact data.  
                </div>  
            </div>  
        </div>  
        <div region="south" border="false" style="text-align:right;height:30px;line-height:30px;">  
            <a class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">Ok</a>  
            <a class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">Cancel</a>  
        </div>  
    </div>  
</div> 
</body>
</html>