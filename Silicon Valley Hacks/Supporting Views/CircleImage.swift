//
//  CircleImage.swift
//  Silicon Valley Hacks
//
//  Created by Arjun Sharma on 22/04/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .resizable()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .scaledToFit()
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("Profile"))
    }
    
}


