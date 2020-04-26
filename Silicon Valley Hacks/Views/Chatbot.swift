//
//  Chatbot.swift
//  Silicon Valley Hacks
//
//  Created by Arjun Sharma on 25/04/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

import SwiftUI
import PythonKit




struct ChatbotView: View {
    

    @State var messagesToAndFromChatbot: [MessageChatbot] = [MessageChatbot(text: "Message to me message message message message", timeSent: Date(), type: .fromChatbot), MessageChatbot(text: "Message to chatbot to chatbot to chatbot message message message message", timeSent: Date(), type: .toChatbot)]
    
    @State var messageToSendToChatbot = ""
    
    let pickle = Python.get(member: "import")("pickle")
   let file = Python.get(member: "open")("lonely.py")
    
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
    
    func getMessageFromChatbot(inputMessage: String){

        let blob = file.get(member: "read")()
        let result = pickle.get(member: "loads")(blob)
        let messageFromChatbot = ChatbotView
        let messageToAppend = MessageChatbot(text: "Message from chatbot for input \(inputMessage)", timeSent: Date(), type: .fromChatbot)
        messagesToAndFromChatbot.append(messageToAppend)
    }
}

struct Chatbot_Previews: PreviewProvider {
    static var previews: some View {
        ChatbotView()
    }
}

