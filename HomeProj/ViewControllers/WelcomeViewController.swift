//
//  ViewController.swift
//  HomeProj
//
//  Created by MacBook Air 13 Retina 2018 on 24.12.2021.
//




import UIKit
import FBSDKLoginKit

class WelcomeViewController: UIViewController{

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loginButton = FBLoginButton(frame: CGRect(x: 80, y: 600, width: 280, height: 40))
        loginButton.delegate = self
        loginButton.permissions = ["public_profile","email"]
        view.addSubview(loginButton)
        
        if let token = AccessToken.current,!token.isExpired {
            self.performSegue(withIdentifier: K.facebookToMain, sender: self)
        }
    }  
}

//MARK: - Extension LoginButtonDelegate

extension WelcomeViewController:LoginButtonDelegate {
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
            self.performSegue(withIdentifier: K.facebookToMain, sender: self)
    }
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }
}
