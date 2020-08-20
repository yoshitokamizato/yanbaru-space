import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  consumer.subscriptions.create("RoomChannel", {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received: function(data) {
    let DirectMessage = document.getElementById('direct_messages')
    DirectMessage.append(data["direct_message"])
    },

    speak: function(direct_message) {
      return this.perform('speak',{
         direct_message: direct_message
      });
    }
  });


  $(document).on('keypress', '[data-behavior~=community_speaker]', function(event) {
    if (event.keyCode === 13) {
      chatChannel.speak(event.target.value);
      event.target.value = '';
      return event.preventDefault();
    }
  });
})
