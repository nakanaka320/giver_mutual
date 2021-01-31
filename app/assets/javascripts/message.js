$(function(){
  function buildHTML(message) {
    var html = `<div class="chat_message_index_list_index">
                  <div class="chat_message_index_list_value">
                    <div class="chat_message_index_list_index_name">
                      ${message.member_id}
                    </div>
                    <div class="chat_message_index_list_index_time">
                      ${message.created_at}
                    </div>
                  </div>
                  <div class="chat_message_index_list_index_content">
                    ${message.content}
                  </div>
                </div>`
    return html;
              };
  $('#create_massage').on('submit', function(e){
    e.preventDefault();

    var formData = new FormData(this);
    var url = $(this).attr('action');

    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.chat_message_index_list').append(html);
      console.log('成功');
    })
    .fail(function(){
      alert('error');
    })
  });
});