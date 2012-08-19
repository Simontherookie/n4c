jQuery(function($) {

  $("form.edit_guest").on("ajax:beforeSend", function(){
    var going_to_reception = $(this).find("input[name='guest[going_to_reception]']");
    var button = $(this).find("input.btn");

    var going_count_h2 = $("h2[data-role='going-to-reception-count']");
    var not_going_count_h2 = $("h2[data-role='not-going-to-reception-count']");

    var going_count = parseInt(going_count_h2.html());
    var not_going_count = parseInt(not_going_count_h2.html());

    if(going_to_reception.val() == "true"){
      button.removeClass("btn-danger");
      button.addClass("btn-success");
      button.val("Invited");
      
      going_to_reception.val("false");

      going_count_h2.html(going_count + 1);
      not_going_count_h2.html(not_going_count - 1);
    }else{
      button.removeClass("btn-success");
      button.addClass("btn-danger");
      button.val("Not invited");

      going_to_reception.val("true");

      going_count_h2.html(going_count - 1);
      not_going_count_h2.html(not_going_count + 1);     
    }
  })

});