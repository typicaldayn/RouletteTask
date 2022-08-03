//
//  ViewController.swift
//  RouletteTask
//
//  Created by Stas Bezhan on 03.08.2022.
//

import UIKit
import FirebaseAuth
import StoreKit

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func rateAppPressed(_ sender: UIButton) {
        SKStoreReviewController.requestReview()
    }
    @IBAction func shareAppPressed(_ sender: UIButton) {
        let items = [URL(string: "https://www.apple.com")!] //change url to apps url on appstore
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
    }
    
    @IBAction func logOutPressed(_ sender: UIButton) {
    }
    
    @IBAction func deleteAccountPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Delete an account", message: "Are you sure you want to delete your account?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { [weak self] action in
            let user = Auth.auth().currentUser
            print(user)
            user?.delete { error in
              if let error = error {
                  print(error.localizedDescription)
              } else {
                  self?.tabBarController?.dismiss(animated: true)
              }
            }
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel))
        present(alert, animated: true)
    }
}

