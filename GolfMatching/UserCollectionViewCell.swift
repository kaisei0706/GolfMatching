//
//  UserCollectionViewCell.swift
//  GolfMatching
//
//  Created by 岩田海靖 on 2021/11/03.
//

import UIKit
import Firebase

class UserCollectionViewCell: UICollectionViewCell {
    
    // Firestoreのリスナー2
    var listener2: ListenerRegistration!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    func setUserData(_ userData: UserData) {
        let userRef = Firestore.firestore().collection(Const.UserPath).document(userData.id)
        listener2 = userRef.addSnapshotListener(){ (document, error) in
            if let error = error {
                print("DEBUG_PRINT: snapshotの取得が失敗しました。 \(error)")
                return
            }
            print("CEll DEBUG_PRINT: document取得 \(document?.get("score") as? String )")
            self.scoreLabel.text =  document?.get("score") as? String
            
        }
    }
    
}
