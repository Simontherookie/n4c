jQuery(function($) {

  $("form.edit_guest").on("ajax:beforeSend", function(){
    var going_to_reception = $(this).find("input[name='guest[going_to_reception]']");
    var button = $(this).find("input.btn");

    if(going_to_reception.val() == "true"){
      button.removeClass("btn-danger");
      button.addClass("btn-success");
      button.val("Invited");
      going_to_reception.val("false");
    }else{
      button.removeClass("btn-success");
      button.addClass("btn-danger");
      button.val("Not invited");
      going_to_reception.val("true");      
    }
  })

});