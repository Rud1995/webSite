var t = true;
$(document).ready(function () {
    $("#keyOpenList").hover(
        function () {
        document.getElementById("arrow1").style.transform = "rotate(180deg)";
        document.getElementById("arrow1").style.transition = "all 0.2s";
        $("#category_list").slideDown(200);
        t = false;
    },function () {
        document.getElementById("arrow1").style.transform = "rotate(0deg)";
        document.getElementById("arrow1").style.transition = "all 0.2s";
        $("#category_list").slideUp(200);
        t = true;

    });
});