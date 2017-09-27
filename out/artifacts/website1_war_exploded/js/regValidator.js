function sendIfValid() {
    if(document.getElementById("password").value.localeCompare(document.getElementById("passwordAgain").value) != 0){
        alert("password fields ain't equal");
        return false;
    }else if(document.getElementById("password").value.length < 4 || document.getElementById("password").value.length > 16){
        alert("password must have symbols from 4 to 16");
        return false;
    }else{
        return true;
    }
}