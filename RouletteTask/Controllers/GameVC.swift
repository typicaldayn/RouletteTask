//
//  GameVC.swift
//  RouletteTask
//
//  Created by Stas Bezhan on 03.08.2022.
//

import UIKit
import Firebase
import FirebaseAuth

class GameVC: UIViewController {

    var currentUser = Auth.auth().currentUser?.email
    var username: String = ""
    let dataBase = Firestore.firestore()
    var typesOfBet: [Dictionary<Int, String>] =  [[0: "Green"]]
    let result: Dictionary<Int, String>? = [:]
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var sizeOfBet: UILabel!
    @IBOutlet weak var changeAmountOfBet: UIStepper!
    @IBOutlet weak var userMoney: UILabel!
    @IBOutlet weak var userName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUser()
        sizeOfBet.text = "0"
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func sizeOfBetChange(_ sender: UIStepper) {
        guard let userMoney = Double(userMoney.text!) else {return}
        if userMoney <= 10 {
            sender.isEnabled = false
        }
        sender.maximumValue = userMoney
        sender.stepValue = userMoney / 10
        sizeOfBet.text = String(format: "%0.f", sender.value)
    }
    
    @IBAction func typeOfBetChoosen(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            sender.alpha = 1
        }else{
            sender.isSelected = true
            sender.alpha = 0.5
        }
    }
    
    func loadUser() {
        FBManager.shared.getUser(collectionName: "Users", userEmail: currentUser ?? "1@2.com") { [weak self] userInfo in
            self?.userMoney.text = String(userInfo?.money ?? 100)
            self?.userName.text = userInfo?.name
        }
    }
    
}
