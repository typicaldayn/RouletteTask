//
//  LoginVC.swift
//  RouletteTask
//
//  Created by Stas Bezhan on 03.08.2022.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let password = passwordTextField.text, let email = emailTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard error != nil else {self?.passwordTextField.placeholder = "incorrect"; return}
                self!.performSegue(withIdentifier: "LoginToGame", sender: self)
            }
        }
    }
}



