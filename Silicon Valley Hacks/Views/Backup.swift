//
//  Volunteers.swift
//  Silicon Valley Hacks
//
//  Created by Arjun Sharma on 23/04/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

//import SwiftUI
//enum UserType {
//    case volunteer, seniorCitizen
//}
//struct Backup: View {
//
//    @State var Username = GlobalVariables.sharedManager.name
//    @State var isModal: Bool = false
//
//    let currenUserType = UserType.seniorCitizen
//    func getUsers() -> [User]{
//        let users = Bundle.main.decode([User].self, from: "User-Sample.json")
//        print(users)
//        return users
//    }
//
//    let associatedUsers = [User(name: "Arjun", description: "Lorem ipsum dolor", age: 20, imageSource: "altmaleprofile", category: "volunteer", languages: ["English, Spanish"], gender: "male", latitude: 20, longitude: 20), User(name: "Diana", description: "Lorem ipsum dolor", age: 30, imageSource: "altfemaleprofile", category: "volunteer", languages: ["English", "French"], gender: "female", latitude: 20, longitude: 20)]
//
//    @State private var showModal = false
//    @State var destination = GlobalVariables.sharedManager.destination
//
//    func goToChat (destinationName: String) {
//        NavigationLink(destination: Messagepage(destination: destinationName, name: Username)) {
//            Text("Link")
//    }
//
//
//}
//
//
//    var body: some View {
//
//        NavigationView {
//
//            VStack {
//
//                if !associatedUsers.isEmpty {
//                    List() {
//                        ForEach(associatedUsers) { user in
//                            //NavigationLink(destination: Messagepage()) {
//                                AssociatedUserRow(user: user)
//                            //}
//                            .contextMenu {
////                                Button(action: {
////
////                                    self.isModal = true
////
////                                }) {
////                                        Text("Chat")
////                                       Image(systemName: "message.fill")
////
////
////                                }
//
//                                Button("Message") {
//                                    self.isModal = true
//                                }.sheet(isPresented: self.$isModal, content: {
//                                    Messagepage(destination: user.name, name: self.Username)
//                                })
//
//                                Button(action: {
//                                    self.showModal.toggle()
//                                }) {
//                                    Text("Remove")
//                                    Image(systemName: "minus.circle.fill")
//                                }
//                                Button(action: {
//                                    print("Chat with user")
//                                }) {
//                                    Text("Report")
//                                    Image(systemName: "exclamationmark.bubble")
//                                }
//                            }
//                        }
//
//                    }
//                    .listStyle(GroupedListStyle())
//
//
//
//                   Spacer()
//                    .background(Color.white)
//                } else {
//                    Spacer()
//                    VStack{
//                        Image("no users")
//                        Text("You have no volunteers. You can send requests to volunteers from the Find page.")
//                            .foregroundColor(Color.gray)
//                            .multilineTextAlignment(.center)
//                            .lineSpacing(10)
//                            .offset(y: 20)
//
//                    }
//                    .padding(30)
//                    Spacer()
//                }
//
//            }
//           .navigationBarTitle("Volunteers", displayMode: .inline)
//        .padding()
//
//        }
//    }
//
//
//}
//
//struct AssociateUsers_Previews: PreviewProvider {
//    static var previews: some View {
//        AssociateUsers()
//    }
//}
