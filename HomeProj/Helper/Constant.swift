//
//  Constant.swift
//  HomeProj
//
//  Created by MacBook Air 13 Retina 2018 on 24.12.2021.
//

import UIKit

struct K {
    static let signInSeque = "ToSignIn"
    static let registerSeque = "ToRegister"
    static let facebookSeque = "toFacebook"
    static let signInToMain = "SignInToMain"
    static let registerToMain = "RegisterToMain"
    static let facebookToMain = "FacebookToMain"
}

func errorAC(title:String,message:String,buttonText:String) -> UIAlertController
{
    let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
    ac.addAction(UIAlertAction(title: buttonText, style: .default, handler: nil))
    return ac
}
