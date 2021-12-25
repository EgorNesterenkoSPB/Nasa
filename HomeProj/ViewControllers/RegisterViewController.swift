//
//  RegisterViewController.swift
//  HomeProj
//
//  Created by MacBook Air 13 Retina 2018 on 24.12.2021.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let viewModel = RegisterViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        confirmButton.layer.cornerRadius = 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(Realm.Configuration.defaultConfiguration.fileURL)
    }
    
    @IBAction func confirmPressed(_ sender: UIButton) {
        
        if let email = loginTF.text,let password = passwordTF.text{
        guard email != "",password != "" else {return}
            viewModel.createUser(email: email, password: password)
        }
        if let _ = viewModel.error {
            present(errorAC(title: "Error", message: "Coudnt register the user, please try again!", buttonText: "Ok"), animated: true, completion: nil)
        }
        else {
            self.performSegue(withIdentifier: K.registerToMain, sender: self)
        }
    }
    
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
}
