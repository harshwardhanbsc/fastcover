angular.module("umbraco").controller("my.custom.grideditorcontroller", function ($scope) {
    $scope.control.value = "my new value";
});

//  https://our.umbraco.org/forum/umbraco-7/using-umbraco-7/64836-RichTextEditor-in-Custom-grid-control

angular.module("umbraco").controller("CHControls.RteAllOptions", function ($scope, tinyMceService, macroService) {
    $scope.rteconfig =
    {
        "toolbar": ["removeformat", "code", "bold", "italic", "styleselect", "Underline", "Strikethrough", "JustifyLeft", "JustifyCenter", "JustifyRight", "JustifyFull", "alignleft", "aligncenter", "alignright", "bullist", "numlist", "outdent", "indent", "link", "unlink", "anchor", "table", "hr", "umbmediapicker", "charmap", "forecolor", "backcolor", "fontselect", "fontsizeselect", "readmore"],
        "stylesheets": ["chubrtestyles"],
        "dimensions":
            {
                "height": 500
            },
        "maxImageSize": 1500
    }
    var vm = this;

    vm.openLinkPicker = openLinkPicker;
    vm.openMediaPicker = openMediaPicker;
    vm.openMacroPicker = openMacroPicker;
    vm.openEmbed = openEmbed;
    function openLinkPicker(editor, currentTarget, anchorElement) {
        vm.linkPickerOverlay = {
            view: "linkpicker",
            currentTarget: currentTarget,
            show: true,
            submit: function (model) {
                tinyMceService.insertLinkInEditor(editor, model.target, anchorElement);
                vm.linkPickerOverlay.show = false;
                vm.linkPickerOverlay = null;
            }
        };
    }

    function openMediaPicker(editor, currentTarget, userData) {
        vm.mediaPickerOverlay = {
            currentTarget: currentTarget,
            onlyImages: true,
            showDetails: true,
            startNodeId: userData.startMediaId,
            view: "mediapicker",
            show: true,
            submit: function (model) {
                tinyMceService.insertMediaInEditor(editor, model.selectedImages[0]);
                vm.mediaPickerOverlay.show = false;
                vm.mediaPickerOverlay = null;
            }
        };
    }

    function openEmbed(editor) {
        vm.embedOverlay = {
            view: "embed",
            show: true,
            submit: function (model) {
                tinyMceService.insertEmbeddedMediaInEditor(editor, model.embed.preview);
                vm.embedOverlay.show = false;
                vm.embedOverlay = null;
            }
        };
    }

    function openMacroPicker(editor, dialogData) {
        vm.macroPickerOverlay = {
            view: "macropicker",
            dialogData: dialogData,
            show: true,
            submit: function (model) {
                var macroObject = macroService.collectValueData(model.selectedMacro, model.macroParams, dialogData.renderingEngine);
                tinyMceService.insertMacroInEditor(editor, macroObject, $scope);
                vm.macroPickerOverlay.show = false;
                vm.macroPickerOverlay = null;
            }
        };
    }
});

angular.module("umbraco").controller("CHControls.MultipleMediaController3", function ($scope, $rootScope, $location, $routeParams, $timeout, $http, $log, dialogService) {
    $scope.setImage = function (imageName) {

        $scope["imgName"] = imageName;

        dialogService.mediaPicker({
            startNodeId: $scope.control.editor.config && $scope.control.editor.config.startNodeId ? $scope.control.editor.config.startNodeId : undefined,
            multiPicker: false,
            cropSize: $scope.control.editor.config && $scope.control.editor.config.size ? $scope.control.editor.config.size : undefined,
            showDetails: true,
            callback: function (data) {

                debugger;

                var imageNameKey = $scope["imgName"];


                if ($scope.control.value == null) {
                    $scope.control.value = { images: {} };
                }
                if ($scope.control.value.images == null) {
                    $scope.control.value.images = {};
                }

                $scope.control.value.images[imageNameKey] = {
                    focalPoint: data.focalPoint,
                    id: data.id,
                    image: data.image,
                    altText: data.altText
                };

                $scope.setUrl();
            }
        });
    };

    $scope.setUrl = function () {

        if ($scope.control.value && $scope.control.value.image) {
            var url = $scope.control.value.image;

            if ($scope.control.editor.config && $scope.control.editor.config.size) {
                url += "?width=" + $scope.control.editor.config.size.width;
                url += "&height=" + $scope.control.editor.config.size.height;

                if ($scope.control.value.focalPoint) {
                    url += "&center=" + $scope.control.value.focalPoint.top + "," + $scope.control.value.focalPoint.left;
                    url += "&mode=crop";
                }
            }
            $scope.url = url;
        }
    };
    $scope.removeImage = function (imageName) {
        delete $scope.control.value.images[imageName];
    }

});

