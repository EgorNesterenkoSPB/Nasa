//
//  SignInViewController.swift
//  HomeProj
//
//  Created by MacBook Air 13 Retina 2018 on 24.12.2021.
//

import UIKit

class SignInViewController: UIViewController {
    

    var viewModel = SignInModelView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        confirmButton.layer.cornerRadius = 10
    }
    
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func confirmPressed(_ sender: UIButton) {
        if let email = loginTF.text,let password = passwordTF.text {
            guard email != "",password != "" else {return}
            if viewModel.loadUser(email: email, password: password) {
                self.performSegue(withIdentifier: K.signInToMain, sender: self)
            }
            else {
                present(errorAC(title: "Error", message: "Email or password is wrong,please check it for correctness", buttonText: "Ok"), animated: true, completion: nil)
            }
        }
    }
    
}
