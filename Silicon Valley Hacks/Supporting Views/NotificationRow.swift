//
//  NotificationRow.swift
//  Silicon Valley Hacks
//
//  Created by Arjun Sharma on 23/04/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

import SwiftUI

struct NotificationRow: View {
       
    var notification: Notification


    var body: some View {
        HStack {
            CircleImage(image: Image( notification.sendingUser.imageSource))
                .frame(width: UIScreen.screenWidth / 4)
                .frame(maxHeight: 60)

            
            VStack(alignment: .leading) {
                    Spacer()
                    Text(verbatim: notification.sendingUser.name)
                        .font(.headline)
                    .multilineTextAlignment(.leading)
                    Spacer()
                
                    Text(verbatim: messageToShow(for: notification))
//                Text(verbatim: "Accepted your request to volunteer")
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                    Spacer()
                
                Spacer()
            }
            .frame(width: 225, height: 70)
            Spacer()

    
        }
        .frame(width: UIScreen.screenWidth)
    }
    
    func messageToShow(for notification: Notification) -> String {
        if notification.sendingUser.category == "volunteer" && notification.receivingUser.category == "seniorCitizen" {
            switch notification.status {
            case .sent:
                return "Has volunteered to help you"
            case .accepted:
                return "Accepted your request to volunteer"
            case .rejected:
                return "Declined your request to volunteer"
            }
        } else {
            switch notification.status {
            case .sent:
                return "Has asked you to volunteer"
            case .accepted:
                return "Has accepted your request to voluneteer"
            case .rejected:
                return "Has declined your request to volunteer"
            }
        }

    }
}

struct NotificationRow_Previews: PreviewProvider {
    static var previews: some View {
        NotificationRow(notification: Notification(sendingUser: User(name: "Arjun", description: "Lorem ipsum dolor", age: 20, category: "volunteer", languages: ["English, Spanish"], gender: "male", latitude: 20, longitude: 20, id: 4848), receivingUser: User(name: "Another user", description: "Lorem ipsum dolor", age: 65, category: "seniorCitizen", languages: ["English", "Spanish"], gender: "male", latitude: 20, longitude: 20, id: 20040930), status: .rejected))
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
