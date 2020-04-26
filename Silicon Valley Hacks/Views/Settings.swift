//
//  Settings.swift
//  Silicon Valley Hacks
//
//  Created by Arjun Sharma on 25/04/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

import SwiftUI

struct Settings: View {
    
    @State var nameTextField: String = ""
    @State var ageTextField: String = ""
    
    
    @State var isMaleChecked: Bool = true
    @State var isFemaleChecked: Bool = false
       
    @State var isEnglishChecked = true
    @State var isSpanishChecked = true
    @State var isFrenchChecked = true
    @State var isGermanChecked = true
    @State var isPortugeseChecked = true
    @State var isPolishChecked = true
    @State private var showingSignOutAlert = false
    
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        NavigationView {
            VStack { //for the entire screen
                VStack { //for the profile editing
                    
                    VStack {
                        HStack {
                            
                            Text("Edit profile")
                                .fontWeight(.bold)
                
                            Spacer()
                        }
                        .font(.system(size: 18))

                        .padding(.leading, 20)
                        .padding(.top, 20)
                        .offset(x: 25)

                        VStack {
                            TextField("Your name", text: $nameTextField)
                            Divider()
                            Spacer()
                            TextField("Your age", text: $ageTextField)
                                Divider()
                            
                            
                        }
                        .frame(width: UIScreen.screenWidth / 10 * 9, height: 100)
                        .font(.system(size: 15))
//                        .padding(.leading, 20)
                        .padding(.top, 10)
                    }
//

                    
                    VStack {
                        HStack {
                            Text("Languages")
                                .offset(x: 45, y: 15)
                            Spacer()
                        }
                        VStack {

                            HStack {
                                Button(action: {
                                    self.isEnglishChecked.toggle()
                                }) {
                                    HStack {
                                        Image(systemName: isEnglishChecked ? "checkmark.circle" : "circle")
                                        Text("English")
                                    }
                                }
                                
                                .frame(width: UIScreen.screenWidth / 3)

                                
                                Button(action: {
                                    self.isSpanishChecked.toggle()
                                }) {
                                    HStack {
                                        Image(systemName: isSpanishChecked ? "checkmark.circle" : "circle")
                                        Text("Spanish")
                                    }
                                }
                                .frame(width: UIScreen.screenWidth / 3)
                                
                                Button(action: {
                                    self.isFrenchChecked.toggle()
                                }) {
                                    HStack {
                                        Image(systemName: isFrenchChecked ? "checkmark.circle" : "circle")
                                        Text("French")
                                    }
                                    .frame(width: UIScreen.screenWidth / 3)
                                }
                            }
                            
                            HStack {
                                Button(action: {
                                    self.isGermanChecked.toggle()
                                }) {
                                    HStack {
                                        Image(systemName: isGermanChecked ? "checkmark.circle" : "circle")
                                        Text("German")
                                    }
                                }
                                .frame(width: UIScreen.screenWidth / 3)

                                Button(action: {
                                    self.isPortugeseChecked.toggle()
                                }) {
                                    HStack {
                                        Image(systemName: isPortugeseChecked ? "checkmark.circle" : "circle")
                                        Text("Portugese")
                                    }
                                    .frame(width: UIScreen.screenWidth / 3)
                                }
                                
                                Button(action: {
                                    self.isPolishChecked.toggle()
                                }) {
                                    HStack {
                                        Image(systemName: isPolishChecked ? "checkmark.circle" : "circle")
                                        Text("Polish")
                                    }
                                    .frame(width: UIScreen.screenWidth / 3)

                                }
                            }
                            
                        }
                        .padding(20)

                    }
                    
                    //add gender here
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Gender")
                                .offset(x: 45, y: 0)
                            Spacer()
                        }
                        VStack {
                            Button(action: {
                                self.isMaleChecked = true
                                    self.isFemaleChecked = false
    
                            }) {
                                HStack {
                                    Image(systemName: isMaleChecked ? "checkmark.circle" : "circle")
                                    Text("Male")
                                }
                            .offset(x: -10, y: 0)
                                                           
                                       
                            }
                            Button(action: {
   
                                    self.isMaleChecked = false
                                    self.isFemaleChecked = true
                                
                            }) {
                                HStack {
                                    Image(systemName: isFemaleChecked ? "checkmark.circle" : "circle")
                                    Text("Female")
                                }
                            }
                        }
                    .offset(x: 45, y: 0)
                    }
                    
                }
                Spacer()
                Button(action: {
                    print("Saving changes")
                }){
                    HStack {
                        Text("Save changes")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        .foregroundColor(Color.white)

                        
                    }
                    .frame(width: UIScreen.screenWidth, height: 60)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 85/255, green: 116/255, blue: 247/255, opacity: 1.0),  Color(red: 96/255, green:195/255, blue:255/255)]), startPoint: .leading, endPoint: .trailing))
//
                }
            }
           
            .navigationBarTitle("Settings", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingSignOutAlert = true
                }) {
                    Text("Log Out")
                }.alert(isPresented: $showingSignOutAlert) {
                    Alert(title: Text("Are you sure you want to log out?"), primaryButton: .cancel(), secondaryButton: .destructive(Text("Yes, sign out")) {
                        self.session.signOut()
                        })
                }
            )

        }

    }
    
    func signOut(){
        print("Signing out")
    }
    
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings().environmentObject(SessionStore())
    }
}
