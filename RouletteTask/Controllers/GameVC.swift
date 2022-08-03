//
//  GameVC.swift
//  RouletteTask
//
//  Created by Stas Bezhan on 03.08.2022.
//

import UIKit

class GameVC: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var sizeOfBet: UILabel!
    @IBOutlet weak var changeAmountOfBet: UIStepper!
    @IBOutlet weak var userMoney: UILabel!
    @IBOutlet weak var userName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
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
}
