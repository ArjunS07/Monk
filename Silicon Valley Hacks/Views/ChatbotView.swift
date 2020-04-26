//
//  Chatbot.swift
//  Silicon Valley Hacks
//
//  Created by Arjun Sharma on 25/04/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

import SwiftUI

struct ChatbotView: View {
    

    @State var messagesToAndFromChatbot: [MessageChatbot] = [MessageChatbot(text: "Message to me message message message message", timeSent: Date(), type: .fromChatbot), MessageChatbot(text: "Message to chatbot to chatbot to chatbot message message message message", timeSent: Date(), type: .toChatbot)]
    
    @State var messageToSendToChatbot = ""
    

    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(messagesToAndFromChatbot) { message in
                        
                        VStack {
                            ChatbotMessageRow(message: message)
                        }
    //                .padding()
                    }
                }
                .frame(minHeight: UIScreen.screenHeight / 10 * 3, maxHeight: UIScreen.screenHeight / 10 * 7)

                Spacer()
                HStack {
                   TextField("Message chatbot...", text: self.$messageToSendToChatbot).padding(10)
                       .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
                       .cornerRadius(25)
                               
                       Button(action: {
                            if self.messageToSendToChatbot.count > 0 {
                                self.messagesToAndFromChatbot.append(MessageChatbot(text: self.messageToSendToChatbot, timeSent: Date(), type: .toChatbot))
                                self.getMessageFromChatbot(inputMessage: self.messageToSendToChatbot)
                                self.messageToSendToChatbot = ""
                            }
                       }) {
                        Image(systemName: "arrow.right.circle.fill")
                            .foregroundColor((self.messageToSendToChatbot.count > 0) ? Color.blue : Color.gray)
                            .font(.system(size: 30))
                       }
                }.padding()

            }
            .keyboardResponsive()
            .onAppear(perform: emptyAllMessagesOnLoad)
            .navigationBarTitle(Text("Chatbot"), displayMode: .inline)

        }.onAppear {
           
        }

    }
    
    func emptyAllMessagesOnLoad() {
        messagesToAndFromChatbot = []
        messagesToAndFromChatbot.append(MessageChatbot(text: "Hi! How are you feeling?", timeSent: Date(), type: .fromChatbot))
    }
    
        func getStaticResponse(inputMessage: String) -> String{
         var answer = ""
         if (inputMessage.contains("hi") || inputMessage.contains("hello") || inputMessage.contains("hey")) {
            let responses = ["Hi!", "Hello!", "What's up?"]
            answer = responses.randomElement()!
          }
          else if (inputMessage.contains("lonely") || inputMessage.contains("alone") || inputMessage.contains("lone")) {
            let responses = ["It's okay if you feel alone: that's completely normal for now. Just make sure that you know that you always have people here for you. Message a friend if you want.", "Feeling lonely is common, but it's vital that you understand that you need to push through. Remember that there are always people looking out for you."]
            answer = responses.randomElement()!
          }
         else if (inputMessage.contains("sick")) {
            let responses = ["Hey. It's important that if you or a loved one feel sick, you should contact your doctor.", "I'm sorry to hear that. Make sure a doctor knows."]
            answer = responses.randomElement()!
          }
         else if (inputMessage.contains("good") || inputMessage.contains("great")) {
            answer = "That's good. I'm doing pretty well myself. Did anything interesting happen today?"
          }
         else if (inputMessage.contains("no")) {
            answer = "Aw. Well, if you'd like, you can always play a game. That tends to boost spirits."
          }
         else if (inputMessage.contains("yes") || inputMessage.contains("okay")) {
            answer = "Nice, nice."
          }
         else if (inputMessage.contains("die") || inputMessage.contains("death")) {
            answer = "Hey, listen. Things like that are extremely important, and, honestly, I'm probably not the person you should talk to for that. I'd recommend reaching out."
          }
         else if (inputMessage.contains("sad")) {
            answer = "Everyone is a little sad right now. It's okay to feel sad, but remember that we're always here for you. Maybe try to do something that makes you happy, like sing a song or play a game?"
          }
         else if (inputMessage.contains("how are you")) {
            answer = "I'm fine, thanks."
          }
         else {
            let responses = ["Mhm.", "Remember that I'm always here for you", "Yes, yes."]
            answer = responses.randomElement()!
          }
        return answer
    }

    
    func getMessageFromChatbot(inputMessage: String){
        let messageToAppend = MessageChatbot(text: getStaticResponse(inputMessage: inputMessage), timeSent: Date(), type: .fromChatbot)
        messagesToAndFromChatbot.append(messageToAppend)
    }
}

struct Chatbot_Previews: PreviewProvider {
    static var previews: some View {
        ChatbotView()
    }
}

