// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
  $(".desc").hover( function(){
      $(this).children("button").toggle();
      $("button").click(function(){
        paramId = $(this).closest("tr").attr("id");
        paramLabel = $(this).val();
        postLabel(paramId, paramLabel);
      });
    });
});

var postLabel = function(dataId, dataLabel){
  postUrl = "/yukky/update.json";
  postData = { id: dataId, label: dataLabel, authenticity_token: getCSRFtoken() };
  returnType = "text";

  jQuery.post(postUrl, postData, postLabelCallback, returnType).fail(failFunc);
  return false;
}

var postLabelCallback = function(){
  alert("post ok");
}

var failFunc = function(){
  alert("failed");
}

function getCSRFtoken(){
  return $("meta[name=csrf-token]").attr("content");
}
