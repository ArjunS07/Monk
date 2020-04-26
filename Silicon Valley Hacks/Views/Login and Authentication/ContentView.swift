//
//  ContentView.swift
//  Silicon Valley Hacks
//
//  Created by Arjun Sharma on 22/04/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct Login: View {
    @State var name: String = ""
    @State var show = false
    @State var image : Data = .init(count: 0)
    @State var destination = GlobalVariables.sharedManager.destination
    public var welcomeText = Text("Welcome back!")
    @EnvironmentObject var session: SessionStore
    @ObservedObject var message = DataFire()
    
    
    func getUser() {
        session.listen()
    }
    
    
    var body: some View {
        
        let stack = VStack(spacing: 45) {

            if (session.session != nil) {
    
                NavigationView {
                    
                    ZStack {

                        VStack(spacing: 45) {
                            if self.image.count != 0 {
                                Image(uiImage: UIImage(data: self.image)!).resizable()
                                    .frame(width: 55, height: 55)
                                .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                            } else {
                                Button(action: {
                                    self.show.toggle()
                                }) {
                                    Image(systemName: "person.circle.fill")
                                        .resizable()
                                        .frame(width: 55, height: 55)
                                    .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                                }
                            }
                            TextField("Name:", text: self.$name).padding(10)
                                .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
                            .cornerRadius(20)
                            
                            TextField("Destination:", text: self.$destination).padding(10)
                                    .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
                                    .cornerRadius(20)
                            
                            
                            NavigationLink(destination: Messagepage(destination: self.destination, name: self.name)) {
                                HStack {
                                    Text("Enter").padding(12)
                                        .foregroundColor(.white)
                                        .background((self.name.count > 0) ? Color.blue : Color.gray)
                                    .cornerRadius(8)
                                }
                            }
                            Button(action: session.signOut) {
                                Text("Sign Out")
                                    .frame(minWidth: 0, maxWidth: 250)
                                    .frame(height: 40)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .bold))
                                    .background(LinearGradient(gradient: Gradient(colors: [Color(.blue), Color(.purple)]), startPoint: .leading, endPoint: .trailing))
                                    .cornerRadius(5)
                            }
                        }.background(Color.white)
                        .cornerRadius(20)
                        .padding()
                    }
                }
                

            } else {
                AuthView()

            }
        }.onAppear {
            self.getUser()
            
        }
        
        return stack
        .sheet(isPresented: self.$show, content: {
            ImagePicker(show: self.$show, image: self.$image)
        })
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Login().environmentObject(SessionStore())
        }
    }
}





