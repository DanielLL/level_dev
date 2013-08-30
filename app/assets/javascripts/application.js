// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree ./libs
//= require main
//= require_tree .
//
function allowDrop(ev)
{
  ev.preventDefault();
}

function drag(ev)
{
  ev.dataTransfer.setData("id",ev.target.id);
}

function drop(ev)
{
  ev.preventDefault();
  var $element = $("li .skill[id='"+ev.dataTransfer.getData("id")+"']")
  var $container = $(ev.target).find(".tab-pane.active");

  if ($element.parents("li").attr("id") === $container.attr("id")){
    $element.addClass("span2 skill img-rounded");
    debugger
    $element.find("input").prop("checked", true)
    $container.find("ul").append($element);
  }
}