angular.module("umbraco").controller("CHControls.LinkedParagraphGroupController", function ($scope, $rootScope, $location, $routeParams, $timeout, $http, $log, dialogService) {
    if (("tabData" in $scope.control)) {
        var tableOldData = $scope.control.tabData;
        $scope.control.tabelsData = tableOldData;
    }
    else {
        $scope.control.id = 1;
        //$scope.control.tabelsData.push({ 'heading': '', 'content': '', 'image': null, id: $scope.control.id });
        $scope.control.tabelsData = [{ 'heading': '', 'content': '', 'image': null, 'id': $scope.control.id }];
    }
    $scope.ChangeContent = function () {
        var tabelData = $scope.control.tabelsData;
        $scope.control.tabData = tabelData;
    };

    $scope.AddRow = function () {
        $scope.control.id++;
        $scope.control.tabelsData.push({ 'heading': '', 'content': '', 'image': null, id: $scope.control.id });
    };

    $scope.setImage = function (rowid) {
        debugger;

        $scope["currentRowId"] = rowid;

        dialogService.mediaPicker({
            startNodeId: $scope.control.editor.config && $scope.control.editor.config.startNodeId ? $scope.control.editor.config.startNodeId : undefined,
            multiPicker: false,
            cropSize: $scope.control.editor.config && $scope.control.editor.config.size ? $scope.control.editor.config.size : undefined,
            showDetails: true,
            callback: function (data) {

                debugger;

                var imageRowId = $scope["currentRowId"];
                var index = -1;
                var comArr = eval($scope.control.tabelsData);
                for (var i = 0; i < comArr.length; i++) {
                    if (comArr[i].id === imageRowId) {
                        index = i;
                        break;
                    }
                }

                if ($scope.control.tabelsData[index].image == null) {
                    $scope.control.tabelsData[index].image = {};
                }

                $scope.control.tabelsData[index].image = {
                    focalPoint: data.focalPoint,
                    id: data.id,
                    image: data.image,
                    altText: data.altText
                };

                $scope.ChangeContent();

            }
        });
    };

    $scope.removeImage = function (rowid) {
        $scope["currentRowId"] = rowid;
        var imageRowId = $scope["currentRowId"];
        var index = -1;
        var comArr = eval($scope.control.tabelsData);
        for (var i = 0; i < comArr.length; i++) {
            if (comArr[i].id === imageRowId) {
                index = i;
                break;
            }
        }
        delete $scope.control.tabelsData[index].image;
    }
    $scope.RemoveRow = function (id) {
        var index = -1;
        var comArr = eval($scope.control.tabelsData);
        for (var i = 0; i < comArr.length; i++) {
            if (comArr[i].id === id) {
                index = i;
                break;
            }
        }
        if (index === -1) {
            alert("Something gone wrong");
        }
        $scope.control.tabelsData.splice(index, 1);
        $scope.ChangeContent();
    };
});
angular.module("umbraco").controller("CHControls.CollapseableQAEditorController", function ($scope) {
    if ("inputs" in $scope.control) {
        var input = $scope.control.inputs;
        $scope.control.inputs = input;
    } else {
        $scope.control.id = 1;
        $scope.control.inputs = [{ 'heading': '', 'question': '', 'answer': '', 'id': $scope.control.id }];
    }

    $scope.ChangeContent = function () {
        var input = $scope.control.inputs;
        $scope.control.input = input;
    };

    $scope.AddNewQuestionAnswer = function () {
        $scope.control.id++;
        $scope.control.inputs.push({ 'heading': '', 'question': '', 'answer': '', id: $scope.control.id });
    }
    $scope.RemoveRow = function (id) {
        var index = -1;
        var comArr = eval($scope.control.inputs);
        for (var i = 0; i < comArr.length; i++) {
            if (comArr[i].id === id) {
                index = i;
                break;
            }
        }
        if (index === -1) {
            alert("Something gone wrong");
        }
        $scope.control.inputs.splice(index, 1);
        $scope.ChangeContent();
    };
});

angular.module("umbraco").controller("CHControls.RadioOptionselect", function ($scope) {
    $scope.control.radiocollection = $scope.control.editor.config.radiocollection;
    var imagealign = null, imagealign1 = null, imagealign2 = null, imagealign3 = null;
    if ($scope.control.imagealign == null) {
        imagealign = $scope.control.editor.config.radiodefaultvalue;
    } else {
        imagealign = $scope.control.imagealign;
    }
    if ($scope.control.imagealign1 == null) {
        imagealign1 = $scope.control.editor.config.radiodefaultvalue;
    } else {
        imagealign1 = $scope.control.imagealign1;
    }
    if ($scope.control.imagealign2 == null) {
        imagealign2 = $scope.control.editor.config.radiodefaultvalue;
    } else {
        imagealign2 = $scope.control.imagealign2;
    }
    if ($scope.control.imagealign3 == null) {
        imagealign3 = $scope.control.editor.config.radiodefaultvalue;
    } else {
        imagealign3 = $scope.control.imagealign3;
    }
    $scope.control.imagealign = imagealign;
    $scope.control.imagealign1 = imagealign1;
    $scope.control.imagealign2 = imagealign2;
    $scope.control.imagealign3 = imagealign3;
});

