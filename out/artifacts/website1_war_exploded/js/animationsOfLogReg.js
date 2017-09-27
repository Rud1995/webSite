var log = true;
var reg = true;
$(document).ready(function () {
        $("#login").click(function () {
            $("#openformReg").slideUp(500);
            if(reg == false) {
                document.getElementById("arrow2Reg").style.transform = "rotate(0deg)";
                document.getElementById("arrow2Reg").style.transition = "all 0.5s";
                reg = true;
            }

            $("#openFormLog").slideToggle(500);
            if (log == true) {
                document.getElementById("arrow2Log").style.transform = "rotate(180deg)";
                document.getElementById("arrow2Log").style.transition = "all 0.5s";
                log = false;
            } else {
                document.getElementById("arrow2Log").style.transform = "rotate(0deg)";
                document.getElementById("arrow2Log").style.transition = "all 0.5s";
                log = true;
            }
        });

        $("#register").click(function () {
            $("#openFormLog").slideUp(500);
            if(log == false) {
                document.getElementById("arrow2Log").style.transform = "rotate(0deg)";
                document.getElementById("arrow2Log").style.transition = "all 0.5s";
                log = true;
            }

            $("#openformReg").slideToggle(500);
            if (reg == true) {
                document.getElementById("arrow2Reg").style.transform = "rotate(180deg)";
                document.getElementById("arrow2Reg").style.transition = "all 0.5s";
                reg = false;
            } else {
                document.getElementById("arrow2Reg").style.transform = "rotate(0deg)";
                document.getElementById("arrow2Reg").style.transition = "all 0.5s";
                reg = true;
            }
        });
});