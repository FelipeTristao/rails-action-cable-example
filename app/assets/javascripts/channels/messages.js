App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data){
    var msgDiv = '#messages-chatroom-' + data.chatroom;
    $(msgDiv).removeClass('hidden');
    return $(msgDiv).append(this.renderMessage(data));
  },
  renderMessage: function(data){
    return '<p><b>' + data.user + '</b>: ' + data.message + '</p>';
  }
});