angular.module("umbraco").controller("CHControls.TextRowEndImagesController", function ($scope, $rootScope, $location, $routeParams, $timeout, $http, $log, dialogService) {
    if ("inputs" in $scope.control) {
        var input = $scope.control.inputs;
        $scope.control.inputs = input;
    } else {
        $scope.control.id = 1;
        $scope.control.inputs = [{ 'leftimage': null, 'content': '', 'rightimage': null, 'id': $scope.control.id }];
    }

    $scope.ChangeContent = function () {
        var input = $scope.control.inputs;
        $scope.control.input = input;
    };

    $scope.AddRow = function () {
        $scope.control.id++;
        $scope.control.inputs.push({ 'leftimage': null, 'content': '', 'rightimage': null, id: $scope.control.id });
    }

    $scope.setLeftImage = function (rowid) {
        debugger;

        $scope["currentRowId"] = rowid;

        dialogService.mediaPicker({
            startNodeId: $scope.control.editor.config && $scope.control.editor.config.startNodeId ? $scope.control.editor.config.startNodeId : undefined,
            multiPicker: false,
            cropSize: $scope.control.editor.config && $scope.control.editor.config.size ? $scope.control.editor.config.size : undefined,
            showDetails: true,
            callback: function (data) {

                debugger;

                var imageRowId = $scope["currentRowId"];
                var index = -1;
                var comArr = eval($scope.control.inputs);
                for (var i = 0; i < comArr.length; i++) {
                    if (comArr[i].id === imageRowId) {
                        index = i;
                        break;
                    }
                }

                if ($scope.control.inputs[index].leftimage == null) {
                    $scope.control.inputs[index].leftimage = {};
                }

                $scope.control.inputs[index].leftimage = {
                    focalPoint: data.focalPoint,
                    id: data.id,
                    image: data.image,
                    altText: data.altText
                };

                $scope.ChangeContent();
            }
        });
    };

    $scope.setRightImage = function (rowid) {
        debugger;

        $scope["currentRowId"] = rowid;

        dialogService.mediaPicker({
            startNodeId: $scope.control.editor.config && $scope.control.editor.config.startNodeId ? $scope.control.editor.config.startNodeId : undefined,
            multiPicker: false,
            cropSize: $scope.control.editor.config && $scope.control.editor.config.size ? $scope.control.editor.config.size : undefined,
            showDetails: true,
            callback: function (data) {

                debugger;

                var imageRowId = $scope["currentRowId"];
                var index = -1;
                var comArr = eval($scope.control.inputs);
                for (var i = 0; i < comArr.length; i++) {
                    if (comArr[i].id === imageRowId) {
                        index = i;
                        break;
                    }
                }

                if ($scope.control.inputs[index].rightimage == null) {
                    $scope.control.inputs[index].rightimage = {};
                }

                $scope.control.inputs[index].rightimage = {
                    focalPoint: data.focalPoint,
                    id: data.id,
                    image: data.image,
                    altText: data.altText
                };

                $scope.ChangeContent();
            }
        });
    };

    $scope.removeLeftImage = function (rowid) {
        $scope["currentRowId"] = rowid;
        var imageRowId = $scope["currentRowId"];
        var index = -1;
        var comArr = eval($scope.control.inputs);
        for (var i = 0; i < comArr.length; i++) {
            if (comArr[i].id === imageRowId) {
                index = i;
                break;
            }
        }
        delete $scope.control.inputs[index].leftimage;
    }
    $scope.removeRightImage = function (rowid) {
        $scope["currentRowId"] = rowid;
        var imageRowId = $scope["currentRowId"];
        var index = -1;
        var comArr = eval($scope.control.inputs);
        for (var i = 0; i < comArr.length; i++) {
            if (comArr[i].id === imageRowId) {
                index = i;
                break;
            }
        }
        delete $scope.control.inputs[index].rightimage;
    }
    $scope.RemoveRow = function (id) {
        var index = -1;
        var comArr = eval($scope.control.inputs);
        for (var i = 0; i < comArr.length; i++) {
            if (comArr[i].id === id) {
                index = i;
                break;
            }
        }
        if (index === -1) {
            alert("Something gone wrong");
        }
        $scope.control.inputs.splice(index, 1);
        $scope.ChangeContent();
    };
});

