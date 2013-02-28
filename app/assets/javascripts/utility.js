$(document).ready(function() {
  
  // clicking the flash helper faded the messages out immediately
  $('#flash_helper > div').live('click', function(){
    $(this).remove();
  });
  // animation of the flash notices
  $('#flash_helper > div').delay(2000).fadeOut('fast', function(){
    $(this).remove();
  });

});

// General Utility Functions
Utility = {
  
  // Easy way to log without breaking IE
  log: function(message) {
    if ( window.console && window.console.log ){
      window.console.log(message);
    }
  },
  
  // Simple way to call koh_notifications
  notification: function(message){
    // Notification Template    
    var notification_template = '<div class="notification ' + type + '">' + message + '</div>';
    // Append the notification to the notification container
    $('#flash_helper').append(notification_template);
  },
  
  // Clear all notifications
  clear_notifications: function() {
    $('#flash_helper').html('');
  },
  
  
}