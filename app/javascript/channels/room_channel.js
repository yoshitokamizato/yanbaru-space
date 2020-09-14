import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const chatChannel = consumer.subscriptions.create({ channel: 'RoomChannel', room: $('#direct_messages').data('room_id') }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received: function(data) {
      let DirectMessage = document.getElementById('direct_messages')
      let FormContent = document.getElementById("chat-input")
      let BtnContent = document.getElementById("chat-submit")
      return [DirectMessage.insertAdjacentHTML('beforeend', data["direct_message"]),FormContent.value = "",BtnContent.scrollIntoView(false)]
    },

    speak: function(direct_message) {
      return this.perform('speak',{
         direct_message: direct_message
      });
    }
  });

    // 「送信」クリック時
    const FormContent = document.getElementById("chat-input")
    const BtnContent = document.getElementById("chat-submit")
    BtnContent.addEventListener("click", function(event){
      const content = FormContent.value
      chatChannel.speak(content)
      BtnContent.disabled = true;
    })

    // １番したのメッセージを表示させる
    const documentElement = document.documentElement
    window.messageContent = FormContent
    window.scrollToBottom = () => {
        window.scroll(0, documentElement.scrollHeight)
    }
    scrollToBottom()



    // 内容が無ければボタンを押せなくする
    const button_activation = () => {
        if (FormContent.value === '') {
            BtnContent.classList.add('disabled')

        } else {
            BtnContent.disabled = false;
            BtnContent.classList.remove('disabled')
        }
    }

    FormContent.addEventListener('input', () => {
        button_activation()
    })

    BtnContent.addEventListener('click', () => {
        BtnContent.classList.add('disabled')
    })



})
