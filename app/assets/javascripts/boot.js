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

