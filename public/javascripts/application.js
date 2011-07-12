$(document).ready(function(){
  tipsyInit();
  fancyboxInit();
  magicBarInit();
});

function tipsyInit() {
  $("#footboxRight div a").tipsy({gravity: 's'});
  $("#headerSocial a").tipsy({gravity: 'n'});
  $("#adminLinks a").tipsy({gravity: 'n'});
}

function fancyboxInit() {
  $('a.faceboxLink').facebox()
}

function magicBarInit() {
  magicBarIconClickInit();
  magicBarChangeModeInit();
}

  function magicBarIconClickInit() {
    $("#mbTermIcon").click(function() {
      $("#magicbar").submit();
    });
  }
  
  function magicBarChangeModeInit() {
    $("#mbTerm").keyup(function() {
      if($("#mbTerm").val().substring(1,0) == "!") {
        magicBarChangeModeChange(true);
      } else {
        magicBarChangeModeChange(false);
      }
    });
  }
  
  function magicBarChangeModeChange(executeMode) {
    if (executeMode) {
      $("#mbTermIcon").addClass("execute");
    } else {
      $("#mbTermIcon").removeClass("execute");
    }
  }