angular.module("umbraco").controller("CHControls.DropdownSelecterCotroller", function ($scope) {
    $scope.control.option = $scope.control.editor.config.dropdownoption;
    if ($scope.control.dropdownvalue == null) {
        $scope.control.dropdownvalue = $scope.control.editor.config.dropdowndefaultvalue;
    }
});
angular.module("umbraco").controller("CHControls.DiseaseInfectionGroupController", function ($scope, $rootScope, $location, $routeParams, $timeout, $http, $log, dialogService) {
    if ("inputs" in $scope.control) {
        var input = $scope.control.inputs;
        $scope.control.inputs = input;
    } else {
        $scope.control.id = 1;
        $scope.control.inputs = [{ 'topcontent': '', 'diimage1': null, 'diimage2': null, 'diimage3': null, 'diimage4': null, 'symptonsheading': '', 'symptonsimages': [], 'bottomcontent': '', 'id': $scope.control.id }];
    }

    if ("symptonsimages" in $scope.control.inputs) {
        var symptonsimage = $scope.control.inputs.symptonsimages;
        $scope.control.inputs.symptonsimages = symptonsimage;
    } else {
        $scope.control.inputs.symptonsimages = [];
    }
    $scope.AddRow = function () {
        $scope.control.id++;
        $scope.control.inputs.push({ 'topcontent': '', 'diimage1': null, 'diimage2': null, 'diimage3': null, 'diimage4': null, 'symptonsheading': '', 'symptonsimages': [], 'bottomcontent': '', 'id': $scope.control.id });
    }


    $scope.RemoveRow = function (id) {
        var index = -1;
        var comArr = eval($scope.control.inputs);
        for (var i = 0; i < comArr.length; i++) {
            if (comArr[i].id === id) {
                index = i;
                break;
            }
        }
        if (index === -1) {
            alert("Something gone wrong");
        }
        $scope.control.inputs.splice(index, 1);
    };

    $scope.setImage = function (imageName) {

        $scope["imgName"] = imageName;

        dialogService.mediaPicker({
            startNodeId: $scope.control.editor.config && $scope.control.editor.config.startNodeId ? $scope.control.editor.config.startNodeId : undefined,
            multiPicker: false,
            cropSize: $scope.control.editor.config && $scope.control.editor.config.size ? $scope.control.editor.config.size : undefined,
            showDetails: true,
            callback: function (data) {
                debugger;
                var imageNameKey = $scope["imgName"];
                if ($scope.control.value == null) {
                    $scope.control.value = { images: {} };
                }
                if ($scope.control.value.images == null) {
                    $scope.control.value.images = {};
                }
                $scope.control.value.images[imageNameKey] = {
                    focalPoint: data.focalPoint,
                    id: data.id,
                    image: data.image,
                    altText: data.altText
                };
            }
        });
    };

    $scope.removeImage = function (imageName) {
        delete $scope.control.value.images[imageName];
    }


    $scope.addsymptonsimage = function (rowid) {
        dialogService.mediaPicker({
            startNodeId: $scope.control.editor.config && $scope.control.editor.config.startNodeId ? $scope.control.editor.config.startNodeId : undefined,
            multiPicker: false,
            cropSize: $scope.control.editor.config && $scope.control.editor.config.size ? $scope.control.editor.config.size : undefined,
            showDetails: true,
            callback: function (data) {
                debugger;
                var symptonsimage = {
                    focalpoint: data.focalPoint,
                    id: data.id,
                    image: data.image,
                    altText: data.altText
                }
                var index = -1;
                var comArr = eval($scope.control.inputs);
                for (var i = 0; i < comArr.length; i++) {
                    if (comArr[i].id === rowid) {
                        index = i;
                        break;
                    }
                }
                $scope.control.inputs[index].symptonsimages.push(symptonsimage);
            }
        });
    }

    $scope.removesymptonsimage = function (index, rowid) {
        var rowindex = -1;
        var comArr = eval($scope.control.inputs);
        for (var i = 0; i < comArr.length; i++) {
            if (comArr[i].id === rowid) {
                rowindex = i;
                break;
            }
        }
        $scope.control.inputs[rowindex].symptonsimages.splice(index, 1);
    };
    $scope.setdiImage1 = function (rowid) {
        debugger;

        $scope["currentRowId"] = rowid;

        dialogService.mediaPicker({
            startNodeId: $scope.control.editor.config && $scope.control.editor.config.startNodeId ? $scope.control.editor.config.startNodeId : undefined,
            multiPicker: false,
            cropSize: $scope.control.editor.config && $scope.control.editor.config.size ? $scope.control.editor.config.size : undefined,
            showDetails: true,
            callback: function (data) {

                debugger;

                var imageRowId = $scope["currentRowId"];
                var index = -1;
                var comArr = eval($scope.control.inputs);
                for (var i = 0; i < comArr.length; i++) {
                    if (comArr[i].id === imageRowId) {
                        index = i;
                        break;
                    }
                }

                if ($scope.control.inputs[index].diimage1 == null) {
                    $scope.control.inputs[index].diimage1 = {};
                }

                $scope.control.inputs[index].diimage1 = {
                    focalPoint: data.focalPoint,
                    id: data.id,
                    image: data.image,
                    altText: data.altText
                };

            }
        });
    };

    $scope.removediImage1 = function (rowid) {
        $scope["currentRowId"] = rowid;
        var imageRowId = $scope["currentRowId"];
        var index = -1;
        var comArr = eval($scope.control.inputs);
        for (var i = 0; i < comArr.length; i++) {
            if (comArr[i].id === imageRowId) {
                index = i;
                break;
            }
        }
        delete $scope.control.inputs[index].diimage1;
    }

    $scope.setdiImage2 = function (rowid) {
        debugger;

        $scope["currentRowId"] = rowid;

        dialogService.mediaPicker({
            startNodeId: $scope.control.editor.config && $scope.control.editor.config.startNodeId ? $scope.control.editor.config.startNodeId : undefined,
            multiPicker: false,
            cropSize: $scope.control.editor.config && $scope.control.editor.config.size ? $scope.control.editor.config.size : undefined,
            showDetails: true,
            callback: function (data) {

                debugger;

                var imageRowId = $scope["currentRowId"];
                var index = -1;
                var comArr = eval($scope.control.inputs);
                for (var i = 0; i < comArr.length; i++) {
                    if (comArr[i].id === imageRowId) {
                        index = i;
                        break;
                    }
                }

                if ($scope.control.inputs[index].diimage2 == null) {
                    $scope.control.inputs[index].diimage2 = {};
                }

                $scope.control.inputs[index].diimage2 = {
                    focalPoint: data.focalPoint,
                    id: data.id,
                    image: data.image,
                    altText: data.altText
                };

            }
        });
    };

    $scope.removediImage2 = function (rowid) {
        $scope["currentRowId"] = rowid;
        var imageRowId = $scope["currentRowId"];
        var index = -1;
        var comArr = eval($scope.control.inputs);
        for (var i = 0; i < comArr.length; i++) {
            if (comArr[i].id === imageRowId) {
                index = i;
                break;
            }
        }
        delete $scope.control.inputs[index].diimage2;
    }

    $scope.setdiImage3 = function (rowid) {
        debugger;

        $scope["currentRowId"] = rowid;

        dialogService.mediaPicker({
            startNodeId: $scope.control.editor.config && $scope.control.editor.config.startNodeId ? $scope.control.editor.config.startNodeId : undefined,
            multiPicker: false,
            cropSize: $scope.control.editor.config && $scope.control.editor.config.size ? $scope.control.editor.config.size : undefined,
            showDetails: true,
            callback: function (data) {

                debugger;

                var imageRowId = $scope["currentRowId"];
                var index = -1;
                var comArr = eval($scope.control.inputs);
                for (var i = 0; i < comArr.length; i++) {
                    if (comArr[i].id === imageRowId) {
                        index = i;
                        break;
                    }
                }

                if ($scope.control.inputs[index].diimage3 == null) {
                    $scope.control.inputs[index].diimage3 = {};
                }

                $scope.control.inputs[index].diimage3 = {
                    focalPoint: data.focalPoint,
                    id: data.id,
                    image: data.image,
                    altText: data.altText
                };

            }
        });
    };

    $scope.removediImage3 = function (rowid) {
        $scope["currentRowId"] = rowid;
        var imageRowId = $scope["currentRowId"];
        var index = -1;
        var comArr = eval($scope.control.inputs);
        for (var i = 0; i < comArr.length; i++) {
            if (comArr[i].id === imageRowId) {
                index = i;
                break;
            }
        }
        delete $scope.control.inputs[index].diimage3;
    }

    $scope.setdiImage4 = function (rowid) {
        debugger;

        $scope["currentRowId"] = rowid;

        dialogService.mediaPicker({
            startNodeId: $scope.control.editor.config && $scope.control.editor.config.startNodeId ? $scope.control.editor.config.startNodeId : undefined,
            multiPicker: false,
            cropSize: $scope.control.editor.config && $scope.control.editor.config.size ? $scope.control.editor.config.size : undefined,
            showDetails: true,
            callback: function (data) {

                debugger;

                var imageRowId = $scope["currentRowId"];
                var index = -1;
                var comArr = eval($scope.control.inputs);
                for (var i = 0; i < comArr.length; i++) {
                    if (comArr[i].id === imageRowId) {
                        index = i;
                        break;
                    }
                }

                if ($scope.control.inputs[index].diimage4 == null) {
                    $scope.control.inputs[index].diimage4 = {};
                }

                $scope.control.inputs[index].diimage4 = {
                    focalPoint: data.focalPoint,
                    id: data.id,
                    image: data.image,
                    altText: data.altText
                };

            }
        });
    };

    $scope.removediImage4 = function (rowid) {
        $scope["currentRowId"] = rowid;
        var imageRowId = $scope["currentRowId"];
        var index = -1;
        var comArr = eval($scope.control.inputs);
        for (var i = 0; i < comArr.length; i++) {
            if (comArr[i].id === imageRowId) {
                index = i;
                break;
            }
        }
        delete $scope.control.inputs[index].diimage4;
    }
});


