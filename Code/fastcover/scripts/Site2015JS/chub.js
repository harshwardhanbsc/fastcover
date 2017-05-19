$(function () {
    $(".qacontainer").each(function (index) {
        var accordian = $(this).children('.accordion');
        var repeatdiv = accordian.children('.repeatdiv');
        var dd = repeatdiv.children('dd');
        dd.hide();
        dd.first().show();
        var dt = repeatdiv.children('dt');
        var a = dt.children('a');
        a.click(function () {
            dd.slideUp();
            if ($(this).parent().next().css('display') === 'none') {
                $(this).parent().next().slideDown();
            } else {
                $(this).parent().next().slideUp();
            }
            return false;
        });
    });
    //if ($(window).width() >= "751") {
    //    $(".taxiarea").each(function (index) {
    //        var firstchild = 0;
    //        var secondchild = 0;
    //        var thirdchild = 0;
    //        var content = null;
    //        var ul = $(this).children();
    //        $(ul).each(function (idx) {
    //            var li = $(this).children();
    //            $(li).each(function (ids) {
    //                content = $(this).children(".content");
    //                $(content).each(function (idsx) {
    //                    if (idsx === 0) {
    //                        firstchild = $(this).height();
    //                    }
    //                    if (idsx === 1) {
    //                        secondchild = $(this).height();
    //                    }
    //                    if (idsx === 2) {
    //                        thirdchild = $(this).height();
    //                    }
    //                });

    //            });
    //            var maxheight = Math.max(firstchild, secondchild, thirdchild);
    //            $(li).each(function (ids) {
    //                content = $(this).children(".content");
    //                $(content).each(function (idsx) {
    //                    $(this).height(maxheight);
    //                });
    //            });
    //        });

    //    });
    //}
   
});