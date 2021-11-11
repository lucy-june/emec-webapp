/**
 * Created by Legend on 2015-06-17.
 */

/**
 * Created by Legend on 2015/3/26.
 */

function plugin0()
{
    return document.getElementById('plugin1');
}
plugin = plugin0;
var isremoved=false;
var keyid;
function pluginLoaded() {
    //alert("Plugin loaded!");
    keyid=plugin().keyid;
    if(keyid==""){
        alert("未能检测到U盾，请插入U盾后刷新重试！");
        return;
    }
    $("#keyid").val(keyid);
}

function addEvent(obj, name, func)
{
    if (obj.attachEvent) {
        obj.attachEvent("on"+name, func);
    } else {
        obj.addEventListener(name, func, false);
    }
}

function pluginValid()
{
    if(!plugin().valid){
        alert("控价没有运行！");
        //disableInputs();
    }
}

function sign(msg){
    var signtext='';
    for(var i=0;i<4;i++){
        signtext=plugin().sign(msg);
        if(signtext.length>5){
            break;
        }
    }
    return signtext;
}

function load()
{
    if(plugin().valid){
        //alert(plugin().echo("This plugin seems to be working!"));
    } else {
        //alert("Plugin is not working :(");
        $.Dialog({
            modal:true,
            shadow: true,
            overlay: true,
            title: '提示',
            draggable:true,
            width: 400,
            height: 150,
            padding: 10,
            content:'<div>检测到控件没有运行，请确保下载并安装了安全控件。如果没有安装，点击<a href="/download/HuijinSecurityPlugin.msi">这里</a>进行下载！ </div>'
        });
    }
}

function heartbeat(){
    var keyid=plugin().keyid;
    if(keyid.length<5){
        $.ajax({
            'url': '/logout',
            'type': 'get',
            'datatype': 'html',
            'success':function(msg){
                alert("检测到U盾被拔出！请重新登录");
                window.location.href="/";
            }
        });
    }
}

timerid=setInterval(heartbeat,5000);