angular.module("umbraco").controller("CHControls.MultipleImagewithRadioController", function ($scope, $rootScope, $location, $routeParams, $timeout, $http, $log, dialogService) {
    $scope.control.radiocollection = $scope.control.editor.config.radiocollection;
    if ($scope.control.position == null) {
        $scope.control.position = $scope.control.editor.config.radiodefaultvalue;
    }
    $scope.setImage = function (imageName) {

        $scope["imgName"] = imageName;

        dialogService.mediaPicker({
            startNodeId: $scope.control.editor.config && $scope.control.editor.config.startNodeId ? $scope.control.editor.config.startNodeId : undefined,
            multiPicker: false,
            cropSize: $scope.control.editor.config && $scope.control.editor.config.size ? $scope.control.editor.config.size : undefined,
            showDetails: true,
            callback: function (data) {

                debugger;

                var imageNameKey = $scope["imgName"];


                if ($scope.control.value == null) {
                    $scope.control.value = { images: {} };
                }
                if ($scope.control.value.images == null) {
                    $scope.control.value.images = {};
                }

                $scope.control.value.images[imageNameKey] = {
                    focalPoint: data.focalPoint,
                    id: data.id,
                    image: data.image,
                    altText: data.altText
                };

                $scope.setUrl();
            }
        });
    };

    $scope.setUrl = function () {

        if ($scope.control.value && $scope.control.value.image) {
            var url = $scope.control.value.image;

            if ($scope.control.editor.config && $scope.control.editor.config.size) {
                url += "?width=" + $scope.control.editor.config.size.width;
                url += "&height=" + $scope.control.editor.config.size.height;

                if ($scope.control.value.focalPoint) {
                    url += "&center=" + $scope.control.value.focalPoint.top + "," + $scope.control.value.focalPoint.left;
                    url += "&mode=crop";
                }
            }
            $scope.url = url;
        }
    };
    $scope.removeImage = function (imageName) {
        delete $scope.control.value.images[imageName];
    }

});

