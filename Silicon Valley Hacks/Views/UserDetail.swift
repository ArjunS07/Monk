//
//  UserDetail.swift
//  Silicon Valley Hacks
//
//  Created by Arjun Sharma on 24/04/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

import SwiftUI

struct UserDetail: View {
    
    var selectedUser: User
    @EnvironmentObject var session: SessionStore
    var body: some View {
        
        ZStack { //for the entire screen - do not remove
            VStack(spacing: 20) { //for the entire screen
                ZStack {
                    Image("placeholderbannerprofile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.screenWidth)
                        .edgesIgnoringSafeArea(.top)
                    
                    HStack(alignment: .center){
                        Spacer()
                        Text(selectedUser.name)
                            .font(.largeTitle)
                         .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                        Spacer()

                    }
                }

                VStack(spacing: 20){ //for everything after the image
                    VStack { // for the tags

                       ZStack{
                           RoundedRectangle(cornerRadius: 10.0)
                               .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 85/255, green: 116/255, blue: 247/255, opacity: 1.0),             Color(red: 96/255, green:195/255, blue:255/255)]), startPoint: .leading, endPoint: .trailing))
                               .frame(width: UIScreen.screenWidth / 10 * 9)
                           Text("Languages -  \(createLanguagesString(array: selectedUser.languages))".uppercased())
                               .foregroundColor(Color.white)
                               .frame(width: UIScreen.screenWidth / 10 * 9, height: 40)

                       }
                       Spacer()
                       HStack {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10.0)
                                .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 85/255, green: 116/255, blue: 247/255, opacity: 1.0),             Color(red: 96/255, green:195/255, blue:255/255)]), startPoint: .leading, endPoint: .trailing))
                                .frame(width: UIScreen.screenWidth / 10 * 4.5)
                            Text("\(selectedUser.age) YEARS OLD")
                                .foregroundColor(Color.white)
                                .frame(width: UIScreen.screenWidth / 10 * 4.5, height: 40)

                        }
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10.0)
                                .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 85/255, green: 116/255, blue: 247/255, opacity: 1.0),             Color(red: 96/255, green:195/255, blue:255/255)]), startPoint: .leading, endPoint: .trailing))
                                .frame(width: UIScreen.screenWidth / 10 * 4.5)
                                Text(selectedUser.gender.uppercased())
                                .foregroundColor(Color.white)
                                .frame(width: UIScreen.screenWidth / 10 * 4.5, height: 40)

                        }
            
                              
                       }
                   } //closing bracket for tags
                   .frame(height: 90)
                    Spacer()
                   HStack {
                       Text(selectedUser.description)
                           .multilineTextAlignment(.leading)
                   }

                   .frame(width: UIScreen.screenWidth / 10 * 9)
                    
                    
                   
                   Spacer()
                   
                    Button(action: {
                        self.getUserData()
                    }){
                        Image(systemName: "person.badge.plus.fill")
                            .offset(y: 3)
                        Text("Send Request")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    }
                .padding(12)
                .frame(width: UIScreen.screenWidth / 10 * 9)

                .background(LinearGradient(gradient: Gradient(colors: [Color(red: 85/255, green: 116/255, blue: 247/255, opacity: 1.0), Color(red: 96/255, green:195/255, blue:255/255)]), startPoint: .leading, endPoint: .trailing))
                    .foregroundColor(Color.white)
               }
            .offset(x: 0, y: -50)
                
            }
        }

    }
    
    func getUserData() {
        //declare parameter as a dictionary which contains string as key and value combination. considering inputs are valid

        let parameters = ["id": session.session!.uid, "name": GlobalVariables.sharedManager.name] as [String : Any]

        //create the url with URL
        let url = URL(string: "http://my-json-server.typicode.com/Parch1/silvalbackend/api/")!

        //create the session object
        let session = URLSession.shared

        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        
   //     let boundaryConstant = "--V2ymHFg03ehbqgZCaKO6jy--";
   //     request.addValue("multipart/form-data boundary=(boundaryConstant)", forHTTPHeaderField: "Content-Type")
        
        
        request.httpMethod = "POST" //set http method as POST

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in

            guard error == nil else {
                return
            }

            guard let data = data else {
                return
            }

            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                    // handle json...
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    
    func createLanguagesString(array: [String]) -> String {
        var string = ""
        for i in 0..<array.count {
            string += array[i]
            if i < (array.count - 1) {
                string += ", "
            }
        }
        
        return string
    }
}

struct UserDetail_Previews: PreviewProvider {
    static var previews: some View {
        UserDetail(selectedUser: User(name: "Arjun", description: "Lorem ipsum dolor ipsum dolor ipsum dolor ipsum dolor ipsum dolor ipsum dolor ipsum dolor ipsum dolor ipsum dolor ipsum dolor ipsum dolor ipsum dolor ipsum dolor ipsum dolor ipsum dolor ipsum dolor ipsum dolor ", age: 20, category: "volunteer", languages: ["English", "Spanish"], gender: "male", latitude: 20, longitude: 20, id: 4585898))
    }
}
