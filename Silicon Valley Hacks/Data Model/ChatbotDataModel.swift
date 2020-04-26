//
//  ChatbotDataModel.swift
//  Silicon Valley Hacks
//
//  Created by Arjun Sharma on 25/04/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

import Foundation

enum ChatbotMessageType {
    case fromChatbot, toChatbot
}
struct MessageChatbot: Identifiable {
    var text: String
    var timeSent: Date
    var type: ChatbotMessageType
    var id = UUID()
    
}