angular.module("umbraco").controller("CHControls.StackedTextBoxeswithImagewithRadioController", function ($scope, $rootScope, $location, $routeParams, $timeout, $http, $log, dialogService) {

    $scope.control.radiocollection = $scope.control.editor.config.radiocollection;
    if ("inputs" in $scope.control) {
        var input = $scope.control.inputs;
        $scope.control.inputs = input;
    } else {
        $scope.control.id = 1;
        $scope.control.inputs = [{ 'heading': '', 'rteValue': '', 'image': null, 'position': $scope.control.editor.config.radiodefaultvalue, 'id': $scope.control.id }];
    }

    $scope.AddRow = function () {
        $scope.control.id++;
        $scope.control.inputs.push({ 'heading': '', 'rteValue': '', 'image': null, 'position': $scope.control.editor.config.radiodefaultvalue, 'id': $scope.control.id });
    }

    $scope.setimage = function (rowid) {
        debugger;

        $scope["currentRowId"] = rowid;

        dialogService.mediaPicker({
            startNodeId: $scope.control.editor.config && $scope.control.editor.config.startNodeId ? $scope.control.editor.config.startNodeId : undefined,
            multiPicker: false,
            cropSize: $scope.control.editor.config && $scope.control.editor.config.size ? $scope.control.editor.config.size : undefined,
            showDetails: true,
            callback: function (data) {

                debugger;

                var imageRowId = $scope["currentRowId"];
                var index = -1;
                var comArr = eval($scope.control.inputs);
                for (var i = 0; i < comArr.length; i++) {
                    if (comArr[i].id === imageRowId) {
                        index = i;
                        break;
                    }
                }

                if ($scope.control.inputs[index].image == null) {
                    $scope.control.inputs[index].image = {};
                }

                $scope.control.inputs[index].image = {
                    focalPoint: data.focalPoint,
                    id: data.id,
                    image: data.image,
                    altText: data.altText
                };

            }
        });
    };

    $scope.removeimage = function (rowid) {
        $scope["currentRowId"] = rowid;
        var imageRowId = $scope["currentRowId"];
        var index = -1;
        var comArr = eval($scope.control.inputs);
        for (var i = 0; i < comArr.length; i++) {
            if (comArr[i].id === imageRowId) {
                index = i;
                break;
            }
        }
        delete $scope.control.inputs[index].image;
    }
    $scope.RemoveRow = function (id) {
        var index = -1;
        var comArr = eval($scope.control.inputs);
        for (var i = 0; i < comArr.length; i++) {
            if (comArr[i].id === id) {
                index = i;
                break;
            }
        }
        if (index === -1) {
            alert("Something gone wrong");
        }
        $scope.control.inputs.splice(index, 1);
    };


});

