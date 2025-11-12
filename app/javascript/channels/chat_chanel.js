import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
    connected() {
        console.log("Conectado ao RoomChannel")
    },

    recieved(data) {
        $("#message").append('<div class="msg"><p>' + data.message + '</p><p>' + data.user_name + '</p></div>')
    },

    rejected(data) {
        $("#error").append('<p>' + data.error + '</p>')
    }
})