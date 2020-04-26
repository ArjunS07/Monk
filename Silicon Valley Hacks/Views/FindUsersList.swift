//
//  FindUsersList.swift
//  Silicon Valley Hacks
//
//  Created by Arjun Sharma on 24/04/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

import SwiftUI


struct FindUsersList: View {
    @State  var preferredAgeSlider: Double
    @State var isMaleChecked: Bool = true
    @State var isFemaleChecked: Bool = true
       
    @State var isEnglishChecked = true
    @State var isSpanishChecked = true
    @State var isFrenchChecked = true
    @State var isGermanChecked = true
    @State var isPortugeseChecked = true
    @State var isPolishChecked = true
    
    @EnvironmentObject var session: SessionStore
    
//    let selectedUser = User(name: "Arjun", description: "Lorem ipsum dolor", age: 20, category: "volunteer", languages: ["English", "Spanish"], gender: "male", latitude: 34.011_286, longitude: -116.166_868)

    
    var usersToShow: [User] = [User(name: "Brian", description: "Lorem ipsum dolor", age: 20, category: "volunteer", languages: ["English", "Portugese"], gender: "male", latitude: 34.011_286, longitude: -116.166_868, id: 3903030930), User(name: "Mark", description: "Lorem ipsum dolor", age: 35, imageSource: "person", category: "volunteer", languages: ["English", "French"], gender: "male", latitude: 21, longitude: 21, id: 204309)]

//    private func getRedditPost() {
//        EasyRequest<[RedditModel]>.get(self, path: "data.children", url: "http://my-json-server.typicode.com/Parch1/silvalbackend/api/") { (posts) in
//            self.models = posts
//            DispatchQueue.main.async() {
//                self.tableView.reloadData()
//            }
//        }
//    }
    
    
    
    
    mutating func getDataFromAPI () {
        let url = URL(string: "http://my-json-server.typicode.com/Parch1/silvalbackend/api/")!

             //create the session object
             let session = URLSession.shared

             //now create the URLRequest object using the url object
             var request = URLRequest(url: url)
             
        //     let boundaryConstant = "--V2ymHFg03ehbqgZCaKO6jy--";
        //     request.addValue("multipart/form-data boundary=(boundaryConstant)", forHTTPHeaderField: "Content-Type")
             
             
             request.httpMethod = "GET" //set http method as POST
             
        
             request.addValue("application/json", forHTTPHeaderField: "Content-Type")
             request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in

            guard error == nil else {
                return
            }

            guard let data = data else {
                return
            }
            
            do {
                if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                           
                           // Print out entire dictionary
                           print(convertedJsonIntoDict)
                           
                           // Get value by key
//                    self.usersToShow.append(User.init(name: convertedJsonIntoDict["name"] as! String,description: "added from server", age: 20, category: "volunteer", languages: ["English", "Portugese"], gender: "male", latitude: 34.011_286, longitude: -116.166_868))
//
                           
                       }
            } catch let error as NSError {
                       print(error.localizedDescription)
             }

            
        })

       
        task.resume()
    }
    
    func getUser() {
        session.listen()
    }
    
    var body: some View {
        
        NavigationView {
            
            if (session.session != nil) {
                
                VStack {
                    
                    List {
                        ForEach(usersToShow) { user in
                            NavigationLink(destination: UserDetail(selectedUser: user)) {
                                FindPersonRow(user: user)
                            }
                        }
                    }
                    .navigationBarTitle(Text("Find"))
                    .frame(height: UIScreen.screenHeight / 2)
                    .listStyle(GroupedListStyle())

                    
                    
                    Spacer()
                    
                    VStack { //for the filters
                        HStack { //for the first row - age and gender
                            VStack(alignment: .center) { //for the age label and slider
                                
                                Text("Preferred Minimum Age")
                                    .font(.headline)
                                if UserDefaults.standard.bool(forKey: "isCurrentUserVolunteer") {
                                    MySlider(ageSliderValue: $preferredAgeSlider, minimumAge: 60.0, maximumAge: 100.0, textColor: Color.black)
                                } else {
                                    MySlider(ageSliderValue: $preferredAgeSlider, minimumAge: 15.0, maximumAge: 40.0, textColor: Color.black)

                                }
                                
                                Text("\(Int(preferredAgeSlider))")
                                    .foregroundColor(Color.gray)
                                    .multilineTextAlignment(.center)
                            }
                             .frame(width: UIScreen.screenWidth/2)
                            .offset(x: 60, y: 0)
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Preferred Gender")
                                    .font(.headline)
                                Button(action: {
                                    self.isMaleChecked.toggle()
                                }) {
                                    HStack {
                                        Image(systemName: isMaleChecked ? "checkmark.circle" : "circle")
                                        Text("Male")
                                    }
                                                               
                                           
                                }
                                Button(action: {
                                    self.isFemaleChecked.toggle()
                                }) {
                                    HStack {
                                        Image(systemName: isFemaleChecked ? "checkmark.circle" : "circle")
                                        Text("Female")
                                    }
                                }
                            }
                            .frame(width: 100)
                        .offset(x: -50, y: -10)

                        }
                        
                        VStack {
                            HStack {
                                Text("Languages")
                                .font(.headline)
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
                        
                       
                    }

                }
                .navigationBarTitle("Find", displayMode: .inline)
                
            } else {
                AuthView()
            }
            
//            VStack {
//
//                List {
//                    ForEach(usersToShow) { user in
//                        NavigationLink(destination: UserDetail(selectedUser: user)) {
//                            FindPersonRow(user: user)
//                        }
//                    }
//                }
//                .navigationBarTitle(Text("Find"))
//                .frame(height: UIScreen.screenHeight / 2)
//                .listStyle(GroupedListStyle())
//
//
//
//                Spacer()
//
//                VStack { //for the filters
//                    HStack { //for the first row - age and gender
//                        VStack(alignment: .center) { //for the age label and slider
//
//                            Text("Preferred Minimum Age")
//                                .font(.headline)
//                            if UserDefaults.standard.bool(forKey: "isCurrentUserVolunteer") {
//                                MySlider(ageSliderValue: $preferredAgeSlider, minimumAge: 60.0, maximumAge: 100.0, textColor: Color.black)
//                            } else {
//                                MySlider(ageSliderValue: $preferredAgeSlider, minimumAge: 15.0, maximumAge: 40.0, textColor: Color.black)
//
//                            }
//
//                            Text("\(Int(preferredAgeSlider))")
//                                .foregroundColor(Color.gray)
//                                .multilineTextAlignment(.center)
//                        }
//                         .frame(width: UIScreen.screenWidth/2)
//                        .offset(x: 60, y: 0)
//                        Spacer()
//                        VStack(alignment: .leading) {
//                            Text("Preferred Gender")
//                                .font(.headline)
//                            Button(action: {
//                                self.isMaleChecked.toggle()
//                            }) {
//                                HStack {
//                                    Image(systemName: isMaleChecked ? "checkmark.circle" : "circle")
//                                    Text("Male")
//                                }
//
//
//                            }
//                            Button(action: {
//                                self.isFemaleChecked.toggle()
//                            }) {
//                                HStack {
//                                    Image(systemName: isFemaleChecked ? "checkmark.circle" : "circle")
//                                    Text("Female")
//                                }
//                            }
//                        }
//                        .frame(width: 100)
//                    .offset(x: -50, y: -10)
//
//                    }
//
//                    VStack {
//                        HStack {
//                            Text("Languages")
//                            .font(.headline)
//                        }
//                        VStack {
//                            HStack {
//                                Button(action: {
//                                    self.isEnglishChecked.toggle()
//                                }) {
//                                    HStack {
//                                        Image(systemName: isEnglishChecked ? "checkmark.circle" : "circle")
//                                        Text("English")
//                                    }
//                                }
//
//                                .frame(width: UIScreen.screenWidth / 3)
//
//
//                                Button(action: {
//                                    self.isSpanishChecked.toggle()
//                                }) {
//                                    HStack {
//                                        Image(systemName: isSpanishChecked ? "checkmark.circle" : "circle")
//                                        Text("Spanish")
//                                    }
//                                }
//                                .frame(width: UIScreen.screenWidth / 3)
//
//                                Button(action: {
//                                    self.isFrenchChecked.toggle()
//                                }) {
//                                    HStack {
//                                        Image(systemName: isFrenchChecked ? "checkmark.circle" : "circle")
//                                        Text("French")
//                                    }
//                                    .frame(width: UIScreen.screenWidth / 3)
//                                }
//                            }
//
//                            HStack {
//                                Button(action: {
//                                    self.isGermanChecked.toggle()
//                                }) {
//                                    HStack {
//                                        Image(systemName: isGermanChecked ? "checkmark.circle" : "circle")
//                                        Text("German")
//                                    }
//                                }
//                                .frame(width: UIScreen.screenWidth / 3)
//
//                                Button(action: {
//                                    self.isPortugeseChecked.toggle()
//                                }) {
//                                    HStack {
//                                        Image(systemName: isPortugeseChecked ? "checkmark.circle" : "circle")
//                                        Text("Portugese")
//                                    }
//                                    .frame(width: UIScreen.screenWidth / 3)
//                                }
//
//                                Button(action: {
//                                    self.isPolishChecked.toggle()
//                                }) {
//                                    HStack {
//                                        Image(systemName: isPolishChecked ? "checkmark.circle" : "circle")
//                                        Text("Polish")
//                                    }
//                                    .frame(width: UIScreen.screenWidth / 3)
//
//                                }
//                            }
//                        }
//                    .padding(20)
//                    }
//
//
//                }
//
//            }
//            .navigationBarTitle("Find", displayMode: .inline)
        }.onAppear {
            self.getUser()
        }
    }

}

struct FindUsersList_Previews: PreviewProvider {
    static var previews: some View {
        FindUsersList(preferredAgeSlider: 20.0).environmentObject(SessionStore())
    }
}


struct MySlider : View {
  @Binding var ageSliderValue: Double
    var minimumAge: Double
    var maximumAge: Double
  var textColor: Color
  var body: some View {
   HStack {
      Text("\(Int(minimumAge))")
        .foregroundColor(textColor)
    Slider(value: $ageSliderValue, in: minimumAge...maximumAge, step: 1)
            .accentColor(Color(red: 88/255, green: 136/255, blue: 249/255))

      Text("\(Int(maximumAge))")
        .foregroundColor(textColor)
    }
    .padding()
  }
}
