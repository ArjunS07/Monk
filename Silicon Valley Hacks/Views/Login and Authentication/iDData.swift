//
//  idData.swift
//  Silicon Valley Hacks
//
//  Created by Kaushik  Madapati on 4/22/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct iDData: Identifiable {
    var id: String
    var name : String
    var msg : String
    var destinationName: String
    var timeStamp: Double
    
    
}
