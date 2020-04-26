//
//  Notification.swift
//  Silicon Valley Hacks
//
//  Created by Arjun Sharma on 23/04/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

import Foundation

enum NotificationStatus {
    case sent, accepted, rejected
}
struct Notification: Identifiable {
    var sendingUser: User
    var receivingUser: User
    var status: NotificationStatus
    var id =  UUID()
    
}
