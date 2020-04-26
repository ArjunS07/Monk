//
//  FindUsersList.swift
//  Silicon Valley Hacks
//
//  Created by Arjun Sharma on 24/04/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        
            TabView {
                FindUsersList(preferredAgeSlider: 20)
                    .tabItem {
                        Image(systemName: "person.crop.circle.badge.plus.fill")
                        Text("Find")
                    }

                
                Notifications()
                    .tabItem {
                        Image(systemName: "bell.fill")
                        Text("Notifications")
                    }
                
                AssociateUsers()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Manage")
                    
                }
                
                ChatbotView()
                    .tabItem {
                        Image(systemName: "message.fill")
                        Text("Chatbot")
                }
                
                Settings()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                }
            }
        
        
            

    }
}
