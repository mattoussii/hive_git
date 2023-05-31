

// ignore_for_file: file_names

//-->  port  9999
//--> enable make physique device request

const String linkServerName = "http://192.168.1.7:9999/app_php";


const String linkImageRoot= "http://192.168.1.7:9999/app_php/upload";



//auth
const String linkSignup = "$linkServerName/auth/signup.php";

const String linkLogin = "$linkServerName/auth/login.php";




//visites
const String linkAddVisite = "$linkServerName/visites/add.php";

const String linkDeleteVisite = "$linkServerName/visites/delete.php";

const String linkEditVisite = "$linkServerName/visites/edit.php";

const String linkViewVisite = "$linkServerName/visites/view.php";