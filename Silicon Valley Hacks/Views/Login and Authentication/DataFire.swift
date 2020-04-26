//
//  DataFire.swift
//  Silicon Valley Hacks
//
//  Created by Kaushik  Madapati on 4/22/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

import Firebase
import Combine
import FirebaseFirestore

class DataFire : ObservableObject {
    @Published var chat = [iDData]()
    
    init() {
        let db = Firestore.firestore()
        
        db.collection("chat").addSnapshotListener { (snap, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documentChanges {
                if i.type == .added {
                    
                    guard let name = i.document.get("name") as? String else { return }
                    guard let msg = i.document.get("msg") as? String else { return }
                    guard let destinationName = i.document.get("destinationName") as? String else { return }
//                    guard let image = i.document.get("image") as? Data else { return }
                    guard let timeStamp =  i.document.get("timeStamp") as? Double else { return }
                     let id = i.document.documentID
                    
                    self.chat.append(iDData(id: id, name: name, msg: msg, destinationName: destinationName, timeStamp: timeStamp))
                }
            }
        }
    }

    
    func addInfo(msg: String, user: String, destinationName: String, timeStamp: Double) {
    let db = Firestore.firestore()
    let distanceTime = NSDate().timeIntervalSince1970
        db.collection("chat").addDocument(data: ["msg": msg, "name": user, "destinationName": destinationName, "timeStamp": distanceTime]) { (err) in
        
        if err != nil {
            print((err?.localizedDescription)!)
            return
        }
        print("Success")
    }
}
}
