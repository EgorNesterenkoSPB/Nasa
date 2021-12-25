//
//  RegisterModelView.swift
//  HomeProj
//
//  Created by MacBook Air 13 Retina 2018 on 24.12.2021.
//

import UIKit
import RealmSwift



class RegisterViewModel {
    
    let realm = try! Realm()
    var error:Error?
    
    func createUser(email:String,password:String){
        let newUser = User()
            newUser.email = email
            newUser.password = password
            self.saveUser(user: newUser)
    }
    func saveUser(user:User){
        do {
            try realm.write({
                realm.add(user)
            })
        } catch {
            self.error = error
        }
    }
}
