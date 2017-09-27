function openSubcategory(x) {
    for (var i = 0; i < 3; i++) {
        document.getElementsByClassName("sub-content")[i].style.display = "none";
    }
    document.getElementsByClassName("sub-content")[x.name].style.display = "block";
    for(var i = 0; i < 11; i++) {
        document.getElementsByTagName("button")[i].style.backgroundColor = "none";
    }
    x.style.backgroundColor = "whitestone";
}

function openBlank(y) {
    for(var i = 0; i < 7; i++) {
        var name = "form" + i;
        document.getElementById(name).style.display = "none";
    }
    var nameActual = "form" + y.name;
    document.getElementById(nameActual).style.display = "block";
}