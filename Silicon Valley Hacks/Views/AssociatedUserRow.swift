//
//  PersonCell.swift
//  Silicon Valley Hacks
//
//  Created by Arjun Sharma on 23/04/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

import SwiftUI

struct AssociatedUserRow: View {
       
    var user: User
    var body: some View {
        HStack {
            CircleImage(image: Image(user.imageSource))
                                .frame(width: UIScreen.screenWidth / 4)
                .frame(maxHeight: 60)

            
            HStack(alignment: .center) {
                VStack {
                    Text(verbatim: user.name)
                        .multilineTextAlignment(.leading)
                }
                .offset(x: 10)
                Spacer()
            }
            .frame(width: 225, height: 70)
            Spacer()

    
        }
    }
    
}

struct PersonRow_Previews: PreviewProvider {
    static var previews: some View {
        AssociatedUserRow(user: User(name: "Arjun", description: "Lorem ipsum dolor", age: 20, category: "volunteer", languages: ["English", "Spanish"], gender: "male", latitude: 20, longitude: 20, id: 2302020))
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
