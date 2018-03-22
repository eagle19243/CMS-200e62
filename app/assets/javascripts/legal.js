$(function() {
  $('.legalese').click(function(event) {
    event.preventDefault();
    var legal_pane = $('.legal-pane-wrapper');

    $(legal_pane).scrollTop(0);
    $(legal_pane).toggleClass('show');
  });
});