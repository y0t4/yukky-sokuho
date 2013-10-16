// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  $(".desc").hover(
    function(){
      $(this).append($("<button>kenkyu</button><button>game</button>"));
    },
    function(){
      $(this).find("button").remove();
    });
});
