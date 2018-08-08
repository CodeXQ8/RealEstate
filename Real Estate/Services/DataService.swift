//
//  Services.swift
//  Real Estate
//
//  Created by Nayef Alotaibi on 8/8/18.
//  Copyright © 2018 Nayef Alotaibi. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService {
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_PROPERTIES = DB_BASE.child("properties")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }

    var REF_PROPERTIES: DatabaseReference {
        return _REF_PROPERTIES
    }
    
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    func getUsername(forUID uid: String, handler: @escaping (_ username: String) -> ()) {
        REF_USERS.observeSingleEvent(of: .value) { (userSnapshot) in
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in userSnapshot {
                if user.key == uid {
                    handler(user.childSnapshot(forPath: "email").value as! String)
                }
            }
        }
    }
    

    
    func uploadPost(withImages images: String, forUID uid: String, sendComplete: @escaping (_ status: Bool) -> ()) {
            REF_PROPERTIES.childByAutoId().updateChildValues(["Images": images, "senderId": uid])
            sendComplete(true)
        }
    

    func getIds(forUsernames usernames: [String], handler: @escaping (_ uidArray: [String]) -> ()) {
        REF_USERS.observeSingleEvent(of: .value) { (userSnapshot) in
            var idArray = [String]()
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in userSnapshot {
                let email = user.childSnapshot(forPath: "email").value as! String
                
                if usernames.contains(email) {
                    idArray.append(user.key)
                }
            }
            handler(idArray)
        }
    }
}

//    func getUserProperties(forUID uid: String, handler: @escaping (_ username: String) -> ()) {
//        var  propertyArray = [String]()
//        REF_PROPERTIES.observeSingleEvent(of: .value) { (userSnapshot) in
//            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
//            for user in userSnapshot {
//                if user.key == uid {
//                let properties = user.childSnapshot(forPath: "properties").value as! String
//
//                    handler(user.childSnapshot(forPath: "properties").value as! String)
//                }
//            }
//        }
//    }



