// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  $(".desc").hover(
    function(){
      $(this).append($("<button type='button' value='lab'>kenkyu</button><button type='button' value='game'>game</button>"));
      $("button").click(function(){
        alert($(this).closest("tr").attr("id"));
      });
    },
    function(){
      $(this).find("button").remove();
    });
});
