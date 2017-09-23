App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data){
    console.log('received');
    $('#messages').removeClass('hidden');
    return $('#messages').append(this.renderMessage(data));
  },
  renderMessage: function(data){
    return '<p><b>' + data.user + '</b>: ' + data.message + '</p>';
  }
});