angular.module("umbraco").controller("CHControls.StackedNumberedInfoController", function ($scope, $rootScope, $location, $routeParams, $timeout, $http, $log, dialogService) {

    $scope.control.radiocollection = $scope.control.editor.config.radiocollection;
    if ("inputs" in $scope.control) {
        var input = $scope.control.inputs;
        $scope.control.inputs = input;
    } else {
        $scope.control.id = 1;
        $scope.control.inputs = [{ 'heading': '', 'rteValue': '', 'image': null, 'position': $scope.control.editor.config.radiodefaultvalue, 'id': $scope.control.id }];
    }

    $scope.AddRow = function () {
        $scope.control.id++;
        $scope.control.inputs.push({ 'heading': '', 'rteValue': '', 'image': null, 'position': $scope.control.editor.config.radiodefaultvalue, 'id': $scope.control.id });
    }

    $scope.setimage = function (rowid) {
        debugger;

        $scope["currentRowId"] = rowid;

        dialogService.mediaPicker({
            startNodeId: $scope.control.editor.config && $scope.control.editor.config.startNodeId ? $scope.control.editor.config.startNodeId : undefined,
            multiPicker: false,
            cropSize: $scope.control.editor.config && $scope.control.editor.config.size ? $scope.control.editor.config.size : undefined,
            showDetails: true,
            callback: function (data) {

                debugger;

                var imageRowId = $scope["currentRowId"];
                var index = -1;
                var comArr = eval($scope.control.inputs);
                for (var i = 0; i < comArr.length; i++) {
                    if (comArr[i].id === imageRowId) {
                        index = i;
                        break;
                    }
                }

                if ($scope.control.inputs[index].image == null) {
                    $scope.control.inputs[index].image = {};
                }

                $scope.control.inputs[index].image = {
                    focalPoint: data.focalPoint,
                    id: data.id,
                    image: data.image,
                    altText: data.altText
                };

            }
        });
    };

    $scope.removeimage = function (rowid) {
        $scope["currentRowId"] = rowid;
        var imageRowId = $scope["currentRowId"];
        var index = -1;
        var comArr = eval($scope.control.inputs);
        for (var i = 0; i < comArr.length; i++) {
            if (comArr[i].id === imageRowId) {
                index = i;
                break;
            }
        }
        delete $scope.control.inputs[index].image;
    }
    $scope.RemoveRow = function (id) {
        var index = -1;
        var comArr = eval($scope.control.inputs);
        for (var i = 0; i < comArr.length; i++) {
            if (comArr[i].id === id) {
                index = i;
                break;
            }
        }
        if (index === -1) {
            alert("Something gone wrong");
        }
        $scope.control.inputs.splice(index, 1);
    };


});

angular.module("umbraco").controller("CHControls.WhiteboxwithorangetoprowController", function ($scope, $rootScope, $location, $routeParams, $timeout, $http, $log, dialogService) {
    $scope.control.radiocollection = $scope.control.editor.config.radiocollection;
    if ($scope.control.toprowcontenttype == null) {
        $scope.control.toprowcontenttype = $scope.control.editor.config.radiodefaultvalue;
    }
    if ($scope.control.bottomrowcontenttype == null) {
        $scope.control.bottomrowcontenttype = $scope.control.editor.config.radiodefaultvalue;
    }
    $scope.setImage = function (imageName) {

        $scope["imgName"] = imageName;

        dialogService.mediaPicker({
            startNodeId: $scope.control.editor.config && $scope.control.editor.config.startNodeId ? $scope.control.editor.config.startNodeId : undefined,
            multiPicker: false,
            cropSize: $scope.control.editor.config && $scope.control.editor.config.size ? $scope.control.editor.config.size : undefined,
            showDetails: true,
            callback: function (data) {

                debugger;

                var imageNameKey = $scope["imgName"];


                if ($scope.control.value == null) {
                    $scope.control.value = { images: {} };
                }
                if ($scope.control.value.images == null) {
                    $scope.control.value.images = {};
                }

                $scope.control.value.images[imageNameKey] = {
                    focalPoint: data.focalPoint,
                    id: data.id,
                    image: data.image,
                    altText: data.altText
                };

                $scope.setUrl();
            }
        });
    };

    $scope.setUrl = function () {

        if ($scope.control.value && $scope.control.value.image) {
            var url = $scope.control.value.image;

            if ($scope.control.editor.config && $scope.control.editor.config.size) {
                url += "?width=" + $scope.control.editor.config.size.width;
                url += "&height=" + $scope.control.editor.config.size.height;

                if ($scope.control.value.focalPoint) {
                    url += "&center=" + $scope.control.value.focalPoint.top + "," + $scope.control.value.focalPoint.left;
                    url += "&mode=crop";
                }
            }
            $scope.url = url;
        }
    };
    $scope.removeImage = function (imageName) {
        delete $scope.control.value.images[imageName];
    }

});
angular.module("umbraco").controller("CHControls.FlagColorPicker", function ($scope) {
    if ($scope.control.flagbox1color == null) {
        $scope.control.flagbox1color = $scope.control.editor.config.flagbox1color;
    }
    if ($scope.control.flagbox2color == null) {
        $scope.control.flagbox2color = $scope.control.editor.config.flagbox2color;
    }
    if ($scope.control.flagbox3color == null) {
        $scope.control.flagbox3color = $scope.control.editor.config.flagbox3color;
    }
});

