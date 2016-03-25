// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require handlebars
//= require handlebars.runtime
//= require bootstrap-sprockets
//= require_tree .


$(window).load(function(){


  $("button.Search").click(function(){
    var query = $("#q").val();
    $.get( "/search", { q:query } )
      .done(function( data ) {
        var result = HandlebarsTemplates['videos/teste'](data);
        $(".container-list").html(result)
    });
  
  });

});

