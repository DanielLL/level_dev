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

function allowDrop(ev)
{
  ev.preventDefault();
}

function drag(ev)
{
  var c_lass = $(ev.target).parents(".skills_area").attr("class");
  if (c_lass === undefined) {
    c_lass = $(ev.target).parent().attr("class")
  }
  ev.dataTransfer.setData("id",ev.target.id);
  ev.dataTransfer.setData("type", c_lass);
}

function drop(ev)
{
  ev.preventDefault();
  var $element = $("li .skill[id='"+ev.dataTransfer.getData("id")+"']")
  var $container = $(".tab-pane.active");

  if (ev.dataTransfer.getData("type") === "skills_area" && $(ev.target).find(".tab-content").size()===1) {
    if ($element.parents("li").attr("id") === $container.attr("id")){
      $element.addClass("span2 skill img-rounded");
      $element.find("input").prop("checked", true);
      $container.find(".skill[id='"+$element.attr("id")+"']").show();
      $element.hide();
    }
  }
  if (ev.dataTransfer.getData("type") === "dev_skills" && $(ev.target).parent().hasClass("area")) {
    if ( $(ev.target).parent().attr("id") === $container.attr("id")) {
      $to_hide = $container.find(".skill[id='"+ev.dataTransfer.getData("id")+"']");
      $to_show = $(ev.target).parent().find(".skill[id='"+ev.dataTransfer.getData("id")+"']");
      $to_hide.hide();
      $to_show.show();
      $to_show.find("input").prop("checked", false);
    }
  }
}
