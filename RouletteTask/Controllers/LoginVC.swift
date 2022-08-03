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

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginPressed(_ sender: UIButton) {
        if let password = passwordTextField.text, let email = emailTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let e = error{
                    print(e.localizedDescription)
                }else {
                    self!.performSegue(withIdentifier: "LoginPressed", sender: self)
                }
            }
        }
    }
    
    
        
}
