

// ignore_for_file: file_names

//-->  port  9999
//--> enable make physique device request

const String linkServerName = "http://192.168.1.5:9999/app_php";


const String linkImageRoot= "http://192.168.1.5:9999/app_php/upload";



//auth
const String linkSignup = "$linkServerName/auth/signup.php";

const String linkLogin  = "$linkServerName/auth/login.php";


//ruches

const String linkAddRuche    = "$linkServerName/ruches/add_ruche.php";

const String linkDeleteRuche = "$linkServerName/ruches/delete_ruche.php";

const String linkEditRuche   = "$linkServerName/ruches/edit_ruche.php";

const String linkViewRuche   = "$linkServerName/ruches/view_ruche.php";




//visites
const String linkAddVisite    = "$linkServerName/visites/add.php";

const String linkDeleteVisite = "$linkServerName/visites/delete.php";

const String linkEditVisite   = "$linkServerName/visites/edit.php";

const String linkViewVisite   = "$linkServerName/visites/view.php";


//photos
const String linkAddPhoto    = "$linkServerName/photos/add_photo.php";

const String linkDeletePhoto = "$linkServerName/photos/delete_photo.php";

const String linkEditPhoto   = "$linkServerName/photos/edit_photo.php";

const String linkViewPhoto   = "$linkServerName/photos/view_photo.php";


//contact
const String linkAddContact = "$linkServerName/contact/add_contact.php";