//
//  User.swift
//  HomeProj
//
//  Created by MacBook Air 13 Retina 2018 on 24.12.2021.
//

import Foundation
import RealmSwift

class User:Object {
    @objc dynamic var email:String = ""
    @objc dynamic var password:String = ""
}
