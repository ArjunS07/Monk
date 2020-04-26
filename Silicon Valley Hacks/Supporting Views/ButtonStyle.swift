//
//  UIView + Gradient.swift
//  Silicon Valley Hacks
//
//  Created by Arjun Sharma on 22/04/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
@available(iOS 13.0.0, *)
@available(iOS 13.0.0, *)
@available(iOS 13.0.0, *)
@available(iOS 13.0.0, *)
@available(iOS 13.0.0, *)
@available(iOS 13.0.0, *)
struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        
        configuration.label
           .foregroundColor(Color.white)
           .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color(red: 85, green: 116, blue: 247), Color(red: 96, green: 194, blue: 255)]), startPoint: .leading, endPoint: .trailing))
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/6)
        
    }
    
}

