$(function(){

  var duration = 500;
  var $aside = $('.taskbar');
  var $asidButton = $aside.find('#open_close')
      .on('click', function(){
          $aside.toggleClass('open');
          if($aside.hasClass('open')){
              $aside.stop(true).animate({right: '-70px'}, duration, 'easeOutBack');
              $asidButton.find('img').attr('src', '/assets/btn_close.png');
          }else{
              $aside.stop(true).animate({right: '-760px'}, duration, 'easeInBack');
              $asidButton.find('img').attr('src', '/assets/btn_open.png');
          };
      });

});