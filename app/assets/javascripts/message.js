$(function(){
  $('#create_massage').on('submit', function(e){
    e.preventDefault();

    var formData = new FormData();
    var url = $(this).attr('action');
    // for(item of formData) console.log(item);
    // console.log();

    $.ajax({
      url: '/room/messages/:message_id/make_message',
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      console.log(出来ている);
    })
    .fail(function(){
      alert('error');
    })
  });
});