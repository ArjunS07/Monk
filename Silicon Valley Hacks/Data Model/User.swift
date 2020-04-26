//
//  User.swift
//  Silicon Valley Hacks
//
//  Created by Arjun Sharma on 23/04/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

import Foundation
import CoreLocation



struct User: Codable, Identifiable {
    var name: String
    var description: String
    var age: Int
    var imageSource: String
    var category: String
    var languages: [String]
    var gender: String
    var latitude: Float
    var longitude: Float
    var id: Int
    
    
    init(name: String, description: String, age: Int, imageSource: String = "Profile", category: String, languages: [String], gender: String, latitude: Float, longitude: Float, id: Int) {
        self.name = name
        self.description = description
        self.age = age
        self.imageSource = imageSource
        self.category = category
        self.languages = languages
        self.gender = gender
        self.latitude = latitude
        self.longitude = longitude
        self.id = id
    }
}




