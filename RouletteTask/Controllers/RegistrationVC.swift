//
//  RegistrationVC.swift
//  RouletteTask
//
//  Created by Stas Bezhan on 03.08.2022.
//

import UIKit
import FirebaseAuth

class RegistrationVC: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let password = passwordTextField.text, let email = emailTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error{
                    print(error.localizedDescription)
                }else{
                    self.performSegue(withIdentifier: "RegisterToGame", sender: self)
                }
            }
        }
    }
    
    @IBAction func anonymousPressed(_ sender: UIButton) {
        Auth.auth().signInAnonymously { authResult, error in
            if error != nil {
                fatalError("Couldnt sign anonymously")
            }
            guard let user = authResult?.user else { return }
            let isAnonymous = user.isAnonymous  
            let uid = user.uid
            self.performSegue(withIdentifier: "AnonymousToGame", sender: self)
        }
    }
    
}