angular.module("umbraco").controller("CHControls.SmallBoxController", function ($scope, $rootScope, $location, $routeParams, $timeout, $http, $log, dialogService) {

    if ("inputs" in $scope.control) {
        var input = $scope.control.inputs;
        $scope.control.inputs = input;
    } else {
        $scope.control.id = 1;
        $scope.control.inputs = [{ 'heading': '', 'image': null, 'content': '', 'id': $scope.control.id }];
        $scope.control.addshow = true;
    }

    $scope.AddBox = function () {
        $scope.control.id++;
        $scope.control.inputs.push({ 'heading': '', 'image': null, 'content': '', 'id': $scope.control.id });
        if ($scope.control.id <= 2) {
            $scope.control.addshow = true;
        }
        else {
            $scope.control.addshow = false;
        }
    }

    $scope.setimage = function (rowid) {
        debugger;

        $scope["currentRowId"] = rowid;

        dialogService.mediaPicker({
            startNodeId: $scope.control.editor.config && $scope.control.editor.config.startNodeId ? $scope.control.editor.config.startNodeId : undefined,
            multiPicker: false,
            cropSize: $scope.control.editor.config && $scope.control.editor.config.size ? $scope.control.editor.config.size : undefined,
            showDetails: true,
            callback: function (data) {

                debugger;

                var imageRowId = $scope["currentRowId"];
                var index = -1;
                var comArr = eval($scope.control.inputs);
                for (var i = 0; i < comArr.length; i++) {
                    if (comArr[i].id === imageRowId) {
                        index = i;
                        break;
                    }
                }

                if ($scope.control.inputs[index].image == null) {
                    $scope.control.inputs[index].image = {};
                }

                $scope.control.inputs[index].image = {
                    focalPoint: data.focalPoint,
                    id: data.id,
                    image: data.image,
                    altText: data.altText
                };

            }
        });
    };

    $scope.removeimage = function (rowid) {
        $scope["currentRowId"] = rowid;
        var imageRowId = $scope["currentRowId"];
        var index = -1;
        var comArr = eval($scope.control.inputs);
        for (var i = 0; i < comArr.length; i++) {
            if (comArr[i].id === imageRowId) {
                index = i;
                break;
            }
        }
        delete $scope.control.inputs[index].image;
    }
    $scope.RemoveBox = function (id) {
        var index = -1;
        var comArr = eval($scope.control.inputs);
        for (var i = 0; i < comArr.length; i++) {
            if (comArr[i].id === id) {
                index = i;
                break;
            }
        }
        if (index === -1) {
            alert("Something gone wrong");
        }
        $scope.control.inputs.splice(index, 1);
        if ($scope.control.id <= 2) {
            $scope.control.addshow = true;
        }
        else {
            $scope.control.addshow = false;
        }
    };


});
angular.module("umbraco").controller("CHControls.ConnectedTextBoxesController", function ($scope, $rootScope, $location, $routeParams, $timeout, $http, $log, dialogService) {
    $scope.control.radiocollection = $scope.control.editor.config.radiocollection;
    if ($scope.control.position == null) {
        $scope.control.position = $scope.control.editor.config.radiodefaultvalue;
    }
    if (("tabData" in $scope.control)) {
        var tableOldData = $scope.control.tabData;
        $scope.control.tabelsData = tableOldData;
    }
    else {
        $scope.control.id = 1;
        //$scope.control.tabelsData.push({ 'heading': '', 'content': '', 'image': null, id: $scope.control.id });
        $scope.control.tabelsData = [{ 'heading': '', 'content': '', 'image': null, 'id': $scope.control.id }];
    }
    $scope.ChangeContent = function () {
        var tabelData = $scope.control.tabelsData;
        $scope.control.tabData = tabelData;
    };

    $scope.AddRow = function () {
        $scope.control.id++;
        $scope.control.tabelsData.push({ 'heading': '', 'content': '', 'image': null, id: $scope.control.id });
    };

    $scope.setImage = function (rowid) {
        debugger;

        $scope["currentRowId"] = rowid;

        dialogService.mediaPicker({
            startNodeId: $scope.control.editor.config && $scope.control.editor.config.startNodeId ? $scope.control.editor.config.startNodeId : undefined,
            multiPicker: false,
            cropSize: $scope.control.editor.config && $scope.control.editor.config.size ? $scope.control.editor.config.size : undefined,
            showDetails: true,
            callback: function (data) {

                debugger;

                var imageRowId = $scope["currentRowId"];
                var index = -1;
                var comArr = eval($scope.control.tabelsData);
                for (var i = 0; i < comArr.length; i++) {
                    if (comArr[i].id === imageRowId) {
                        index = i;
                        break;
                    }
                }

                if ($scope.control.tabelsData[index].image == null) {
                    $scope.control.tabelsData[index].image = {};
                }

                $scope.control.tabelsData[index].image = {
                    focalPoint: data.focalPoint,
                    id: data.id,
                    image: data.image,
                    altText: data.altText
                };

                $scope.ChangeContent();

            }
        });
    };

    $scope.removeImage = function (rowid) {
        $scope["currentRowId"] = rowid;
        var imageRowId = $scope["currentRowId"];
        var index = -1;
        var comArr = eval($scope.control.tabelsData);
        for (var i = 0; i < comArr.length; i++) {
            if (comArr[i].id === imageRowId) {
                index = i;
                break;
            }
        }
        delete $scope.control.tabelsData[index].image;
    }
    $scope.RemoveRow = function (id) {
        var index = -1;
        var comArr = eval($scope.control.tabelsData);
        for (var i = 0; i < comArr.length; i++) {
            if (comArr[i].id === id) {
                index = i;
                break;
            }
        }
        if (index === -1) {
            alert("Something gone wrong");
        }
        $scope.control.tabelsData.splice(index, 1);
        $scope.ChangeContent();
    };
});