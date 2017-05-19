$(function () {
    $('.more').each(function () {
        var content = $(this).html();
        var moretext = $(this).find(".readmore").text();
        var readmore = '<a href="#" class="readmore">' + moretext + '</a>';
        var splitcontent = content.split(readmore);
        var html = '';
        for (var i = 0; i < splitcontent.length; i++) {
            var random = Math.random().toString(36).substr(2, 10);
            if (i === 0) {
                html += splitcontent[i];
            } else {
                html += "<a href='#' id=\"" + random + "-show\" class='morelink' onclick='showHide(\"" + random + "\");return false;'> " + moretext + '</a><div class="morecontent"><div id="' + random + '">' + splitcontent[i] + '</div></div>';
            }
        }
        $(this).html(html);
        $(this).html($(this).html().replace(/&nbsp;/gi, ''));
        $(this).html($(this).html().replace('<p></p>', ''));
    });

    $('.bottomimagecontent img').click(function () {
        var morelink = $('.morelink').attr('id');
        var morelinkiid = morelink.split('-')[0];
        showHide(morelinkiid);
    });
});
function showHide(shId) {
    $("#" + shId).slideDown();
    $("#" + shId + '-show').css('display', 'none');
}