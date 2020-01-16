//
//  ViewController.swift
//  DiceRoller
//
//  Created by AJ Radik on 12/9/19.
//  Copyright © 2019 AJ Radik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setDice(Int(slider.value-1))
    }
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    let diceImages = [#imageLiteral(resourceName: "dice1"), #imageLiteral(resourceName: "dice2"), #imageLiteral(resourceName: "dice3"), #imageLiteral(resourceName: "dice4"), #imageLiteral(resourceName: "dice5"), #imageLiteral(resourceName: "dice6")]
    @IBOutlet var dice: [UIImageView]!
    
    @IBAction func rollTapped(_ sender: Any) {
        var sum = 0
        for die in dice {
            if die.isHidden {
                continue
            }
            let rollNum = Int.random(in: 1...diceImages.count)
            sum += rollNum
            die.image = diceImages[rollNum-1]
        }
        totalLabel.text! = "Total: " + "\(sum)"
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        setDice(Int(sender.value-1))
    }
    
    func setDice(_ value: Int) {
        for i in (0...value) {
            dice[i].isHidden = false
        }
        if value == 5 {
            return
        }
        for i in (value+1...5) {
            dice[i].isHidden = true
        }
        
    }
}
