//
//  FBManager.swift
//  RouletteTask
//
//  Created by Stas Bezhan on 03.08.2022.
//

import Foundation
import UIKit
import Firebase

class FBManager {
    
    static let shared = FBManager()
    
    private func configureFB() -> Firestore {
        var db: Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        return db
    }
    
    func getUser(collectionName: String, userEmail: String, completionHandler: @escaping (User?)->(Void)) {
        let db = configureFB()
        db.collection(collectionName).document(userEmail).getDocument { document, error in
            guard error == nil else {completionHandler(nil); return}
            let user = User(money: document?.get("money") as! Int, name: document?.get("name") as! String, winRate: document?.get("win rate") as! Double, countOfGames: document?.get("countOfGames") as! Int, email: document?.get("email") as! String)
            completionHandler(user)
        }
    }
    
}
