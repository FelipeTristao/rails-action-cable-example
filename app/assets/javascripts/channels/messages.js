App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data){
    var msgDiv = '#messages-chatroom-' + data.chatroom;
    $(msgDiv).removeClass('hidden');
    $('#message_text').val('');
    return $(msgDiv).append(this.renderMessage(data));
  },
  renderMessage: function(data){
    var html = `
      <div class="mine">
        <span class="author">`+ data.user +`</span>
        <span class="message">
          `+ data.message +`
        </span>
      </div>
    `;
    return html;
  }
});
