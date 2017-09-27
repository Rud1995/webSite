var t = true;
function rotate(x) {
    if(t == true) {
        x.style.transform = "rotate(110deg)";
        x.style.transition = "all 0.3s";
        $(document).ready(function () {
            $("#updateInfoAboutUser").show();
            $("#updateInfoAboutUser").animate({width: '260px', height: '315px', padding: '10px'}, 300);
        });
        t =false;
    }else {
        x.style.transform = "rotate(0deg)";
        x.style.transition = "all 0.5s";
        $(document).ready(function () {
            $("#updateInfoAboutUser").animate({width: '0', height: '0', padding: '0px'}, 300);
        });
        t = true;
    }
}