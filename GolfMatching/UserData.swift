//
//  UserData.swift
//  GolfMatching
//
//  Created by 岩田海靖 on 2021/11/01.
//

import Foundation
import Firebase

class UserData: NSObject {
    var id: String
    var username: String?
    var score: String?
    var age: Int?
    var place: String?
    
    init(document: DocumentSnapshot) {
        self.id = document.documentID
        
        let userDic = document.data()!
        
        self.username = userDic["username"] as? String
        
        self.score = userDic["score"] as? String
        
        self.age = userDic["age"] as? Int
        
        self.place = userDic["place"] as? String
        
    }


}
