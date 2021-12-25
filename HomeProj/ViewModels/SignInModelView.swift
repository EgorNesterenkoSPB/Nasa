//
//  SignInModelView.swift
//  HomeProj
//
//  Created by MacBook Air 13 Retina 2018 on 25.12.2021.
//

import Foundation
import RealmSwift

class SignInModelView {
    let realm = try! Realm()
    
    func loadUser(email:String,password:String) -> Bool{
        
        let emailPredicate = NSPredicate(format: "email = %@", email as CVarArg)
        let userObject = self.realm.objects(User.self).filter(emailPredicate).first
        
        if userObject?.password == password {
            return true
        }else{
            return false
        }
      }
}
