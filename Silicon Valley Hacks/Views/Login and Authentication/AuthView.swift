//
//  AuthView.swift
//  Silicon Valley Hacks
//
//  Created by Kaushik  Madapati on 4/21/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import Combine

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @State var name: String = ""
    @EnvironmentObject var session: SessionStore
    
    func signIn() {
        session.signIn(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
                print(self.name)
            }
        }
    }
    
    var body: some View {
            
            VStack {
                Text("Welcome Back!")
                    .font(.system(size: 32, weight: .heavy))
                
                
                Text("Sign in to continue")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(Color(.darkGray))
                
                VStack(spacing: 18) {
                    TextField("Email address", text: $email)
                        .font(.system(size: 14))
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.black), lineWidth: 1))
                    
                    SecureField("Password", text: $password)
                        .font(.system(size: 14))
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.black), lineWidth: 1))
                }
                .padding(.vertical, 64)
                
                Button(action: signIn) {
                    Text("Sign in")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
                        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 85/255, green: 116/255, blue: 247/255, opacity: 1.0),  Color(red: 96/255, green:195/255, blue:255/255)]), startPoint: .leading, endPoint: .trailing))

                    .cornerRadius(5)
                }
                
                if (error != "") {
                    Text(error)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.red)
                        .padding()
                }
                
                Spacer()
                
                NavigationLink(destination: SignUpView()) {
                    HStack {
                        Text("I'm a new user.")
                            .font(.system(size: 14, weight: .light))
                            .foregroundColor(.primary)
                        
                        Text("Create an account")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Color(.blue))
                    }
                }
            }.padding(.horizontal, 32)
        }
        
    }

struct SignUpView: View {
    @State var Username = GlobalVariables.sharedManager.name
    @State var selected = ""
    @State var show = false
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @State var name: String = ""
    @EnvironmentObject var session: SessionStore
    
    func signUp() {
        Username = name
        print(name, Username)
        session.signUp(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                
                let db = Firestore.firestore()
                
                db.collection("users").addDocument(data: ["name" : self.name, "uid" : result!.user.uid]) { (error) in
                    
                    if error != nil {
                        
                        print("Error saving user data")
                    }
                }
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body: some View {
        ZStack {
            
            
            VStack {

                Spacer()
                //RadioButtons(selected: self.$selected, show: self.$show).offset(y: (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 15)
            }.background(Color(UIColor.label.withAlphaComponent(self.show ? 0.2 : 0)).edgesIgnoringSafeArea(.all))
            
            VStack {
                Text("Create Account")
                    .font(.system(size: 32, weight: .heavy))
                
                Text("Sign up to get started")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(Color(.gray))
                
                VStack(spacing: 18) {
                    TextField("Full name", text: $name)
                        .font(.system(size: 14))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.black), lineWidth: 1))
                    
                    TextField("Email address", text: $email)
                        .font(.system(size: 14))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.black), lineWidth: 1))
                    
                    SecureField("Password", text: $password)
                        .font(.system(size: 14))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.black), lineWidth: 1))
                    
                }.padding(.vertical, 55)
                
                if (error != "") {
                    Text(error)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.red)
                        .padding()
                }
                
                VStack {
                    Button(action: signUp) {
                        Text("Create Account")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 50)
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .bold))
                            .background(LinearGradient(gradient: Gradient(colors: [Color(red: 85/255, green: 116/255, blue: 247/255, opacity: 1.0),  Color(red: 96/255, green:195/255, blue:255/255)]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(5)
                    }
                }
                
                Spacer()
            }.padding(.horizontal, 32)
        }.background(Color(.white).edgesIgnoringSafeArea(.all))
        .animation(.default)
        
    }
}

struct AuthView: View {
    var body: some View {
        NavigationView {
            SignInView()
        }
    }
}

struct RadioButtons : View {
    @Binding var selected : String
    @Binding var show : Bool
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 35) {
            
            Text("Your Options:").font(.title).padding(.top)
            
            ForEach(data, id: \.self){i in
                
                Button(action: {
                    
                    self.selected = i
                    
                }) {
                    
                    HStack {
                        
                        Text(i)
                        
                        Spacer()
                        
                        ZStack {
                            
                            Circle().fill(self.selected == i ? Color(.orange) :
                                Color.black.opacity(0.2)).frame(width: 18, height: 18)
                            
                            if self.selected == i {
                                
                                Circle().stroke(Color(.orange), lineWidth: 4).frame(width: 25, height: 25)
                            }
                        }
                        
                    }.foregroundColor(.black)
                    
                }.padding(.bottom)
            }.padding(.bottom)
            
        }.padding(.vertical)
        .padding(.bottom)
        .padding(.horizontal, 25)
        //.padding(.bottom, (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 15)
        .background(Color(.white))
        .cornerRadius(30)
    }
}

var data = ["I want to help senior citizens near me.", "I am a senior citizen looking for volunteers to help me."]

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView().environmentObject(SessionStore())
    }
}
