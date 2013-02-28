Forms = {  
  
  // A common method to bind listeners to a form
  bind_listeners: function() {
    // a simple generic way to lock forms, or more commonly prevent submitting forms twice
     $('form').submit(function(){
       if ( $(this).is('.locked') ) {
         return false;
       }
     });
  },
  
  
  // when a form is loading
  form_loading: function(form){
    // we change the label on the submit button (and store the default label, so we can rest it after the post)
    var $btn = $(form).find('input[type="submit"]');
    $btn.attr('data-label', $btn.val());
    $btn.val('processing...');
    // we add a submitting class to the form, this shows the loader and is used to prevent another post
    $(form).addClass('locked');
  },
 
  
}