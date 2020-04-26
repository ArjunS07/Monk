//
//  Messages.swift
//  Silicon Valley Hacks
//
//  Created by Kaushik  Madapati on 4/22/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

import SwiftUI
import Combine
import Firebase
import FirebaseFirestore

struct Messagepage: View {
    @ObservedObject var message = DataFire()
    @State var destination = GlobalVariables.sharedManager.destination
    var name = ""
    let distanceTime = NSDate().timeIntervalSince1970

//    @Binding var image : Data

//    func sortMsg() {
//        let db = Firestore.firestore()
//
//        db.collection("chat")
//            .order(by: "timeStamp", descending: false)
//    }


    @State var write = ""
    var body: some View {
        NavigationView {
            VStack { //for the entire screen
                ScrollView(.vertical, showsIndicators: false){ //for the messages
                    ForEach(message.chat) { i in
                        VStack { //no idea why this is needed
                            if i.name == self.name && i.destinationName == self.destination {
                                ListMessage(msg: i.msg, Message: true, user: i.name)

                            } else if i.name == self.destination {
                                ListMessage(msg: i.msg, Message: false, user: i.name)
                            }
                        }

                    }
                }
                .navigationBarTitle(Text(destination), displayMode: .inline)
                .frame(width: UIScreen.screenWidth)
            .frame(minHeight: UIScreen.screenHeight / 10 * 3, maxHeight: UIScreen.screenHeight / 10 * 7)
                Spacer()
                HStack {
                    TextField("Send message...", text: self.$write)
                        .padding(10)
                        .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
                        .cornerRadius(25)
                    Button(action: {
            
                        if self.write.count > 0 {
                            self.message.addInfo(msg: self.write, user: self.name, destinationName: self.destination, timeStamp: self.distanceTime)
                            self.write = ""
                            
                        } else {

                        }
                    }) {
                        Image(systemName: "arrow.right.circle.fill")
                      .foregroundColor((self.write.count > 0) ? Color.blue : Color.gray)
                              .font(.system(size: 30))
                    }
                .padding()
                
                
                }
            }
            .keyboardResponsive()
        }

    }
}


//struct Messagepage: View {
//    @ObservedObject var message = DataFire()
//    @State var destination = GlobalVariables.sharedManager.destination
//    var name = ""
//    let distanceTime = NSDate().timeIntervalSince1970
//
//
////    func sortMsg() {
////        let db = Firestore.firestore()
////
////        db.collection("chat")
////            .order(by: "timeStamp", descending: false)
////    }
//
//    @State var write = ""
//    var body: some View {
////        print(self.destination, self.name)
////        let db = Firestore.firestore()
////
////        db.collection("chat")
////            .order(by: "timeStamp", descending: false)
//        VStack {
//            ScrollView(.vertical) {
//                ForEach(message.chat) { i in
//                    if i.name == self.name {
//                        ListMessage(msg: i.msg, Message: true, user: i.name)
//
//                    } else if i.name == self.destination {
//                        ListMessage(msg: i.msg, Message: false, user: i.name)
//
//                    }
//                }
//            .padding()
//
//            }.navigationBarTitle("Chats", displayMode: .inline)
//                .frame(width: UIScreen.screenWidth)
//
//            HStack {
//                TextField("message...", text: self.$write).padding(10)
//                    .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
//                .cornerRadius(25)
//
//                Button(action: {
//                    if self.write.count > 0 {
//                        self.message.addInfo(msg: self.write, user: self.name, destinationName: self.destination, timeStamp: self.distanceTime)
//                        self.write = ""
//                    } else {
//
//                    }
//                }) {
//                    Image(systemName: "arrow.right.circle.fill").font(.system(size: 30))
//                    //change arrow icon to better match the app
//                        .foregroundColor((self.write.count > 0) ? Color.blue : Color.gray)
//                    //remove the rotation effect
//                }
//            }.padding()
//        }
//
//    }
//}


