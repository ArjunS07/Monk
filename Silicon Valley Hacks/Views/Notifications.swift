//
//  Notificationw.swift
//  Silicon Valley Hacks
//
//  Created by Arjun Sharma on 23/04/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

import SwiftUI



struct Notifications: View {
     
        var notifications: [Notification] = [Notification(sendingUser: User(name: "Arjun", description: "Lorem ipsum dolor", age: 20, imageSource: "altmaleprofile", category: "volunteer", languages: ["English, Spanish"], gender: "male", latitude: 1.33993, longitude: 20, id: 39190109), receivingUser: User(name: "Derek", description: "Lorem ipsum dolor", age: 65, category: "seniorCitizen", languages: ["English", "Spanish"], gender: "male", latitude: 1.3398, longitude: 20, id: 339309),  status: .accepted), Notification(sendingUser: User(name: "Diana", description: "Lorem ipsum dolor", age: 20, imageSource: "altfemaleprofile", category: "volunteer", languages: ["English, Spanish"], gender: "female", latitude: 1.33993, longitude: 20, id: 39190109), receivingUser: User(name: "Derek", description: "Lorem ipsum dolor", age: 65, category: "seniorCitizen", languages: ["English", "Spanish"], gender: "male", latitude: 1.3398, longitude: 20, id: 339309),  status: .accepted), Notification(sendingUser: User(name: "Mark", description: "Lorem ipsum dolor", age: 20, imageSource: "person", category: "volunteer", languages: ["English, Spanish"], gender: "male", latitude: 1.33993, longitude: 20, id: 39190109), receivingUser: User(name: "Derek", description: "Lorem ipsum dolor", age: 65, category: "seniorCitizen", languages: ["English", "Spanish"], gender: "male", latitude: 1.3398, longitude: 20, id: 339309),  status: .rejected)]

    var currentUserType = UserType.seniorCitizen
    
    var body: some View {
        NavigationView {
            VStack {
                    
                if !notifications.isEmpty {
                    List {
                        ForEach(notifications) { notification in

                            NotificationRow(notification: notification)
                        }
                    }

                    .listStyle(GroupedListStyle())
                    .frame(width: UIScreen.screenWidth)

                    

                   Spacer()
                    .background(Color.white)
                } else {
                    Spacer()
                    VStack{
                        Image("no users")
                        Text("You have no notifications")
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.center)
                            .lineSpacing(10)
                            .offset(y: 20)
                        
                    }
                    .padding(30)
                    Spacer()
                }
               
            }
           .navigationBarTitle("Notifications", displayMode: .inline)
        .padding()

        }
    }
    
}

struct Notifications_Previews: PreviewProvider {
    static var previews: some View {
        Notifications()
    }
}
