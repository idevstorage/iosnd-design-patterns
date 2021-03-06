//: Playground - noun: a place where people can play

import UIKit

class MessageSender {
    func send(message: Message) {
        for recipient in message.recipients {
            // Send message to recipient
        }
    }
}

struct Message {
    let id: String
    let text: String
    let recipients: [String]
}

struct LegacyMessage {
    let id: String
    let text: String
    let recipient: String
}

struct LegacyMessageAdapter {
    let legacyMessage: LegacyMessage
    
    var message: Message {
        return Message(id: legacyMessage.id, text: legacyMessage.text, recipients: [legacyMessage.recipient])
    }
}

// Usage
let messageSender = MessageSender()
let legacyMessage = LegacyMessage(id: "abc", text: "hello", recipient: "john")
let legacyMessageAdapter = LegacyMessageAdapter(legacyMessage: legacyMessage)
messageSender.send(message: legacyMessageAdapter.message)

