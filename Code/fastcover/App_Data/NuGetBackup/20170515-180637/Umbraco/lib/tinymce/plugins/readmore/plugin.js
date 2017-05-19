tinymce.PluginManager.add('readmore', function (editor) {
    editor.addButton('readmore', {
        icon: 'custom icon-load',
        title: 'Read More',
        onclick: function () {
            var bm = editor.selection.getBookmark(0);

            //select the bookmark element
            var selector = "[data-mce-type=bookmark]";
            var bmElements = editor.dom.select(selector);

            //put the cursor in front of that element
            editor.selection.select(bmElements[0]);
            editor.selection.collapse();

            //add in my special span to get the index...
            //we won't be able to use the bookmark element for this because each browser will put id and class attributes in different orders.
            var elementID = "######cursor######";
            var positionString = '<span id="' + elementID + '"></span>';
            editor.selection.setContent(positionString);

            //get the content with the special span but without the bookmark meta tag
            var content = editor.getContent({ format: "html" });
            //find the index of the span we placed earlier
            var index = content.indexOf(positionString);

            //remove my special span from the content
            editor.dom.remove(elementID, false);

            //move back to the bookmark
            editor.selection.moveToBookmark(bm);
            content = editor.getContent({ format: "html" });
            var partOne = content.slice(0, index);
            var partTwo = content.slice(index, content.length);
            var readmorecontent = '&nbsp;<a href="#" class="readmore">Read More...</a>&nbsp;';
            if (content.indexOf(readmorecontent) === -1) {
                content = content.replace('<a href="#" class="readmore">Read More...</a>', '');
                partOne = content.slice(0, index);
                partTwo = content.slice(index, content.length);
            }
            if (content.indexOf('<div class="more">') === -1) {
                editor.setContent("<div class='more'>" + partOne + readmorecontent + partTwo + "</div>");
            } else {
                editor.setContent(partOne + readmorecontent + partTwo);
            }
        }
    });
});