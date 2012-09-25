jQuery(function($) {

  function rsvpToSentence(){
    var going_to = [];
    
    if($("input#guest_rsvp_wedding_true").is(":checked")){
      going_to.push("the wedding");
    }
    if($("input#guest_rsvp_reception_true").is(":checked")){
      going_to.push("the reception");
    }
    if($("input#guest_rsvp_bbq_true").is(":checked")){
      going_to.push("the bbq");
    }

    var sentence = "";

    switch (going_to.length){
      case 0:
        sentence = "nothing"
        break;
      case 1:
        sentence += going_to[0];
        break;
      case 2:
        sentence = going_to[0]+" and "+going_to[1];
        break;
      case 3:
        sentence = going_to[0]+", "+going_to[1]+", and "+going_to[2];
        break;
    }

    $("span.rsvp_status").html(sentence);
  }

  $("form.edit_guest").on("change", "input[type='radio']", function(){
    rsvpToSentence()
  });

  if($("form.edit_guest").length){
    rsvpToSentence();
  }

});