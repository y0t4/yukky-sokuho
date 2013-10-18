// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
  $(".desc").hover( function(){
    $(this).children("button").toggle();
  });
  $("button[value='lab']").bind("click", function(){
    var paramId = $(this).closest("tr").attr("id");
    var paramLabel = $(this).val();
    postLabel(paramId, paramLabel);
  });
  $("button[value='game']").bind("click", function(){
    var paramId = $(this).closest("tr").attr("id");
    var paramLabel = $(this).val();
    postLabel(paramId, paramLabel);
  });


});

var postLabel = function(dataId, dataLabel){
  var postUrl = "/yukky/update.json";
  var postData = { id: dataId, yukky: { label: dataLabel }, authenticity_token: getCSRFtoken() };

  $.post(postUrl, postData, postLabelCallback ).fail(failFunc);
  return false;
}

var postLabelCallback = function(data,status){

  console.log(status);
  console.log(data.label);

  switch (data['label']) {
    case "lab":
      $("#"+data['id']).css({backgroundColor:"yellow"});
      break;
    case "game":
      $("#"+data['id']).css({backgroundColor:"red"});
      break;
  }
}

var failFunc = function(){
  alert("failed");
}

function getCSRFtoken(){
  return $("meta[name=csrf-token]").attr("content");
}
