//
//  RegistrationVC.swift
//  RouletteTask
//
//  Created by Stas Bezhan on 03.08.2022.
//

import UIKit
import FirebaseAuth
import Firebase

class RegistrationVC: UIViewController {
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let password = passwordTextField.text, let email = emailTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
                if let error = error{
                    print(error.localizedDescription)
                }else{
                    self?.db.collection("Users").addDocument(data: ["email": email, "countOfGames": 0, "money": 2000, "name": self?.usernameTextField.text ?? "Anonymous", "win rate": 0 ])
                    self?.performSegue(withIdentifier: "RegisterToGame", sender: self)
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
