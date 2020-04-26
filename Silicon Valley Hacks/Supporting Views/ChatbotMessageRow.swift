//
//  ChatbotMessageView.swift
//  Silicon Valley Hacks
//
//  Created by Arjun Sharma on 25/04/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

import SwiftUI

struct ChatbotMessageRow: View {
    
    var message: MessageChatbot
    
    var body: some View {
        HStack {
            if message.type == .fromChatbot {
                HStack {
                    Text(message.text)
                    .multilineTextAlignment(.leading)
                    .frame(minWidth: 100, maxWidth: 225, minHeight: 50)
                    .foregroundColor(Color.white)
                    .padding(10)
                    
                }
                .background(Color.secondary)
                .cornerRadius(20)

                .frame(minWidth: 100, maxWidth: 225)
//                    .offset(x: -20)
                .padding(10)

                Spacer()
            } else if message.type == .toChatbot {
                Spacer()
                HStack {
                    Text(message.text)
                        .multilineTextAlignment(.leading)
                    .frame(minWidth: 50, maxWidth: 225, minHeight: 50)
                    .foregroundColor(Color.white)
                    .padding(10)

                    
                }
                .background(Color.blue)
                .cornerRadius(20)

                .frame(minWidth: 100, maxWidth: 225)
//                .offset(x: 10)
                .padding(10)
                

            }
        }
    }

}

struct ChatbotMessageRow_Previews: PreviewProvider {
    static var previews: some View {
         
        ChatbotMessageRow(message: MessageChatbot(text: "Message to me message message message message", timeSent: Date(), type: .fromChatbot))
        .previewLayout(.fixed(width: 300, height: 200))
    }
}
