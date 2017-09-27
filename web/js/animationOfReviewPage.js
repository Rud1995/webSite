var t = true;
function rotate(x) {
    if(t == true) {
        x.style.transform = "rotate(110deg)";
        x.style.transition = "all 0.4s";
        var id = "#openSesame" + x.id;
        $(document).ready(function () {
            $(id).animate({width: '340px', padding: '10px'}, 300);
        });
        t =false;
    }else {
        x.style.transform = "rotate(0deg)";
        x.style.transition = "all 0.4s";
        var id = "#openSesame" + x.id;
        $(document).ready(function () {
            $(id).animate({width: '0', padding: '0px'}, 300);
        });
        t = true;
    }
}