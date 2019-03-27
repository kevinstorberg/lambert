function slideUpMessages() {
  var flash_messages = $('.alert').length
  var timeout = 2000 + (flash_messages - 1) * 1000
  return setTimeout((function() {
    $('.alert').each(function() {
      if ($(this).find('a').length == 0) {
        $(this).slideUp();
      };
    });
  }), timeout);
};
