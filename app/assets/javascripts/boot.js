$(window).load(function(){

 

  $(document).on('click','button.Download',function(){
    
    var button = $(this);
    var id = button.attr("id");
    $.get( "/download", { id:id } )
      .done(function( data ) {
        link = button.siblings(".link-download");
        link.text("Link");
        link.attr("href",data);
        
    })
     .fail(function(){
        container = button.siblings(".error") ;
        container.text("Não foi possivel converter esse video");
    });
  });

  $("button.Search").click(function(){
    var query = $("#q").val();
    $.get( "/search", { q:query } )
      .done(function( data ) {
        var result = HandlebarsTemplates['videos/teste'](data);
        $(".container-list").html(result)
    });
  
  });

});

