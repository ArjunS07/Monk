//
//  Volunteers.swift
//  Silicon Valley Hacks
//
//  Created by Arjun Sharma on 23/04/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

import SwiftUI
enum UserType {
    case volunteer, seniorCitizen
}
struct AssociateUsers: View {
    
    @State var Username = GlobalVariables.sharedManager.name
    @State var isModal: Bool = false
     
    let currenUserType = UserType.seniorCitizen
    func getUsers() -> [User]{
        let users = Bundle.main.decode([User].self, from: "User-Sample.json")
        print(users)
        return users
    }
    
    let associatedUsers = [User(name: "Arjun", description: "Lorem ipsum dolor", age: 20, imageSource: "altmaleprofile", category: "volunteer", languages: ["English, Spanish"], gender: "male", latitude: 20, longitude: 20, id: 575758), User(name: "Diana", description: "Lorem ipsum dolor", age: 30, imageSource: "altfemaleprofile", category: "volunteer", languages: ["English", "French"], gender: "female", latitude: 20, longitude: 20, id: 39349348)]

    @State private var showModal = false
    @State var destination = GlobalVariables.sharedManager.destination
    
//    func goToChat (destinationName: String) {
//        NavigationLink(destination: Messagepage(destination: destinationName, name: Username)) {
//            Text("This shouldn't work")
//        }
//    }

    
    var body: some View {
        
        NavigationView {
            
            VStack {
                if !associatedUsers.isEmpty {
                    List() {
                        ForEach(associatedUsers) { user in
                            NavigationLink(destination: Messagepage(destination: user.name, name: self.Username)) {
                                AssociatedUserRow(user: user)
                                }

                            
                        }

                    }
                    .listStyle(GroupedListStyle())



                   Spacer()
                    .background(Color.white)
                } else {
                    Spacer()
                    VStack{
                        Image("no users")
                        Text("You have no volunteers. You can send requests to volunteers from the Find page.")
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.center)
                            .lineSpacing(10)
                            .offset(y: 20)

                    }
                    .padding(30)
                    Spacer()
                }
               
            }
           .navigationBarTitle("Volunteers", displayMode: .inline)
        .padding()

        }
    }
    
    
}

struct AssociateUser_Previews: PreviewProvider {
    static var previews: some View {
        AssociatedUserRow(user: User(name: "Arjun", description: "Lorem ipsum dolor", age: 20, category: "volunteer", languages: ["English", "Spanish"], gender: "male", latitude: 20, longitude: 20, id: 2302020))
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
