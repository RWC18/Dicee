//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var roll: UIButton!
    @IBOutlet weak var P1Score: UILabel!
    @IBOutlet weak var P2Score: UILabel!
    @IBOutlet weak var WinnerLabel: UILabel!
    
    var diceSides = [
        UIImage(imageLiteralResourceName: "DiceOne"),
        UIImage(imageLiteralResourceName: "DiceTwo"),
        UIImage(imageLiteralResourceName: "DiceThree"),
        UIImage(imageLiteralResourceName: "DiceFour"),
        UIImage(imageLiteralResourceName: "DiceFive"),
        UIImage(imageLiteralResourceName: "DiceSix")
       ]
    var currentPlayer = 1
    var P1 = 0
    var P2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diceImageView1.image = UIImage(imageLiteralResourceName: "DiceSix")
        diceImageView2.image = UIImage(imageLiteralResourceName: "DiceThree")
        P1Score.text = ""
        P2Score.text = ""
        WinnerLabel.text = ""
    }
    
    func getRandomNum() -> Int {
        return Int.random(in: 0...5)
    }

    @IBAction func rollBtnPress(_ sender: UIButton) {
        var left = getRandomNum()
        var right = getRandomNum()
        diceImageView1.image = diceSides[left]
        diceImageView2.image = diceSides[right]
        if (currentPlayer == 1) {
            P2Score.text = ""
            WinnerLabel.text = ""
            P1 = left+right+2
            P1Score.text = "Player 1: \(P1)"
            P1Score.sizeToFit()
            currentPlayer += 1
        } else if (currentPlayer == 2) {
            P2 = left+right+2
            P2Score.text = "Player 2: \(P2)"
            P2Score.sizeToFit()
            currentPlayer -= 1
        }
        if (P2 > 0 && P1 > 0) {
            if (P1 > P2) {
                WinnerLabel.text = "Player 1 WIN!"
            } else if (P1 < P2) {
                WinnerLabel.text = "Player 2 WIN!"
            } else {
                WinnerLabel.text = "You are friends! :D"
            }
          
            P2 = 0
            P1 = 0
        }
        
    }
    
}

