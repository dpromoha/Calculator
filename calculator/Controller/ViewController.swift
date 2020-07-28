//
//  ViewController.swift
//  calculator
//
//  Created by Daria Pr on 08.07.2020.
//  Copyright © 2020 Daria. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultsNumber: UILabel!
    @IBOutlet weak var acLabel: UIButton!
    @IBOutlet weak var plusMinusLabel: UIButton!
    @IBOutlet weak var percentLabel: UIButton!
    @IBOutlet weak var divideLabel: UIButton!
    @IBOutlet weak var multipleLabel: UIButton!
    @IBOutlet weak var minusLabel: UIButton!
    @IBOutlet weak var plusLabel: UIButton!
    @IBOutlet weak var equalLabel: UIButton!

    var color = Color()
    var operation = Operations()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func AC(_ sender: UIButton) {
        resultsNumber.text = "0"
        operation.initialize()
    }
    
    @IBAction func PositiveOrNegative(_ sender: UIButton) {
        if operation.firstArgument == "" {
            return
        } else {
            if operation.firstArgumentPressed == true {
                resultsNumber.text = operation.positOrNegFirstArgument()
            } else if operation.firstArgumentPressed == false {
                resultsNumber.text = operation.positOrNegSecondArgument()
            }
        }
    }
    
    
    @IBAction func signs(_ sender: UIButton) {
        if let signCheck = sender.currentTitle {
            resultsNumber.text = operation.sign(checkSign: signCheck)
        }
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        if let argument = sender.currentTitle {
            resultsNumber.text = operation.numbers(argument: argument)
        }
    }
    
    @IBAction func changeColorTheme(_ sender: UIButton) {
        color.countColorTurn+=1
        if color.countColorTurn == 6 {
            color.countColorTurn = 0
        }
        let colorChange = color.changeColor(countColorTurn: color.countColorTurn)
        acLabel.backgroundColor = colorChange
        plusLabel.backgroundColor = colorChange
        plusMinusLabel.backgroundColor = colorChange
        percentLabel.backgroundColor = colorChange
        minusLabel.backgroundColor = colorChange
        multipleLabel.backgroundColor = colorChange
        divideLabel.backgroundColor = colorChange
        equalLabel.backgroundColor = colorChange
    }
    
    @IBAction func commaPressed(_ sender: UIButton) {
        if operation.firstArgumentPressed == true {
            resultsNumber.text = operation.commaFirstArg()
        } else {
            resultsNumber.text = operation.commaSecondArg()
        }
    }
    
    @IBAction func whatTheResult(_ sender: UIButton) {
        resultsNumber.text = operation.operationResult(firstArg: operation.firstArgument, secondArg: operation.secondArgument, sign: operation.sign)
        operation.initialize()
    }
}
