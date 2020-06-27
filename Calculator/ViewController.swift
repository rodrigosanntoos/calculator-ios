//
//  ViewController.swift
//  Calculator
//
//  Created by Rodrigo Santos on 27/06/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberView: UILabel!

    let numberFormatter = NumberFormatter()
    var number: Double = 0
    var sinal: String = ""
    var havePoint: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func addNumber (number: String) {
        numberView.text! += number
    }
    
    func addOperator (sinalButton: String) {
        sinal = sinalButton
        number = numberFormatter.number(from: numberView.text!) as! Double
        numberView.text = ""
    }
    
    func calculate (numberOne: Double, numberTwo: Double, sinal: String) -> Double {
        switch sinal {
        case "/":
            return numberOne / numberTwo
        case "x":
            return numberOne * numberTwo
        case "-":
            return numberOne - numberTwo
        case "+":
            return numberOne + numberTwo
        case "%":
            return 0
        default:
            return 0
        }
    }

    @IBAction func percentageButtonPressed(_ sender: UIButton) {
        addOperator(sinalButton: "%")
    }
    @IBAction func changeSinalButtonPressed(_ sender: UIButton) {
    }
    @IBAction func divisionButtonPressed(_ sender: UIButton) {
        addOperator(sinalButton: "/")
    }
    @IBAction func multipleButtonPressed(_ sender: UIButton) {
        addOperator(sinalButton: "x")
    }
    @IBAction func subtractButtonPressed(_ sender: UIButton) {
        addOperator(sinalButton: "-")
    }
    @IBAction func sumButtonPressed(_ sender: UIButton) {
        addOperator(sinalButton: "+")
    }
    @IBAction func pointButtonPressed(_ sender: UIButton) {
        if (!havePoint) {
            addNumber(number: ".")
            havePoint = true
        }
    }
    @IBAction func equalButtonPressed(_ sender: UIButton) {
        if (sinal != "") {
            let result = calculate(numberOne: number, numberTwo: numberFormatter.number(from: numberView.text!) as! Double, sinal: sinal)
            
            if (floor(result) == result) {
                numberView.text = String(Int(result.rounded(.toNearestOrEven)))
            } else {
                numberView.text = String(result)
            }
        }
    }
    @IBAction func cleanButtonPressed(_ sender: UIButton) {
        numberView.text = ""
        number = 0
        sinal = ""
        havePoint = false
    }
    @IBAction func nineButtonPressed(_ sender: UIButton) {
        addNumber(number: "9")
    }
    @IBAction func eightButtonPressed(_ sender: UIButton) {
        addNumber(number: "8")
    }
    @IBAction func sevenButtonPressed(_ sender: UIButton) {
        addNumber(number: "7")
    }
    @IBAction func sixButtonPressed(_ sender: UIButton) {
        addNumber(number: "6")
    }
    @IBAction func fiveButtonPressed(_ sender: UIButton) {
        addNumber(number: "5")
    }
    @IBAction func fourButtonPressed(_ sender: UIButton) {
        addNumber(number: "4")
    }
    @IBAction func threeButtonPressed(_ sender: UIButton) {
        addNumber(number: "3")
    }
    @IBAction func twoButtonPressed(_ sender: UIButton) {
        addNumber(number: "2")
    }
    @IBAction func oneButtonPressed(_ sender: UIButton) {
        addNumber(number: "1")
    }
    @IBAction func zeroButtonPressed(_ sender: UIButton) {
        addNumber(number: "0")
    }
}

