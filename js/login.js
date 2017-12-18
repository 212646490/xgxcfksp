var xmlHttp;
var flg;
function createXMLHttp() {
    if (window.XMLHttpRequest){
        xmlHttp = new XMLHttpRequest();
    }else{
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
}
function login() {
    createXMLHttp();
    var uname = document.getElementById("name").value;
    var password = document.getElementById("password").value;
    if(user==""){
        alert("请输入用户名!");
        return false;
    }
    var url = "login_check.jsp?username="+uname+"&password="+password;
    xmlHttp.open("POST",url,true);
    xmlHttp.onreadystatechange = loginCallback();
    xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    xmlHttp.send("user="+uname+"&password="+password);
}
function loginCallback() {
    if (xmlHttp.readyState == 4){
        if (xmlHttp.status == 200){
            var text = xmlHttp.responseText;
            if(text == "error"){
                document.getElementById("msg").innerHTML = "用户名或密码错误!";
                return false;
            }else {
                window.location.href = "login_success.jsp";
            }
        }
    }
}






























