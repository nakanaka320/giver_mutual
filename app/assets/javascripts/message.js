$(function(){
  function buildHTML(message) {
    var html = `<div class="chat_message_index_list_index">
                  <div class="chat_message_index_list_value">
                    <div class="chat_message_index_list_index_name">
                      ${message.user_name}
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
  $(document).on('turbolinks:load', function(){
    $('#create_massage').on('submit', function(e){
      e.preventDefault();
      
      var formData = new FormData(this);
      console.log(formData);
      var url = $(this).attr('action');
    //  debugger;
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
        console.log(data);
      })
      .fail(function(){
        alert('error');
      })
    })
  });
});