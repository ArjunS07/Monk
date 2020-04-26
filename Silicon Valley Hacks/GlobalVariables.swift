//
//  GlobalVariables.swift
//  
//
//  Created by Kaushik  Madapati on 4/23/20.
//

import Foundation

import SwiftUI
import UIKit



class GlobalVariables {
    let appGradient = LinearGradient(gradient: Gradient(colors: [Color(red: 85, green: 116, blue: 247), Color(red: 96, green: 194, blue: 255)]), startPoint: .leading, endPoint: .trailing)

    var destination: String
    
    var id: Int
    var name: String
    var age: Int
    var gender: String
    var category: String
    var imageSource: String
    var languages: [String]
    var interatctedUsers : [Int]
    var description: String
    var latitiude: Double
    var longitude: Double
    
    class var sharedManager: GlobalVariables {
        struct Static {
            static let instance = GlobalVariables()
        }
        return Static.instance
    }
    
    init(){
        destination = ""
        id = 0
        name = "naveen" 
        age = 1
        gender = "male"
        category = "volunteer"
        imageSource = "https://image.flaticon.com/icons/svg/21/21104.svg"
        languages = ["English", "Spanish"]
        interatctedUsers = [1, 2]
        description = "lorum epsum"
        latitiude = 1
        longitude = 1
        
    }
    
    func getDestination() -> String {
        return self.destination
    }
    
    func setDestination(dest: String) {
        self.destination = dest
    }
}
