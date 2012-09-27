$(document).bind('page:change', function() {
    initializeDocument();
});

$(document).ready(function(){
    initializeDocument();
});

function initializeDocument() {
    tipsyInit();
    fancyboxInit();
}

function tipsyInit() {
    $("header .sociallinks a").tipsy({gravity: 'n'});
    $("footer .cc_icons a").tipsy({gravity: 's'});
}

function fancyboxInit() {
    $('a.faceboxLink').facebox()
}