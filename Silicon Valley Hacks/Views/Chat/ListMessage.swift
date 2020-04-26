//
//  ListMessage.swift
//  Silicon Valley Hacks
//
//  Created by Kaushik  Madapati on 4/22/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct ListMessage: View {

    var msg = ""

    var Message = false
    var user = ""

    let defualtimg = UIImage(named: "person-male.png")!

    var body: some View {

        HStack {
            if Message {

                Spacer()

                HStack {
                        Text(msg)
                        .multilineTextAlignment(.leading)
                        .frame(minWidth: 50, maxWidth: 225, minHeight: 50)
                        .foregroundColor(Color.black)
                        .padding(10)

                }
                .background(Color.secondary)
                .cornerRadius(20)
                .frame(minWidth: 100, maxWidth: 225)
                .padding(10)

            } else {
                HStack {
                    HStack {
                        Text(msg)
                        .multilineTextAlignment(.leading)
                        .frame(minWidth: 100, maxWidth: 225, minHeight: 50)
                        .foregroundColor(Color.black)
                        .padding(10)
                    }
                    .background(Color.secondary)
                    .cornerRadius(20)
                    .frame(minWidth: 100, maxWidth: 225)
                    .padding(10)
                }
                Spacer()



          }
        }
    }
}


//struct ListMessage: View {
//
//    var msg = ""
//
//    var Message = false
//    var user = ""
//
//    let defualtimg = UIImage(named: "person-male.png")!
//
//    var body: some View {
//
//        HStack {
//            if Message {
//
//                Spacer()
//
//                HStack {
//
//                    Text(msg)
//                    .foregroundColor(.white)
//                    .frame(minWidth: 100, maxWidth: 300, minHeight: 45)
//                        .padding(20)
//
//                    .background(Color.secondary)
//
//                    .cornerRadius(18)
//
//                }
//
//            } else {
//                HStack {
//
//                    Text(msg)
//                    .foregroundColor(.white)
//                    .frame(minWidth: 100, maxWidth: 300, minHeight: 45)
//                    .background(Color.blue)
//                    .cornerRadius(18)
//                    .padding(30)
//                    .offset(x: -35)
//                }
//                Spacer()
//
//
//          }
//        }
//    }
//}

